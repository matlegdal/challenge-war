import 'dart:io';

import 'package:war/card_factory.dart';
import 'package:war/deck.dart';
import 'package:war/war.dart';

void main() {
  var cardFactory = CardFactory();
  var n = int.parse(stdin.readLineSync());
  var deck1 = Deck();
  for (var i = 0; i < n; i++) {
    var card = cardFactory.create(stdin.readLineSync());
    deck1.add(card);
  }
  var m = int.parse(stdin.readLineSync());
  var deck2 = Deck();
  for (var i = 0; i < m; i++) {
    var card = cardFactory.create(stdin.readLineSync());
    deck2.add(card);
  }

  var war = War();
  var result = war.play();

  print(result);
}
