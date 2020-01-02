import 'package:war/result.dart';
import 'package:war/player.dart';

import 'card.dart';

class War {
  Player player1;
  Player player2;

  War(this.player1, this.player2);

  Result play() {
    var round = 0;

    while (playersHaveCards()) {
      round++;
      playRound();
    }

    var winner = getWinner();

    return Result.won(winner, round);
  }

  void playRound() {
    var discardPile = <Card>[];
    var card1 = player1.nextCard();
    var card2 = player2.nextCard();

    discardPile.addAll([card1, card2]);

    if (card1 == card2) {
      // todo: implement war
    } else if (card1 < card2) {
      player2.addAll(discardPile);
    } else {
      player1.addAll(discardPile);
    }
  }

  bool playersHaveCards() => player1.hasCards() && player2.hasCards();

  int getWinner() => player1.hasCards() ? 1 : 2;
}
