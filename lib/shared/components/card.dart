import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:spy_game_responsive/shared/components/card_side.dart';

Widget card(Size size, {required int cardNumber, String location = ''}) {
  return FlipCard(
    direction: FlipDirection.HORIZONTAL, // default
    front: cardSide(
      size,
      image: 'card',
      text: cardNumber.toString(),
    ),
    back: cardSide(
      size,
      image: location == '' ? 'spy' : 'recard',
      text: location == '' ? '' : location,
    ),
  );
}
