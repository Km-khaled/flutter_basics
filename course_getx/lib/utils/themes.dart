import 'package:flutter/material.dart';

class Themes {
  static final ThemeData customLightTheme = ThemeData.light().copyWith(
    // Customize light theme properties here
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white, // Title text color
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.blue,
      textTheme: ButtonTextTheme.primary,
    ),
    // Add other customizations as needed
  );

  static final ThemeData customDarkTheme = ThemeData.dark().copyWith(
    // Customize dark theme properties here
    primaryColor: Colors.indigo,
    scaffoldBackgroundColor: Colors.grey[900],
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey[850],
      foregroundColor: Colors.white, // Title text color
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.indigo[400],
      textTheme: ButtonTextTheme.primary,
    ),
    // Add other customizations as needed
  );
}
