import 'package:test/test.dart';
import 'package:war/card.dart';
import 'package:war/player.dart';

final CARD = Card(2);
final CARD_1 = Card(1);
final CARD_2 = Card(2);
final CARD_3 = Card(3);
final CARD_4 = Card(4);
final CARD_LIST = [CARD_1, CARD_2, CARD_3, CARD_4];

void main() {
  Player player;

  setUp(() {
    player = Player(1);
  });

  test('is initially empty', () {
    expect(player.hasNoCards(), isTrue);
  });

  test('can add a card', () {
    player.addCard(CARD);

    expect(player.nextCard(), CARD);
  });

  test('given no cards when nextCard then throws PlayerHasNoCard', () {
    expect(() => player.nextCard(), throwsA(TypeMatcher<PlayerHasNoCards>()));
  });

  test('when win then add discard pile of player 1 and player 2 in that order', () {
    var player1 = playerWithDiscardPile(1, CARD_1);
    var player2 = playerWithDiscardPile(2, CARD_2);

    player1.wonOver(player2);

    expect(player1.cards, equals([CARD_1, CARD_2]));
  });
  
  test('when win then both discard piles are emptied', (){
    var player1 = playerWithDiscardPile(1, CARD_1);
    var player2 = playerWithDiscardPile(2, CARD_2);

    player1.wonOver(player2);

    expect(player1.discardPile, isEmpty);
    expect(player2.discardPile, isEmpty);
  });

  test('when war then four cards are removed from deck', () {
    player.addAll(CARD_LIST);

    player.war();

    expect(player.hasNoCards(), isTrue);
  });
  
  test('when war then returns fourth card', (){
    player.addAll(CARD_LIST);

    var card = player.war();

    expect(card, equals(CARD_4));
  });
}

Player playerWithDiscardPile(int playerNumber, Card card) {
  var player = Player(playerNumber);
  player.addCard(card);
  player.nextCard();
  return player;
}
