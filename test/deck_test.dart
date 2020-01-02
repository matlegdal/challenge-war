import 'package:test/test.dart';
import 'package:war/card.dart';
import 'package:war/deck.dart';

void main() {
  final CARD = Card(2);
  var deck = Deck();

  test('is initially empty', () {
    expect(deck.isEmpty(), isTrue);
  });

  test('can add cards', () {
    deck.add(CARD);

    expect(deck.isEmpty(), isFalse);
  });
}
