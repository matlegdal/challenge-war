import 'dart:io';

import 'package:war/card_factory.dart';
import 'package:war/deck.dart';
import 'package:war/war.dart';

void main() {
  var cardFactory = CardFactory();
  var deck1 = parseDeck(cardFactory);
  var deck2 = parseDeck(cardFactory);

  var war = War(deck1, deck2);
  var result = war.play();

  print(result);
}

Deck parseDeck(CardFactory cardFactory) {
  var n = int.parse(stdin.readLineSync());
  var deck = Deck();
  for (var i = 0; i < n; i++) {
    var card = cardFactory.create(stdin.readLineSync());
    deck.add(card);
  }
  return deck;
}
