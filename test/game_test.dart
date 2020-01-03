import 'package:test/test.dart';
import 'package:war/card.dart';
import 'package:war/player.dart';
import 'package:war/result.dart';
import 'package:war/game.dart';

final int JACK = 11;
final int QUEEN = 12;
final int KING = 13;
final int AS = 14;
final int CARD = 5;

void main() {
  test('can play mutiple rounds', () {
    var game = gameFromCardValues([6, 7, 6, 12, 7, 8, 6, 5, 6, 12, 4, 3, 7, 3, 4, 5, 12, 5, 3, 3, 8, 4, 4, 12, 5, 7],
        [11, 14, 13, 14, 9, 2, 2, 11, 10, 13, 10, 11, 11, 9, 9, 13, 14, 13, 10, 8, 2, 10, 8, 14, 2, 9]);

    var result = game.play();

    expect(result, equals(Result.player(2).wonAtRound(56)));
  });

  test('can play successive wars that end with a winner', () {
    var game = gameFromCardValues([AS, CARD, CARD, CARD, QUEEN, JACK, CARD, CARD, KING, KING],
        [AS, CARD, CARD, CARD, QUEEN, KING, CARD, CARD, QUEEN, QUEEN]);

    var result = game.play();

    expect(result, equals(Result.player(1).wonAtRound(2)));
  });

  test('can play a war that ends as equality', () {
    var game = gameFromCardValues([AS, CARD], [AS, CARD]);

    var result = game.play();

    expect(result, equals(Result.equality()));
  });
}

Game gameFromCardValues(List<int> values1, List<int> values2) {
  var player1 = playerWithCardValues(1, values1);
  var player2 = playerWithCardValues(2, values2);
  return Game(player1, player2);
}

Player playerWithCardValues(int playerNumber, List<int> values) {
  var player = Player(playerNumber);
  for (var value in values) {
    player.addCard(Card(value));
  }
  return player;
}
