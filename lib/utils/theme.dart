import 'package:flutter/material.dart';

const Color primaryColor = Color.fromRGBO(120, 179, 149, 1);
const Color secondaryColor = Color.fromRGBO(94, 89, 83, 1);
const Color errorColor = Color.fromARGB(255, 235, 101, 92);
const Color onSecondaryColor = Color.fromARGB(255, 27, 26, 26);
const Color onSurfaceColor = Color.fromARGB(255, 27, 26, 26);
const Color onBackgroundColor = Color.fromARGB(255, 27, 26, 26);

const ColorScheme myColorScheme = ColorScheme(
  primary: primaryColor,
  secondary: secondaryColor,
  surface: Colors.white,
  background: Colors.white,
  error: errorColor,
  onPrimary: Colors.white,
  onSecondary: onSecondaryColor,
  onSurface: onSurfaceColor,
  onBackground: onBackgroundColor,
  onError: Colors.white,
  brightness: Brightness.light,
);

final ThemeData myTheme = ThemeData(
  primaryColor: primaryColor,
  fontFamily: 'Roboto',
  colorScheme: myColorScheme,
);
