import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spy_game_responsive/layouts/game_screen/game_screen.dart';
import 'package:spy_game_responsive/models/location_model.dart';
import 'package:spy_game_responsive/shared/components/counter_tile.dart';
import 'package:spy_game_responsive/shared/components/my_btn.dart';
import 'package:spy_game_responsive/shared/components/navigator.dart';
import 'package:spy_game_responsive/shared/components/toast.dart';
import 'package:spy_game_responsive/shared/network/local_data.dart';

class GameSetting extends StatelessWidget {
  GameSetting(this.list, {Key? key}) : super(key: key);

  final CounterTile playerTile = CounterTile(
    minValue: 3,
    startValue: LocalData.getValue('player') ?? 5,
    icon: FontAwesomeIcons.userAlt,
  );

  final CounterTile spyTile = CounterTile(
    minValue: 1,
    startValue: LocalData.getValue('spy') ?? 2,
    icon: FontAwesomeIcons.userSecret,
  );

  final List<LocationModel> list;

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
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                playerTile,
                const SizedBox(height: 40),
                spyTile,
                const SizedBox(height: 40),
                myBtn(
                  text: 'Start Game',
                  onClick: () async {
                    if (playerTile.value.value <= spyTile.value.value) {
                      showToast(context,
                          msg:
                              'The number of players should be more than the number of spies');
                    } else if (list.isEmpty) {
                      showToast(context, msg: 'Add locations');
                    } else {
                      await LocalData.setValue(
                          'player', playerTile.value.value);
                      await LocalData.setValue('spy', spyTile.value.value);
                      navigateToReplacement(
                        context,
                        GameScreen(
                          location: list[Random().nextInt(list.length)].name,
                          player: playerTile.value.value,
                          spy: spyTile.value.value,
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
