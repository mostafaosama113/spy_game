import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void navigateTo(context, newScreen) {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return newScreen;
  }));
}

void navigateToReplacement(context, newScreen) {
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
    return newScreen;
  }));
}
