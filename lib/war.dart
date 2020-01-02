import 'player.dart';
import 'result.dart';

class War {
  Player player1;
  Player player2;

  War(this.player1, this.player2);

  Result play() {
    var round = 0;

    while (playersHaveCards()) {
      round++;
      try {
        playRound();
      } on PlayerWithNoCardsInAWar {
        return Result.equality();
      }
    }

    return Result.won(getWinner(), round);
  }

  void playRound() {
    var card1 = player1.nextCard();
    var card2 = player2.nextCard();

    if (card1 == card2) {
      card1 = player1.war();
      card2 = player2.war();
    } else if (card1 < card2) {
      player2.wonOver(player1);
    } else {
      player1.wonOver(player2);
    }
  }

  bool playersHaveCards() => player1.hasCards() && player2.hasCards();

  int getWinner() => player1.hasCards() ? 1 : 2;
}

class PlayerWithNoCardsInAWar implements Exception {}
