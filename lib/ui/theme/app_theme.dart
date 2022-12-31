import 'package:flutter/material.dart';
import 'package:recipe_app/ui/theme/color_theme.dart';

ThemeData lightTheme = ThemeData(
  primarySwatch: createMaterialColor(lightGreen600),
  brightness: Brightness.light,
  fontFamily: "SFPro",
);

ThemeData darkTheme = ThemeData(
  primarySwatch: createMaterialColor(lightGreen200),
  brightness: Brightness.dark,
  fontFamily: "SFPro",
);
