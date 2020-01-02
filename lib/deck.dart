import 'dart:collection';

import 'package:war/card.dart';

class Deck {
  final Queue<Card> _cards = Queue();

  bool isEmpty() {
    return _cards.isEmpty;
  }

  void add(Card card) {
    _cards.add(card);
  }
}
