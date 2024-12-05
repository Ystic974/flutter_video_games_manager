import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

Future<Triple<Color, Color, Color>> extractColorFromImage(String imageUrl) async {
  final PaletteGenerator paletteGenerator = await PaletteGenerator.fromImageProvider(
    NetworkImage(imageUrl),
  );

  final Color dominantColor = paletteGenerator.dominantColor?.color ?? Colors.black;
  final Color mutedColor = paletteGenerator.darkMutedColor?.color ?? Colors.purple;
  final Color vibrantColor = paletteGenerator.lightVibrantColor?.color ?? Colors.white;

  return Triple(dominantColor, mutedColor, vibrantColor);
}

class Triple<T, U, V> {
  final T first;
  final U second;
  final V third;

  Triple(this.first, this.second, this.third);
}
