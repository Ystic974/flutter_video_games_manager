import 'package:flutter/material.dart';

class AppColor {
  // Colors
  static const Color primary = purple;
  static const Color surface = Colors.white;


  static const Color purple = Color(0xFF7C27B0);
  static Color purple30 = purple.withOpacity(0.3);
  static  Color purple50 = purple.withOpacity(0.5);
  static const Color greyPurple =  Color(0x32e2c8f3);

  static const Color orange =  Color(0xFFFF5722);

  static const Color red = Color(0xFFF61616);

  static const Color blue = Color(0xFF0500E2);

  static const Color pink = Color(0xFFDD00E2);

  static final whitePurpleGradient = createGradient([
    greyPurple, purple
  ]);

  static final blackPurpleGradient = createGradient([
    purple50, Colors.black
  ]);



  static createGradient(List<Color> colors) {
    return LinearGradient(
      colors: colors,
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
  }

  // Gradient Color
  static final Gradient greyGradient = createGradient([
    const Color(0xFF6d8385),
    const Color(0xFFb9c0bd),
  ]);





}

extension ColorExtension on Color {
  MaterialColor getMaterialColor() {
    List strengths = <double>[0.05];
    final swatch = <int, Color>{};
    final int r = red, g = green, b = blue;

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

    return MaterialColor(value, swatch);
  }
}
