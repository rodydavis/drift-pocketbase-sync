import 'dart:convert';
import 'dart:developer' as dev;

import 'package:drift/drift.dart';
import 'package:pocketbase/pocketbase.dart';

import 'database.dart';
import 'sql/generated.dart';
import 'mapper.dart';

class SyncService {
  final Database db;
  final PocketBase pb;
  final Map<Collections, TableInfo<Table, PBCollection>> mapper;
  final Map<Collections, void Function()> _cleanup = {};
  final Map<Collections, bool> _syncing = {};

  SyncService(this.db, this.pb) : mapper = createMapper(db);

  // TODO: Sync with filter based in the schema
  Future<void> syncCollections([Iterable<Collections>? collections]) async {
    final list = collections ?? Collections.values;

    try {
      for (final collection in list) {
        await syncCollection(collection);
      }
    } catch (e) {
      log('error syncing collections: ${list.map((e) => e.name).join(',')} - $e');
    }
  }

  // Future<void> syncRemoteDeletedRecords() async {
  //   // Fetch most recent local deleted record updated date
  //   final sql = StringBuffer();
  //   sql.write('SELECT * FROM ${Collections.changes.sql} ');
  //   sql.write("WHERE action = 'delete' ");
  //   sql.write("ORDER BY updated ");
  //   sql.write("LIMIT 1;");

  //   final changesTbl = mapper[Collections.changes]!;

  //   final newestDeleted = await db
  //       .customSelect(sql.toString(), readsFrom: {changesTbl})
  //       .asyncMap(changesTbl.mapFromRow)
  //       .getSingleOrNull()
  //       .then((r) => (r is PBBase) ? r.updated.pbDate : null);

  //   // Fetch remote deleted records
  //   final deletedRecords = await pb //
  //       .collection(Collections.changes.id)
  //       .getFullList(
  //         filter: newestDeleted == null
  //             ? null
  //             : "updated >= '$newestDeleted' && action = 'delete'",
  //       );
  //   // Apply deletes locally to prevent updating deleted records
  //   await db.transaction(() async {
  //     for (final collection in Collections.values) {
  //       final ids = deletedRecords
  //           .where((e) => e.getStringValue('collection_id') == collection.id)
  //           .map((e) => e.getStringValue('record_id'))
  //           .toList();
  //       final sql = StringBuffer();
  //       sql.write('DELETE FROM ${collection.sql} ');
  //       sql.write('WHERE id IN ${_args(db, ids)};');
  //       final tbl = mapper[collection];
  //       await db.customUpdate(
  //         sql.toString(),
  //         variables: _vars(db, ids),
  //         updates: {if (tbl != null) tbl},
  //         updateKind: UpdateKind.delete,
  //       );
  //     }
  //   });
  // }

  Future<void> syncCollection(Collections collection) async {
    if (_syncing[collection] == true) return;
    _syncing[collection] = true;
    log('syncing collection: ${collection.name}');

    final tbl = mapper[collection];
    if (tbl == null) return;

    try {
      final fetchKey = '${collection.id}-last-fetch';

      final lastFetch = await db.getItem(key: fetchKey).getSingleOrNull();

      // Fetch remote deleted records
      final deletedRecords = await pb //
          .collection(Collections.changes.id)
          .getFullList(
            filter: lastFetch == null
                ? null
                : "updated >= '$lastFetch' && action = 'delete'",
          );

      // Apply deletes locally to prevent updating deleted records
      await db.transaction(() async {
        final ids = deletedRecords
            .where((e) => e.getStringValue('collection_id') == collection.id)
            .map((e) => e.getStringValue('record_id'))
            .toList();
        final sql = StringBuffer();
        sql.write('DELETE FROM ${collection.sql} ');
        sql.write('WHERE id IN ${_args(db, ids)};');
        final tbl = mapper[collection];
        await db.customUpdate(
          sql.toString(),
          variables: _vars(db, ids),
          updates: {if (tbl != null) tbl},
          updateKind: UpdateKind.delete,
        );
      });

      final sql = StringBuffer();
      sql.write('SELECT * FROM ${collection.sql};');
      final local = await db
          .customSelect(sql.toString(), readsFrom: {tbl})
          .asyncMap(tbl.mapFromRow)
          .get();

      // Fetch remote changes after date (apply LWW)
      final remoteRecords = await pb.collection(collection.id).getFullList(
            filter: lastFetch == null ||
                    local.isEmpty ||
                    collection.type == CollectionType.view
                ? null
                : "updated > '$lastFetch'",
          );

      await db.transaction(() async {
        if (collection.type == CollectionType.view) {
          final sql = StringBuffer();
          sql.write('DELETE FROM ${collection.sql};');
          await db.customUpdate(
            sql.toString(),
            updateKind: UpdateKind.delete,
          );
        }
        for (final record in remoteRecords) {
          final sql = StringBuffer();
          sql.write('SELECT * FROM ${collection.sql} ');
          sql.write('WHERE id = ?;');
          final result = await db
              .customSelect(
                sql.toString(),
                variables: [Variable(record.id)],
                readsFrom: {tbl},
              )
              .asyncMap(tbl.mapFromRow)
              .getSingleOrNull();
          if (result != null && result is PBBase) {
            final recordUpdated = DateTime.parse(record.updated);
            final remoteNewer = _isNewer(recordUpdated, result.updated);
            if (remoteNewer) {
              await _updateItem(collection, record);
            } else {
              // Skip local update (will be updated later)
            }
          } else if (result == null) {
            await _insertItem(collection, record);
          }
        }
        final lastFetchDate = DateTime.now().toUtc().pbDate;
        await db.setItem(key: fetchKey, value: lastFetchDate);
      });

      if (collection.type != CollectionType.view) {
        // Fetch and push local changes (create/update/delete)
        final sql = StringBuffer();
        sql.write('SELECT * FROM ${collection.sql} ');
        sql.write('WHERE synced = ?;');
        final local = await db
            .customSelect(
              sql.toString(),
              variables: [const Variable(false)],
              readsFrom: {tbl},
            )
            .asyncMap(tbl.mapFromRow)
            .get();
        await _sendChanges(collection, local);
      }
    } catch (e) {
      log('error syncing collection: ${collection.name} - $e');
    } finally {
      _syncing[collection] = false;
    }
  }

