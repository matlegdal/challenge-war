import 'card.dart';

class CardFactory {
  Card create(String line) {
    var firstChar = line.substring(0, 1);
    var value = parseValue(firstChar);
    return Card(value);
  }

  int parseValue(String firstChar) {
    if (isNumeric(firstChar)) {
      return int.parse(firstChar);
    }

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

  bool isNumeric(String string) => num.tryParse(string) != null;
}

class WrongCardValueException {}
