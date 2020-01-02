class Card {
  int value;

  Card(this.value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Card && runtimeType == other.runtimeType && value == other.value;

  bool operator <(Object other) => other is Card && runtimeType == other.runtimeType && value < other.value;

  @override
  String toString() {
    switch (value) {
      case 11:
        return 'Jack';
      case 12:
        return 'Queen';
      case 13:
        return 'King';
      case 14:
        return 'As';
    }
    return value.toString();
  }
}
