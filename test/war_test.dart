import 'dart:math';

import 'package:test/test.dart';
import 'package:war/result.dart';
import 'package:war/card.dart';
import 'package:war/player.dart';
import 'package:war/war.dart';

final Card JACK = Card(11);
final Card QUEEN = Card(12);
final Card KING = Card(12);
final Card AS = Card(14);
final Card A_CARD = Card(5);

void main() {
  test('can play a round with a fight', () {
    var war = warWith([Card(2)], [Card(3)]);

    var result = war.play();

    var player2WonIn1Round = Result.won(2, 1);
    expect(result, equals(player2WonIn1Round));
  });

  test('can play multiple rounds with fights', () {
    var war = warWith([AS, KING, QUEEN], [KING, QUEEN, JACK]);

    var result = war.play();

    var player1WonIn3Rounds = Result.won(1, 3);
    expect(result, equals(player1WonIn3Rounds));
  });
}

War warWith(List<Card> cards1, List<Card> cards2) {
  var player1 = Player(1).addAll(cards1);
  var player2 = Player(2).addAll(cards2);
  return War(player1, player2);
}
