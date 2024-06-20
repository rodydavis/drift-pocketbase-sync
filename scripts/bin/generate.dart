import 'dart:convert';
import 'dart:io';

import 'package:pocketbase/pocketbase.dart';
import 'package:recase/recase.dart';

const dateFunc = "now()"; // datetime('now')
const idFunc = "newId()";

void main(List<String> args) async {
  const username = String.fromEnvironment('ADMIN_USERNAME');
  const password = String.fromEnvironment('ADMIN_PASSWORD');
  const url = String.fromEnvironment('PB_URL');

  final pb = PocketBase(url);
  await pb.admins.authWithPassword(username, password);

  if (args.contains('--import')) {
    // Import schema
    const schemaPath = "../pb_schema.json";
    final jsonData = jsonDecode(File(schemaPath).readAsStringSync());
    await pb.collections.import(
      jsonData,
      deleteMissing: true,
    );
  }

  // Get collections
  final collections = await pb.collections.getFullList();
  {
    final result = createDriftFile(collections).join('\n');
    const outFile = "../client/lib/db/sql/generated.drift";
    File(outFile).writeAsStringSync(result);
  }
  {
    final result = createClasses(collections).join('\n');
    const outFile = "../client/lib/db/sql/generated.dart";
    File(outFile).writeAsStringSync(result);
  }
  {
    final result = createMapper(collections).join('\n');
    const outFile = "../client/lib/db/mapper.dart";
    File(outFile).writeAsStringSync(result);
  }
}

Iterable<String> createDriftFile(List<CollectionModel> collections) sync* {
  yield "import 'generated.dart';";
  yield '';
  yield "-- Tables --";
  for (final col in collections) {
    yield '';
    yield "CREATE TABLE ${escapeName(col.name)} (";
    for (var i = 0; i < col.fields.length; i++) {
      final field = col.fields[i];
      yield () {
        final sb = StringBuffer();
        sb.write("    ${escapeName(field.name)} ");
        sb.write(field.sqlType);
        if (field.required) {
          sb.write(' NOT NULL');
        }
        if (field.name == "id") {
          sb.write(" PRIMARY KEY");
        }
        if (field.options['default_value'] != null || field.name == 'id') {
          sb.write(' DEFAULT (');
          if (field.name == 'id') {
            sb.write('$idFunc');
          } else {
            sb.write(field.options['default_value'].toString());
          }
          sb.write(')');
        }
        if (field.type == "relation") {
          final targetId = field.options['collectionId'] as String;
          final target = collections.firstWhere((e) => e.id == targetId);
          final targetName = target.name;
          sb.write(" REFERENCES ${escapeName(targetName)} (id)");
          if (field.options["cascadeDelete"] == true) {
            sb.write(" ON DELETE CASCADE ON UPDATE CASCADE");
          }
        }
        sb.write(i == col.fields.length - 1 ? '' : ',');
        return sb.toString();
      }();
    }
    yield ") WITH ${className(col.name)};";
  }
  yield '';
  yield "-- Indexes --";
  for (final col in collections) {
    for (final index in col.indexes) {
      yield '';
      yield index.replaceAll('`', '"') + ";";
    }
  }
  yield '';
  yield "-- Queries --";
  for (final col in collections) {
    final name = col.name.camelCase;
    // Get all
    yield '';
    yield "${name}GetAll:";
    yield "SELECT * FROM ${escapeName(col.name)};";
    // Get one
    yield '';
    yield "${name}GetOne:";
    yield "SELECT * FROM ${escapeName(col.name)}";
    yield "WHERE id = :id;";
    if (col.type == "base") {
      yield '';
      yield "${name}GetUnsynced:";
      yield "SELECT * FROM ${escapeName(col.name)}";
      yield "WHERE synced = false;";
    }
    if (col.type != 'view') {
      // Delete one
      yield '';
      yield "${name}HardDeleteOne:";
      yield "DELETE FROM ${escapeName(col.name)}";
      yield "WHERE id = :id;";
      yield '';
      yield "${name}SoftDeleteOne:";
      yield "UPDATE ${escapeName(col.name)} SET";
      yield "deleted = true, synced = false";
      yield "WHERE id = :id;";
      yield '';
      yield "${name}RestoreSoftDeleteOne:";
      yield "UPDATE ${escapeName(col.name)} SET";
      yield "deleted = false, synced = false";
      yield "WHERE id = :id;";
      // Delete multi
      yield '';
      yield "${name}HardDeleteMulti:";
      yield "DELETE FROM ${escapeName(col.name)}";
      yield "WHERE id IN :ids;";
      yield '';
      yield "${name}SoftDeleteMulti:";
      yield "UPDATE ${escapeName(col.name)} SET";
      yield "deleted = true, synced = false";
      yield "WHERE id IN :ids;";
      yield '';
      yield "${name}RestoreSoftDeleteMulti:";
      yield "UPDATE ${escapeName(col.name)} SET";
      yield "deleted = false, synced = false";
      yield "WHERE id IN :ids;";
      // Set Sync Status
      yield '';
      yield "${name}SetSyncStatusOne:";
      yield "UPDATE ${escapeName(col.name)} SET";
      yield "synced = :value";
      yield "WHERE id = :id;";
      yield '';
      yield "${name}SetSyncStatusMulti:";
      yield "UPDATE ${escapeName(col.name)} SET";
      yield "synced = :value";
      yield "WHERE id IN :ids;";
      // Insert one
      yield '';
      yield "${name}Insert:";
      yield "INSERT INTO ${escapeName(col.name)} (";
      for (var i = 0; i < col.coreFields.length; i++) {
        final field = col.coreFields[i];
        yield "  ${escapeName(field.name)},";
      }
      yield '  synced,';
      yield '  fresh,';
      yield '  created,';
      yield '  updated';
      yield ")";
      yield "VALUES(";
      for (var i = 0; i < col.coreFields.length; i++) {
        final field = col.coreFields[i];
        yield "  :${varName(field.name)},";
      }
      yield '  false,';
      yield '  true,';
      yield "  $dateFunc,";
      yield "  $dateFunc";
      yield ") RETURNING *;";
      // Insert one with id
      yield '';
      yield "${name}InsertWithId:";
      yield "INSERT OR REPLACE INTO ${escapeName(col.name)} (";
      yield '  id,';
      for (var i = 0; i < col.coreFields.length; i++) {
        final field = col.coreFields[i];
        yield "  ${escapeName(field.name)},";
      }
      yield '  synced,';
      yield '  fresh,';
      yield '  created,';
      yield '  updated';
      yield ")";
      yield "VALUES(";
      yield '  :id,';
      for (var i = 0; i < col.coreFields.length; i++) {
        final field = col.coreFields[i];
        yield "  :${varName(field.name)},";
      }
      yield '  false,';
      yield '  true,';
      yield "  $dateFunc,";
      yield "  $dateFunc";
      yield ") RETURNING *;";
      // Update one
      yield '';
      yield "${name}Update:";
      yield "UPDATE ${escapeName(col.name)} SET";
      for (var i = 0; i < col.coreFields.length; i++) {
        final field = col.coreFields[i];
        yield "  ${escapeName(field.name)} = :${varName(field.name)},";
      }
      yield '  synced = false,';
      yield '  fresh = false,';
      yield "  updated = $dateFunc";
      yield "WHERE id = :id;";

      // Relation queries
      if (col.schema.any((e) => e.type == 'relation')) {
        for (final item in col.schema.where((e) => e.type == 'relation')) {
          yield '';
          yield "${name}GetBy${item.name.pascalCase}:";
          yield "SELECT * FROM ${escapeName(col.name)} ";
          yield 'WHERE "${item.name}" = :${item.name.camelCase};';
        }
      }
    }
  }
  yield '';
}

