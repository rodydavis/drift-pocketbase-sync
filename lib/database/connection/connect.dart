import '../utils/functions.dart';
import 'connect.web.dart' if (dart.library.ffi) 'connect.io.dart';

import '../database.dart';

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
