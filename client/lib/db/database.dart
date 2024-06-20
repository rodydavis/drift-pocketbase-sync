import 'package:drift/drift.dart';

import 'sql/generated.dart';
import 'utils/id.dart';

part 'database.g.dart';

@DriftDatabase(include: {
  "sql/generated.drift",
  "sql/key_value.drift",
})
class Database extends _$Database {
  Database(super.e);

  @override
  int get schemaVersion => 1;

  static String newId() => createId();
}
