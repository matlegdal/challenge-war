import 'dart:collection';

import 'package:war/card.dart';
import 'package:war/card_factory.dart';
import 'package:war/war.dart' as war;

import 'dart:io';
import 'dart:math';

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
void main() {
  CardFactory cardFactory = CardFactory();
  int n = int.parse(stdin.readLineSync()); // the number of cards for player 1
  Queue<Card> deck1 = Queue();
  for (int i = 0; i < n; i++) {
    // the n cards of player 1
    Card card = cardFactory.create(stdin.readLineSync());
    deck1.add(card);
  }
  // the number of cards for player 2
  int m = int.parse(stdin.readLineSync());
  Queue<Card> deck2 = Queue();
  for (int i = 0; i < m; i++) {
    // the m cards of player 2
    Card card = cardFactory.create(stdin.readLineSync());
    deck2.add(card);
  }


  // Write an action using print()
  // To debug: stderr.writeln('Debug messages...');

  print('PAT');
}
