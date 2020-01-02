import 'dart:io';

import 'package:war/card_factory.dart';
import 'package:war/player.dart';
import 'package:war/war.dart';

void main() {
  var cardFactory = CardFactory();
  var deck1 = parsePlayer(1, cardFactory);
  var deck2 = parsePlayer(2, cardFactory);

  var war = War(deck1, deck2);
  var result = war.play();

  print(result);
}

Player parsePlayer(int playerNumber, CardFactory cardFactory) {
  var n = int.parse(stdin.readLineSync());
  var deck = Player(playerNumber);
  for (var i = 0; i < n; i++) {
    var card = cardFactory.create(stdin.readLineSync());
    deck.addCard(card);
  }
  return deck;
}
