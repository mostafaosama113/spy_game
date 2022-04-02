import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spy_game_responsive/shared/colors.dart';

ThemeData theme() {
  return ThemeData(
    textTheme: TextTheme(
      bodyText1: GoogleFonts.lato().copyWith(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 20,
        letterSpacing: 2,
      ),
      bodyText2: GoogleFonts.lato().copyWith(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
    scaffoldBackgroundColor: darkBlue,
    appBarTheme: const AppBarTheme(
      titleSpacing: .1,
      systemOverlayStyle: SystemUiOverlayStyle(
        systemNavigationBarColor: darkBlue,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
    ),
  );
}
