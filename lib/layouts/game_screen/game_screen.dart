import 'dart:math';
import 'package:flutter/material.dart';
import 'package:spy_game_responsive/shared/components/card.dart';

class GameScreen extends StatelessWidget {
  GameScreen(
      {Key? key,
      required this.location,
      required this.player,
      required int spy})
      : super(key: key) {
    for (int i = 0; i < player; i++) {
      list.add(false);
    }
    while (spy > 0) {
      int random = Random().nextInt(player);
      if (!list[random]) {
        list[random] = true;
        spy--;
      }
    }
  }

  final String location;
  final int player;
  final List<bool> list = [];

  @override
  Widget build(BuildContext context) {
    List<Widget> cardList = [];
    int counter = player;
    for (int i = list.length - 1; i >= 0; i--) {
      if (list[i]) {
        cardList.add(
          Dismissible(
            direction: DismissDirection.up,
            child: card(context, cardNumber: i + 1),
            onDismissed: (index) {
              counter--;
              if (counter == 0) {
                //todo : navigate to timer screen
              }
            },
            key: Key(
              i.toString(),
            ),
          ),
        );
      } else {
        cardList.add(
          Dismissible(
            direction: DismissDirection.up,
            child: card(
              context,
              cardNumber: i + 1,
              location: location,
            ),
            onDismissed: (index) {
              counter--;
              if (counter == 0) {
                //todo : navigate to timer screen
              }
            },
            key: Key(
              i.toString(),
            ),
          ),
        );
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: cardList,
        ),
      ),
    );
  }
}
