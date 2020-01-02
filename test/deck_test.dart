import 'package:test/test.dart';
import 'package:war/card.dart';
import 'package:war/deck.dart';

void main() {
  final CARD = Card(2);

  test('is initially empty', () {
    var deck = Deck();

    expect(deck.isEmpty(), isTrue);
  });

  test('can add cards', () {
    var deck = Deck();

    deck.add(CARD);

    expect(deck.isEmpty(), isFalse);
  });
}
