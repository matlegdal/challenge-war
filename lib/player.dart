import 'dart:collection';
import 'card.dart';

class Player {
  final int number;
  final Queue<Card> _cards = Queue();
  final List<Card> _discardPile = [];

  Player(this.number);

  bool hasCards() => !hasNoCards();

  bool hasNoCards() => _cards.isEmpty;

  List<Card> get cards => _cards.toList();

  List<Card> get discardPile => _discardPile.toList();

  Player addCard(Card card) {
    _cards.add(card);
    return this;
  }

  Player addAll(List<Card> cards) {
    _cards.addAll(cards);
    return this;
  }

  void wonOver(Player otherPlayer) {
    _addDiscardPiles(otherPlayer);
    _discardPile.clear();
    otherPlayer._discardPile.clear();
  }

  void _addDiscardPiles(Player otherPlayer) {
    var player1 = number == 1 ? this : otherPlayer;
    var player2 = number == 2 ? this : otherPlayer;

    _cards.addAll(player1._discardPile);
    _cards.addAll(player2._discardPile);
  }

  Card nextCard() {
    try {
      var card = _cards.removeFirst();
      _discardPile.add(card);
      return card;
    } on StateError {
      throw PlayerHasNoCards();
    }
  }

  Card war() {
    for (var i = 0; i < 3; i++) {
      nextCard();
    }
    return nextCard();
  }
}

class PlayerHasNoCards implements Exception {}