Iterable<String> createMapper(List<CollectionModel> collections) sync* {
  yield "import 'package:drift/drift.dart';";
  yield "import 'sql/generated.dart';";
  yield "import 'database.dart';";
  yield '';

  yield 'Map<Collections, TableInfo<Table, PBCollection>> createMapper(Database db) {';
  yield '  return <Collections, TableInfo<Table, PBCollection>>{';
  for (var i = 0; i < collections.length; i++) {
    final col = collections[i];
    yield '    Collections.${col.name.camelCase}: db.${col.name.camelCase},';
  }
  yield '  };';
  yield '}';
  yield '';
}

Iterable<String> createClasses(List<CollectionModel> collections) sync* {
  yield "import 'package:dart_mappable/dart_mappable.dart';";
  yield '';
  yield "part 'generated.mapper.dart';";
  yield '';
  yield 'enum CollectionType {';
  yield '  base,';
  yield '  auth,';
  yield '  view';
  yield '}';
  yield '';
  yield 'enum Collections {';
  for (var i = 0; i < collections.length; i++) {
    final col = collections[i];
    final last = i == collections.length - 1;
    var line = '  ${col.name.camelCase}(';
    line += '"${col.id}", "${col.name}", ';
    line += '\'${escapeName(col.name)}\', ';
    line += 'CollectionType.${col.type}';
    line += ')';
    yield "  $line${last ? ';' : ','}";
  }
  yield '';
  yield '  const Collections (this.id, this.name, this.sql, this.type);';
  yield '  final String id, name, sql;';
  yield '  final CollectionType type;';
  yield '}';
  yield '';
  yield 'sealed class PBCollection {';
  yield '  final String id;';
  yield '  PBCollection({';
  yield '    required this.id,';
  yield '  });';
  yield '}';
  yield '';
  yield '@MappableClass()';
  yield 'class PBBase extends PBCollection with PBBaseMappable {';
  yield '  final bool synced;';
  yield '  final bool fresh;';
  yield '  final bool deleted;';
  yield '  final DateTime created;';
  yield '  final DateTime updated;';
  yield '  PBBase({';
  yield '    required super.id,';
  yield '    required this.synced,';
  yield '    required this.fresh,';
  yield '    required this.deleted,';
  yield '    required this.created,';
  yield '    required this.updated,';
  yield '  });';
  yield '}';
  yield '';
  yield '@MappableClass()';
  yield 'class PBView extends PBCollection with PBViewMappable {';
  yield '  PBView({';
  yield '    required super.id,';
  yield '  });';
  yield '}';
  yield '';
  yield '@MappableClass()';
  yield 'class PBAuth extends PBBase with PBAuthMappable {';
  yield '  final String? username;';
  yield '  final String? email;';
  yield '  final bool? emailVisibility;';
  yield '  final bool? verified;';
  yield '  PBAuth({';
  yield '    required super.id,';
  yield '    required super.created,';
  yield '    required super.updated,';
  yield '    required super.fresh,';
  yield '    required super.synced,';
  yield '    required super.deleted,';
  yield '    required this.username,';
  yield '    required this.email,';
  yield '    required this.emailVisibility,';
  yield '    required this.verified,';
  yield '  });';
  yield '}';
  yield '';
  for (final col in collections) {
    yield '@MappableClass()';
    final type = switch (col.type) {
      'base' => 'PBBase',
      'view' => 'PBView',
      'auth' => 'PBAuth',
      (_) => 'PBCollection',
    };
    yield 'class ${className(col.name)} extends $type with ${className(col.name)}Mappable {';
    for (var i = 0; i < col.schema.length; i++) {
      final field = col.schema[i];
      yield "  @MappableField(key: '${field.name}')";
      yield "  final ${field.dartType} ${field.name.camelCase};";
      yield '';
    }
    yield '  ${className(col.name)}({';
    for (var i = 0; i < col.fields.length; i++) {
      final field = col.fields[i];
      final isCore = !col.schema.map((e) => e.name).contains(field.name);
      yield '    ${field.required || isCore ? 'required ' : ''}${isCore ? 'super' : 'this'}.${field.name.camelCase},';
    }
    yield '  });';
    yield '}';
  }
  yield '';
}

