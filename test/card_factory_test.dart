import 'package:test/test.dart';
import 'package:war/card.dart';
import 'package:war/card_factory.dart';

void main() {
  final NUMBER_VALUE = 4;
  final JACK = 'J';
  final JACK_VALUE = 11;
  var factory = CardFactory();

  test('given a numbered card it creates a card of same value', () {
    var line = lineFrom(NUMBER_VALUE);

    var card = factory.create(line);

    expect(card, equals(Card(NUMBER_VALUE)));
  });

  test('given a faced card it creates a card with value of the face', () {
    var line = lineFrom(JACK);

    var card = factory.create(line);

    expect(card, equals(Card(JACK_VALUE)));
  });
}

String lineFrom(dynamic value) => '${value}H';
