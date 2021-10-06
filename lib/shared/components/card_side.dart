import 'package:flutter/material.dart';

Widget cardSide(Size size, {required String image, String text = ''}) {
  return Material(
    elevation: 6,
    borderRadius: BorderRadius.circular(15),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    color: Colors.transparent,
    child: Container(
      alignment: Alignment.center,
      height: size.height * .80,
      width: size.height * .80 * .6,
      child: Text(
        text,
        style: TextStyle(
            fontSize: text == 'spy' ? 18 : 35, overflow: TextOverflow.ellipsis),
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/$image.PNG'),
          fit: BoxFit.fill,
        ),
      ),
    ),
  );
}
