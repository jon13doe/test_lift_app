//theme data file
import 'package:flutter/material.dart';

const Color grey = Color(0xFFE6E6E6);
const Color imgGrey = Color(0xFFD9D9D9);
const Color red = Color(0xFFF71111);

final ThemeData theme = ThemeData(
  primaryColor: grey,
  colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: grey,
      onPrimary: imgGrey,
      secondary: grey,
      onSecondary: grey,
      error: red,
      onError: red,
      background: grey,
      onBackground: grey,
      surface: grey,
      onSurface: grey),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontSize: 24.0,
      color: Colors.black,
    ),
    headlineMedium: TextStyle(
      fontSize: 16.0,
      color: Colors.black,
    ),
    headlineSmall: TextStyle(
      fontSize: 14.0,
      color: Colors.black,
    ),
  ),
);
