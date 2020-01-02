import 'dart:collection';

import 'package:war/card.dart';

class Player {
  final int number;
  final Queue<Card> _cards = Queue();

  Player(this.number);

  bool hasCards() => _cards.isNotEmpty;

  bool hasNoCards() => _cards.isEmpty;

  Player addCard(Card card) {
    _cards.add(card);
    return this;
  }

  Player addAll(List<Card> cards) {
    _cards.addAll(cards);
    return this;
  }

  Card nextCard() => _cards.removeFirst();
}
