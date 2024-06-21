import 'package:drift/drift.dart';
import 'package:drift/wasm.dart';

import 'package:flutter/foundation.dart';
import 'package:sqlite3/wasm.dart';

QueryExecutor createExecutor(
  String name,
  void Function(CommonDatabase) setup, {
  bool logStatements = false,
}) {
  return DatabaseConnection.delayed(Future(() async {
    final db = await WasmDatabase.open(
      databaseName: name.split('.').first,
      sqlite3Uri: sqliteUrl(),
      driftWorkerUri: Uri.parse('drift_worker.js'),
      localSetup: setup,
    );

    if (db.missingFeatures.isNotEmpty) {
      debugPrint(
        'Using ${db.chosenImplementation} due to unsupported '
        'browser features: ${db.missingFeatures}',
      );
    }

    return db.resolvedExecutor;
  }));
}

Uri sqliteUrl() {
  if (kDebugMode) {
    return Uri.parse('sqlite3.debug.wasm');
  }
  return Uri.parse('assets/sqlite3.wasm');
}
