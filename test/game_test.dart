import 'package:test/test.dart';
import 'package:war/card.dart';
import 'package:war/player.dart';
import 'package:war/result.dart';
import 'package:war/game.dart';

final Card JACK = Card(11);
final Card QUEEN = Card(12);
final Card KING = Card(13);
final Card AS = Card(14);
final Card A_CARD = Card(5);

void main() {
  test('can play multiple rounds with fights', () {
    var game = gameWith([AS, KING, QUEEN], [KING, QUEEN, JACK]);

    var result = game.play();

    expect(result, equals(Result.player(1).wonAtRound(3)));
  });

  test('can play successive wars that end with a winner', () {
    var game = gameWith([AS, A_CARD, A_CARD, A_CARD, QUEEN, JACK, A_CARD, A_CARD, KING, KING],
        [AS, A_CARD, A_CARD, A_CARD, QUEEN, KING, A_CARD, A_CARD, QUEEN, QUEEN]);

    var result = game.play();

    expect(result, equals(Result.player(1).wonAtRound(2)));
  });

  test('can play a war that ends as equality', () {
    var game = gameWith([AS, A_CARD], [AS, A_CARD]);

    var result = game.play();

    expect(result, equals(Result.equality()));
  });
}

Game gameFromCardValues(List<int> values1, List<int> values2) {
  var player1 = Player(1);
  for (var value in values1) {
    player1.addCard(Card(value));
  }
  var player2 = Player(2);
  for (var value in values2) {
    player2.addCard(Card(value));
  }
  return Game(player1, player2);
}

Game gameWith(List<Card> cards1, List<Card> cards2) {
  var player1 = Player(1).addAll(cards1);
  var player2 = Player(2).addAll(cards2);
  return Game(player1, player2);
}
