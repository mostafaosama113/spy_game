import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spy_game_responsive/layouts/home_screen/home_screen.dart';
import 'package:spy_game_responsive/layouts/locations_screen/bloc/locations_cubit.dart';
import 'package:spy_game_responsive/shared/network/sqflite.dart';
import 'package:spy_game_responsive/shared/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SqlfLite.connect();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: const HomeScreen(),
    );
  }
}
