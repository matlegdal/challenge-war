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
  test('can play a round with a fight', () {
    var game = gameWith([Card(2)], [Card(3)]);

    var result = game.play();

    var player2WonIn1Round = Result.won(2, 1);
    expect(result, equals(player2WonIn1Round));
  });

  test('can play multiple rounds with fights', () {
    var game = gameWith([AS, KING, QUEEN], [KING, QUEEN, JACK]);

    var result = game.play();

    var player1WonIn3Rounds = Result.won(1, 3);
    expect(result, equals(player1WonIn3Rounds));
  });

  test('can play successive wars that end with a winner', () {
    var game = gameWith([AS, A_CARD, A_CARD, A_CARD, QUEEN, JACK, A_CARD, A_CARD, KING, KING],
        [AS, A_CARD, A_CARD, A_CARD, QUEEN, KING, A_CARD, A_CARD, QUEEN, QUEEN]);

    var result = game.play();

    var player1WonIn2Rounds = Result.won(1, 2);
    expect(result, equals(player1WonIn2Rounds));
  });

  test('can play a war that ends as equality', () {
    var game = gameWith([AS, A_CARD], [AS, A_CARD]);

    var result = game.play();

    expect(result, equals(Result.equality()));
  });
}

Game gameWith(List<Card> cards1, List<Card> cards2) {
  var player1 = Player(1).addAll(cards1);
  var player2 = Player(2).addAll(cards2);
  return Game(player1, player2);
}
