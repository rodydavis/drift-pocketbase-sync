import 'dart:math';

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

String createId() {
  return _pseudorandomStringWithAlphabet(_defaultIdLength, _defaultIdAlphabet);
}
