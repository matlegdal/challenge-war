import 'package:test/test.dart';
import 'package:war/card.dart';
import 'package:war/card_factory.dart';

final NUMBER_VALUE = 4;
final TWO_DIGIT_VALUE = 10;
final JACK = 'J';
final JACK_VALUE = 11;
final A_SUIT = 'H';

void main() {
  var factory = CardFactory();

  test('given a numbered card it creates a card of same value', () {
    var line = lineFrom(NUMBER_VALUE);

    var card = factory.create(line);

    expect(card, equals(Card(NUMBER_VALUE)));
  });

  test('given a numbered value with 2 digits (like 10) it creates a card of same value', (){
    var line = lineFrom(TWO_DIGIT_VALUE);

    var card = factory.create(line);

    expect(card, equals(Card(TWO_DIGIT_VALUE)));
  });

  test('given a faced card it creates a card with value of the face', () {
    var line = lineFrom(JACK);

    var card = factory.create(line);

    expect(card, equals(Card(JACK_VALUE)));
  });
}

String lineFrom(dynamic value) => '${value}$A_SUIT';
