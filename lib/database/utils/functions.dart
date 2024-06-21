import 'package:sqlite3/common.dart';

import 'id.dart';

void applyDbFunctions(CommonDatabase db) {
  db.createFunction(
    functionName: 'newId',
    function: (_) {
      return createId();
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
  db.execute('PRAGMA foreign_keys=on');
}
