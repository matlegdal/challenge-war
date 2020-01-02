import 'card.dart';

class CardFactory {
  final RegExp number = RegExp(r'\d+');

  Card create(String line) {
    var value = line.startsWith(number) ? parseNumber(line) : parseFace(line);
    return Card(value);
  }

  int parseNumber(String line) {
    var indexAfterLastDigit = line.lastIndexOf(number) + 1;
    return int.parse(line.substring(0, indexAfterLastDigit));
  }

  int parseFace(String line) {
    var firstChar = line.substring(0, 1);
    switch (firstChar) {
      case 'J':
        return 11;
      case 'Q':
        return 12;
      case 'K':
        return 13;
      case 'A':
        return 14;
    }
    throw WrongCardValueException();
  }
}

class WrongCardValueException implements Exception {}
