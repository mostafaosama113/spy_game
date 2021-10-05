import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:spy_game_responsive/shared/components/card.dart';

class GameScreen extends StatelessWidget {
  const GameScreen(
      {Key? key,
      required this.location,
      required this.player,
      required this.spy})
      : super(key: key);

  final String location;
  final int spy, player;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        alignment: Alignment.center,
        children: [
          const SizedBox(width: double.infinity),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: FlipCard(
              direction: FlipDirection.HORIZONTAL, // default
              front: card(
                MediaQuery.of(context).size,
                image: 'card',
                text: '1',
              ),
              back: card(
                MediaQuery.of(context).size,
                image: 'spy',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
