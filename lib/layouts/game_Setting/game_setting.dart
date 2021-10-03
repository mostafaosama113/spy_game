import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spy_game_responsive/shared/components/counter_tile.dart';
import 'package:spy_game_responsive/shared/components/my_btn.dart';

class GameSetting extends StatelessWidget {
  GameSetting({Key? key}) : super(key: key);
  final CounterTile playerTale = CounterTile(
    minValue: 3,
    startValue: 5,
    icon: FontAwesomeIcons.userAlt,
  );
  final CounterTile spyTale = CounterTile(
    minValue: 1,
    startValue: 3,
    icon: FontAwesomeIcons.userSecret,
  );
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game setting'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Hero(
            tag: const Key('logo'),
            child: Image.asset(
              'images/logo.png',
              height: screenHeight * .4,
            ),
          ),
          // const Spacer(),
          // const SizedBox(height: 20),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                playerTale,
                const SizedBox(height: 40),
                spyTale,
                const SizedBox(height: 40),
                myBtn(text: 'Start Game', onClick: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
