import 'package:flutter/material.dart';
import 'package:spy_game_responsive/shared/theme.dart';

Widget myBtn({
  required String text,
  required Function() onClick,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 10),
    child: InkWell(
      onTap: () => onClick(),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(6),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 10,
        child: Container(
          height: 45,
          color: Colors.grey,
          alignment: Alignment.center,
          child: Text(
            text,
            style: theme().textTheme.bodyText1,
          ),
        ),
      ),
    ),
  );
}
