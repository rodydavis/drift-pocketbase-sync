import 'dart:math';

import 'package:drift/drift.dart';

import 'sql/generated.dart';

part 'database.g.dart';

@DriftDatabase(include: {
  "sql/generated.drift",
  "sql/key_value.drift",
})
class Database extends _$Database {
  Database(super.e);

  @override
  int get schemaVersion => 1;

  String newId() {
    return _pseudorandomStringWithAlphabet(
      _defaultIdLength,
      _defaultIdAlphabet,
    );
  }
}

const _defaultIdLength = 15;
const _defaultIdAlphabet = "abcdefghijklmnopqrstuvwxyz0123456789";

String _pseudorandomStringWithAlphabet(int length, String alphabet) {
  final List<int> b = List.filled(length, 0);
  final int max = alphabet.length;

  for (int i = 0; i < length; i++) {
    b[i] = alphabet.codeUnitAt(Random().nextInt(max));
  }

  return String.fromCharCodes(b);
}