extension on CollectionModel {
  List<SchemaField> get coreFields {
    final fields = <SchemaField>[];
    if (type == "auth") {
      fields.addAll([
        SchemaField(
          id: 'username',
          name: 'username',
          type: 'text',
          required: false,
        ),
        SchemaField(
          id: 'email',
          name: 'email',
          type: 'text',
          required: true,
        ),
        SchemaField(
          id: 'emailVisibility',
          name: 'emailVisibility',
          type: 'bool',
          required: false,
        ),
        SchemaField(
          id: 'verified',
          name: 'verified',
          type: 'bool',
          required: false,
        ),
      ]);
    }
    fields.addAll(schema.toList());
    return fields;
  }

  List<SchemaField> get fields {
    final fields = <SchemaField>[];
    fields.add(
      SchemaField(
        id: 'id',
        name: 'id',
        type: 'TEXT',
        required: true,
      ),
    );
    fields.addAll(coreFields);
    if (type == "base" || type == "auth") {
      fields.addAll([
        SchemaField(
          id: 'created',
          name: 'created',
          type: 'date',
          required: true,
        ),
        SchemaField(
          id: 'updated',
          name: 'updated',
          type: 'date',
          required: true,
        ),
      ]);
    }
    if (type != "view") {
      fields.addAll([
        SchemaField(
          id: 'deleted',
          name: 'deleted',
          type: 'bool',
          required: true,
          options: {
            "default_value": false,
          },
        ),
        SchemaField(
          id: 'synced',
          name: 'synced',
          type: 'bool',
          required: true,
          options: {
            "default_value": false,
          },
        ),
        SchemaField(
          id: 'fresh',
          name: 'fresh',
          type: 'bool',
          required: true,
          options: {
            "default_value": true,
          },
        ),
      ]);
    }
    return fields;
  }
}

extension on SchemaField {
  String get sqlType {
    return switch (type) {
      "text" => "TEXT",
      "number" => "REAL",
      "bool" => "BOOLEAN",
      "email" => "TEXT",
      "url" => "TEXT",
      "editor" => "TEXT",
      "date" => "DATETIME",
      "select" => "TEXT",
      "json" => "TEXT",
      "file" => "TEXT",
      "relation" => "TEXT",
      (_) => "TEXT",
    };
  }

  String get dartType {
    final raw = switch (type) {
      "text" => "String",
      "number" => "double",
      "bool" => "bool",
      "email" => "String",
      "url" => "String",
      "editor" => "String",
      "date" => "DateTime",
      "select" => "String",
      "json" => "String",
      "file" => "String",
      "relation" => "String",
      (_) => "String",
    };
    if (required) return raw;
    return '$raw?';
  }
}

String escapeName(String value) {
  return '"$value"';
}

String varName(String value) {
  return value.camelCase;
}

String className(String value) {
  String raw = value.pascalCase;
  if (raw.endsWith('es')) return raw.substring(0, raw.length - 2);
  if (raw.endsWith('s')) return raw.substring(0, raw.length - 1);
  return raw;
}