  Future<void Function()> realtimeCollection(
    Collections collection,
  ) async {
    final cleanup = <void Function()>[];
    final remoteDispose = await realtimeRemoteToLocalCollection(collection);
    cleanup.add(remoteDispose);
    final localDispose = await realtimeLocalToRemoteCollection(collection);
    cleanup.add(localDispose);
    return () {
      for (final cb in cleanup) {
        cb();
      }
    };
  }

  Future<void Function()> realtimeLocalToRemoteCollection(
    Collections collection,
  ) async {
    final tbl = mapper[collection];
    if (tbl == null) return () {};
    final sql = StringBuffer();
    sql.write('SELECT * FROM ${collection.sql} ');
    sql.write('WHERE synced = ?;');
    final stream = db
        .customSelect(
          sql.toString(),
          variables: [const Variable(false)],
          readsFrom: {tbl},
        )
        .asyncMap(tbl.mapFromRow)
        .watch();
    final controller = stream.listen((items) async {
      await _sendChanges(collection, items);
    });
    return controller.cancel;
  }

  Future<void Function()> realtimeRemoteToLocalCollection(
    Collections collection, {
    String topic = '*',
    String? filter,
  }) async {
    if (_cleanup[collection] != null) return _cleanup[collection]!;
    _cleanup[collection] = () {};
    final dispose = await pb //
        .collection(collection.id)
        .subscribe(filter: filter, topic, (e) async {
      final r = e.record;
      if (r == null) return;
      switch (e.action) {
        case 'create':
          await _insertItem(collection, r);
          break;
        case 'update':
          await _updateItem(collection, r);
          break;
        case 'delete':
          await _deleteItem(collection, r.id);
          break;
        default:
          break;
      }
    });
    _cleanup[collection] = dispose;
    return dispose;
  }

  Future<void> _sendChanges(
    Collections collection,
    List<PBCollection> items,
  ) async {
    final tbl = mapper[collection];
    if (tbl == null) return;
    for (final item in items.whereType<PBBase>()) {
      await db.transaction(() async {
        // Try to update on server
        try {
          final data = item.toMap();
          for (final field in _coreFields) {
            data.remove(field);
          }
          data.remove('created');
          data.remove('updated');
          if (item.fresh) {
            if (!item.deleted) {
              await pb //
                  .collection(collection.id)
                  .create(body: data);
            } else {
              // Do not sync local only fresh item
            }
          } else if (item.deleted) {
            await pb //
                .collection(collection.id)
                .delete(item.id);
          } else {
            data.remove('id');
            await pb //
                .collection(collection.id)
                .update(item.id, body: data);
          }
          if (item.deleted) {
            await _deleteItem(collection, item.id);
          } else {
            await _setSyncStatus(collection, item);
          }
        } catch (e) {
          // TODO: Handle expecptions
          // Maybe save KV of count of retry then delete
          if (e is ClientException) {
            if ([400, 403, 404].contains(e.statusCode)) {
              await _deleteItem(collection, item.id);
            }
          }
        }
      });
    }
  }

