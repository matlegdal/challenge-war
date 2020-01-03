class Result {
  final bool isEquality;
  final int winningPlayerNumber;
  final int numberOfRounds;

  Result._(this.isEquality, this.winningPlayerNumber, this.numberOfRounds);

  static Result equality() {
    return Result._(true, 0, 0);
  }

  static _ResultBuilder player(int winningPlayerNumber) {
    return _ResultBuilder(winningPlayerNumber);
  }

  @override
  String toString() {
    if (isEquality) return 'PAT';
    return '$winningPlayerNumber $numberOfRounds';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Result &&
          runtimeType == other.runtimeType &&
          isEquality == other.isEquality &&
          winningPlayerNumber == other.winningPlayerNumber &&
          numberOfRounds == other.numberOfRounds;

  @override
  int get hashCode => isEquality.hashCode ^ winningPlayerNumber.hashCode ^ numberOfRounds.hashCode;
}

class _ResultBuilder {
  final int _winningPlayerNumber;

  _ResultBuilder(this._winningPlayerNumber);

  Result wonAtRound(int numberOfRounds) {
    return Result._(false, _winningPlayerNumber, numberOfRounds);
  }
}
