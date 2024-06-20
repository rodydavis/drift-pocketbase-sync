import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3/common.dart';

import '../database.dart';

LazyDatabase createExecutor(
  String name,
  void Function(CommonDatabase) setup, {
  bool logStatements = false,
}) {
  return LazyDatabase(() async {
    final appDir = await getApplicationDocumentsDirectory();
    final dbFile = File(p.join(appDir.path, name));
    return NativeDatabase.createInBackground(
      dbFile,
      setup: (db) => setup(db),
      logStatements: logStatements,
    );
  });
}

void _applyFunctions(CommonDatabase db) {
  db.createFunction(
    functionName: 'newId',
    function: (_) {
      return Database.newId();
    },
    directOnly: false,
  );
  db.createFunction(
    functionName: 'now',
    function: (_) {
      final now = DateTime.now();
      final d = now.toUtc();
      return d.toString().replaceFirst('T', ' ');
    },
    directOnly: false,
  );
  db.execute('PRAGMA journal_mode=WAL');
  db.execute('PRAGMA busy_timeout=100');
}

Database createMemoryDatabase({
  bool logStatements = false,
}) {
  final e = NativeDatabase.memory(
    setup: _applyFunctions,
    logStatements: logStatements,
  );
  return Database(e);
}

Database createDatabase(
  String name, {
  bool logStatements = false,
}) {
  final e = createExecutor(
    name,
    _applyFunctions,
    logStatements: logStatements,
  );
  return Database(e);
}