  Future<void> _setSyncStatus(
    Collections collection,
    PBCollection item, {
    bool synced = true,
    bool fresh = false,
  }) async {
    final tbl = mapper[collection];
    if (tbl == null) return;
    // Update sync status for records
    final sql = StringBuffer();
    sql.write('UPDATE ${collection.sql} SET ');
    sql.write(' synced = ?,');
    sql.write(' fresh = ?');
    sql.write('WHERE id = ?;');
    await db.customUpdate(
      sql.toString(),
      variables: [
        Variable(synced),
        Variable(fresh),
        Variable(item.id),
      ],
      updates: {tbl},
      updateKind: UpdateKind.update,
    );
  }

  Future<void> _updateItem(Collections collection, RecordModel record) async {
    final tbl = mapper[collection];
    if (tbl == null) return;
    // Update local (remote newer)
    final sql = StringBuffer();
    sql.write('UPDATE ${collection.sql} SET ');
    final entries = record
        .toJson() //
        .entries
        .where((e) => !['id', ..._coreFields].contains(e.key))
        .toList();
    for (var i = 0; i < entries.length; i++) {
      final MapEntry(:key) = entries[i];
      sql.write('$key = ?, ');
    }
    sql.write(' synced = ?, fresh = ?');
    sql.write(' WHERE id = ?;');
    await db.customUpdate(
      sql.toString(),
      variables: [
        for (final MapEntry(:value) in entries) variable(value),
        const Variable(true),
        const Variable(false),
        Variable(record.id),
      ],
      updates: {tbl},
      updateKind: UpdateKind.update,
    );
  }

  Future<void> _deleteItem(Collections collection, String id) async {
    final tbl = mapper[collection];
    if (tbl == null) return;
    // Hard delete locally
    final sql = StringBuffer();
    sql.write('DELETE FROM ${collection.sql} ');
    sql.write('WHERE id = ?;');
    await db.customUpdate(
      sql.toString(),
      variables: [Variable(id)],
      updates: {tbl},
      updateKind: UpdateKind.delete,
    );
  }

  Future<void> _insertItem(Collections collection, RecordModel record) async {
    final tbl = mapper[collection];
    if (tbl == null) return;
    final sql = StringBuffer();
    sql.write('INSERT OR REPLACE INTO ${collection.sql}(');
    final entries = record //
        .toJson()
        .entries
        .where((e) => !_coreFields.contains(e.key))
        .toList();
    for (var i = 0; i < entries.length; i++) {
      final MapEntry(:key) = entries[i];
      sql.write(' $key, ');
    }
    sql.write(' synced,');
    sql.write(' fresh');
    sql.write(') VALUES (');
    for (var i = 0; i < entries.length; i++) {
      sql.write('?, ');
    }
    sql.writeln('?, ');
    sql.writeln('? ');
    sql.writeln(');');
    await db.customUpdate(
      sql.toString(),
      variables: [
        for (final MapEntry(:value) in entries) variable(value),
        const Variable(true),
        const Variable(false),
      ],
      updates: {tbl},
      updateKind: UpdateKind.insert,
    );
  }

  void dispose() {
    for (final cb in _cleanup.values) {
      cb();
    }
  }

  void log(String e) => dev.log(e);
}

const _coreFields = [
  'synced',
  'fresh',
  'deleted',
  'expand',
  'collectionId',
  'collectionName',
];

String _args<T>(Database db, List<T> list) {
  var $idx = 1;
  final args = db.$expandVar($idx, list.length);
  $idx += list.length;
  return '($args)';
}

List<Variable<T>> _vars<T extends Object>(Database db, List<T> list) {
  return [for (var $ in list) Variable($)];
}

extension on DateTime {
  String get pbDate {
    final d = this;
    // final fmt = DateFormat('yyyy-MM-dd HH:mm:ss');
    // final result = fmt.format(d);
    return d.toString().replaceFirst('T', ' ');
  }
}

Variable variable(dynamic val) {
  if (val is Map) return Variable(jsonEncode(val));
  return Variable(val);
}

bool _isNewer(DateTime src, DateTime target) {
  final a = _dateWithoutNormalize(src);
  final b = _dateWithoutNormalize(target);
  return a.isAfter(b);
}

DateTime _dateWithoutNormalize(DateTime src) {
  // return src.copyWith(microsecond: 0, millisecond: 0);
  return src;
}
