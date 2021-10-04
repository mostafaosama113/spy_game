import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spy_game_responsive/layouts/game_Setting/game_setting.dart';
import 'package:spy_game_responsive/layouts/locations_screen/bloc/locations_cubit.dart';
import 'package:spy_game_responsive/layouts/locations_screen/bloc/locations_state.dart';
import 'package:spy_game_responsive/layouts/locations_screen/locations_screen.dart';
import 'package:spy_game_responsive/models/location_model.dart';
import 'package:spy_game_responsive/shared/components/my_btn.dart';
import 'package:spy_game_responsive/shared/components/navigator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static late LocationsCubit locationsCubit;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => LocationsCubit()..getAllLocations(),
      child: BlocBuilder<LocationsCubit, LocationsState>(
        builder: (context, state) {
          locationsCubit = LocationsCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
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
                const Spacer(),
                myBtn(
                  text: 'Game',
                  onClick: () async {
                    List<LocationModel> list = await LocationsCubit.get(context)
                        .getAvailableLocation();
                    navigateTo(
                      context,
                      GameSetting(list),
                    );
                  },
                ),
                myBtn(
                  text: 'Location',
                  onClick: () => navigateTo(
                    context,
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: LocationsScreen(locationsCubit),
                    ),
                  ),
                ),
                myBtn(
                  text: 'About me',
                  onClick: () {},
                ),
                const SizedBox(height: 20),
              ],
            ),
          );
        },
      ),
    );
  }
}
