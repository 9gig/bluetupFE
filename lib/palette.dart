//palette.dart
import 'package:flutter/material.dart';

class Palette {
  static const MaterialColor kToLight = MaterialColor(
    0xff172774, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xff2e3d82), //10%
      100: Color(0xff455290), //20%
      200: Color(0xff5d689e), //30%
      300: Color(0xff747dac), //40%
      400: Color(0xff8b93ba), //50%
      500: Color(0xffa2a9c7), //60%
      600: Color(0xffb9bed5), //70%
      700: Color(0xffd1d4e3), //80%
      800: Color(0xffe8e9f1), //90%
      900: Color(0xffffffff), //100%
    },
  );
  static const MaterialColor kToDark = MaterialColor(
    0xff172774, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xff152368), //10%
      100: Color(0xff121f5d), //20%
      200: Color(0xff101b51), //30%
      300: Color(0xff0e1746), //40%
      400: Color(0xff0c143a), //50%
      500: Color(0xff09102e), //60%
      600: Color(0xff070c23), //70%
      700: Color(0xff050817), //80%
      800: Color(0xff02040c), //90%
      900: Color(0xff000000), //100%
    },
  );
} // you can define define int 500 as the default shade and add your lighter tints above and darker tints below.
