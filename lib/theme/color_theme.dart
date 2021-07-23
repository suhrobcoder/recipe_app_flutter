import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const Color lightGreen600 = Color(0xFF7CB342);
const Color lightGreen200 = Color(0xFFC5E1A5);
const Color gray500 = Color(0xFF8A949F);
const Color gray900 = Color(0xFF05172C);

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[0.05];
  final swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;
  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}
