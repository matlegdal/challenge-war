class Card {
  int value;

  Card(int value) {
    this.value = value;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Card && runtimeType == other.runtimeType && value == other.value;

  @override
  int get hashCode => value.hashCode;
}
