import 'package:sqlite3/common.dart';

import '../utils/functions.dart';
import 'connect.web.dart' if (dart.library.ffi) 'connect.io.dart';

import '../database.dart';

void applyFunctions(CommonDatabase db) {
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

Database createDatabase(
  String name, {
  bool logStatements = false,
}) {
  final e = createExecutor(
    name,
    applyDbFunctions,
    logStatements: logStatements,
  );
  return Database(e);
}
