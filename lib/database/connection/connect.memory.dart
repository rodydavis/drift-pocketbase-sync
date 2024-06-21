import 'package:drift/native.dart';

import '../database.dart';
import '../utils/functions.dart';

Database createMemoryDatabase({
  bool logStatements = false,
}) {
  final e = NativeDatabase.memory(
    setup: applyDbFunctions,
    logStatements: logStatements,
  );
  return Database(e);
}
