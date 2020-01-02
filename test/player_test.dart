import 'package:test/test.dart';
import 'package:war/card.dart';
import 'package:war/player.dart';

void main() {
  final CARD = Card(2);
  var deck = Player(1);

  test('is initially empty', () {
    expect(deck.hasNoCards(), isTrue);
  });

  test('can add cards', () {
    deck.addCard(CARD);

    expect(deck.hasNoCards(), isFalse);
  });
}
