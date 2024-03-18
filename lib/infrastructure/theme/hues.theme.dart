import 'package:flutter/material.dart';

class Hues {
  static const MaterialColor primary = MaterialColor(
    _primaryValue,
    <int, Color>{
      50: Color(0xFFE0F5F7),
      100: Color(0xFFB3E6EC),
      200: Color(0xFF80D6DF),
      300: Color(0xFF4DC6D2),
      400: Color(0xFF26B9C9),
      500: Color(_primaryValue),
      600: Color(0xFF00A6B9),
      700: Color(0xFF009CB1),
      800: Color(0xFF0093A9),
      900: Color(0xFF00839B),
    },
  );
  static const int _primaryValue = 0xFF00ADBF;

  static const Color secondary = Color(0xFF93EBFF);
  static const Color accent = Color(0xFFF4CB29);
  static const Color accentLight = Color(0xFFF5DD82);
  static const Color white = Color(0xFFFCFCFC);
  static const Color greyLightest = Color(0xFFF6F6F6);
  static const Color greyLight = Color(0xFFF1F1F1);
  static const Color greyDark = Color(0xFFCDCDCD);
  static const Color greyDarkest = Color(0xFF8D8D8D);
  static const Color black = Color(0xFF323232);
}
