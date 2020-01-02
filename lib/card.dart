class Card {
  int value;

  Card(this.value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Card && runtimeType == other.runtimeType && value == other.value;

  @override
  int get hashCode => value.hashCode;

  bool operator <(Object other) =>
      other is Card && runtimeType == other.runtimeType && value < other.value;

  @override
  String toString() {
    return 'Card{$value}';
  }
}
