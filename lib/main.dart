import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spy_game_responsive/layouts/home_screen/home_screen.dart';
import 'package:spy_game_responsive/shared/network/local_data.dart';
import 'package:spy_game_responsive/shared/network/sqflite.dart';
import 'package:spy_game_responsive/shared/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await LocalData.init();
  await SqfLite.connect();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: const HomeScreen(),
    );
  }
}
