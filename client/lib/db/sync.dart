import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:intl/intl.dart';
import 'package:pocketbase/pocketbase.dart';

import 'database.dart';
import 'sql/generated.dart';
import 'mapper.dart';

class SyncService {
  final Database db;
  final PocketBase pb;
  final Map<Collections, TableInfo<Table, PBCollection>> mapper;

  SyncService(this.db, this.pb) : mapper = createMapper(db);

  Future<void> syncCollections([Iterable<Collections>? collections]) async {
    await syncRemoteDeletedRecords();

    for (final collection in collections ?? Collections.values) {
      await syncCollection(collection);
    }
  }

  Future<void> syncRemoteDeletedRecords() async {
    // Fetch most recent local deleted record updated date
    final newestDeleted = await db //
        .deletedRecordsGetFreshest()
        .getSingleOrNull()
        .then((r) => r?.updated.pbDate);
    // Fetch remote deleted records
    final deletedRecords = await pb //
        .collection(Collections.deletedRecords.id)
        .getFullList(
          filter: newestDeleted == null ? null : "updated > '$newestDeleted'",
        );
    // Apply deletes locally to prevent updating deleted records
    await db.transaction(() async {
      for (final collection in Collections.values) {
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
      }
    });
  }

  Future<void> syncCollection(Collections collection) async {
    final tbl = mapper[collection];
    if (tbl == null) return;
    final fetchKey = '${collection.id}-last-fetch';
    final lastFetch = await db.getItem(key: fetchKey).getSingleOrNull();

    // Fetch remote changes after date (apply LWW)
    final remoteRecords = await pb.collection(collection.id).getFullList(
          filter: lastFetch == null || collection.type == CollectionType.view
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
          final remoteNewer = recordUpdated.isAfter(result.updated);
          if (remoteNewer) {
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
          } else {
            // Skip local update (will be updated later)
          }
        } else if (result == null) {
          final sql = StringBuffer();
          sql.write('INSERT INTO ${collection.sql}(');
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
      }
      final lastFetchDate = DateTime.now().pbDate;
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
      for (final item in local.whereType<PBBase>()) {
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
              // Hard delete locally
              final sql = StringBuffer();
              sql.write('DELETE FROM ${collection.sql} ');
              sql.write('WHERE id = ?;');
              await db.customUpdate(
                sql.toString(),
                variables: [Variable(item.id)],
                updates: {tbl},
                updateKind: UpdateKind.delete,
              );
            } else {
              // Update sync status for records
              final sql = StringBuffer();
              sql.write('UPDATE ${collection.sql} SET ');
              sql.write(' synced = ?,');
              sql.write(' fresh = ?');
              sql.write('WHERE id = ?;');
              await db.customUpdate(
                sql.toString(),
                variables: [
                  const Variable(true),
                  const Variable(false),
                  Variable(item.id),
                ],
                updates: {tbl},
                updateKind: UpdateKind.update,
              );
            }
          } catch (e) {
            // TODO: Handle expecptions
            // Maybe save KV of count of retry then delete
          }
        });
      }
    }
  }
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
    final d = toUtc();
    final fmt = DateFormat('yyyy-MM-dd HH:mm:ss');
    final result = fmt.format(d);
    return result;
  }
}

Variable variable(dynamic val) {
  if (val is Map) return Variable(jsonEncode(val));
  return Variable(val);
}
