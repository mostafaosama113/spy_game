import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spy_game_responsive/shared/theme.dart';

Widget counterBtn(String txt, Function onTep) {
  return InkWell(
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    onTap: () => onTep(),
    child: Material(
      borderRadius: BorderRadius.circular(15),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(
        alignment: Alignment.center,
        width: 50,
        height: 50,
        color: Colors.grey,
        child: Text(
          txt,
          style: theme().textTheme.bodyText1!.copyWith(
                fontSize: 24,
              ),
        ),
      ),
    ),
  );
}
