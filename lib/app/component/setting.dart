
import 'package:flutter/material.dart';
import 'dart:math' as math;

class Settings{
  static String API = "https://e-maquis.herokuapp.com";
  

  static String KEY_USER = "key_user";
}
List<Color> _alreadyUsedColors = [];
Color _randomColor() {
   Color newColor = Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
   while (_alreadyUsedColors.contains(newColor))
      newColor = Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
          .withOpacity(1.0);
   _alreadyUsedColors.add(newColor);
   return newColor;
}