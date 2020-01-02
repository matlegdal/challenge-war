import 'dart:io';

import 'package:war/card_factory.dart';
import 'package:war/player.dart';
import 'package:war/game.dart';

void main() {
  var cardFactory = CardFactory();
  var player1 = parsePlayer(1, cardFactory);
  var player2 = parsePlayer(2, cardFactory);

  var game = Game(player1, player2);
  var result = game.play();

  print(result);
}

Player parsePlayer(int playerNumber, CardFactory cardFactory) {
  var n = int.parse(stdin.readLineSync());
  var player = Player(playerNumber);
  for (var i = 0; i < n; i++) {
    var card = cardFactory.create(stdin.readLineSync());
    player.addCard(card);
  }
  return player;
}
