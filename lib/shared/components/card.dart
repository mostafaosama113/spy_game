import 'package:flutter/material.dart';

Widget card(Size size, {required String image, String text = ''}) {
  return Material(
    elevation: 6,
    borderRadius: BorderRadius.circular(15),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    color: Colors.transparent,
    child: Container(
      alignment: Alignment.center,
      height: size.height,
      width: size.height * .5,
      child: Text(text),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/$image.PNG'), fit: BoxFit.fill)),
    ),
  );
}
