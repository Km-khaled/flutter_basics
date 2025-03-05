import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';

var kcolorScheme = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 96, 59, 181),
);
var kDarkcolorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: Color.fromARGB(255, 5, 99, 125),
);
void main(List<String> args) {
  runApp(
    MaterialApp(
      /* dark mode */ darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkcolorScheme,
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: kDarkcolorScheme.onPrimaryContainer,
          foregroundColor: kDarkcolorScheme.primaryContainer,
        ),

        cardTheme: CardTheme().copyWith(
          color: kDarkcolorScheme.secondaryContainer,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkcolorScheme.primaryContainer,
            foregroundColor: kDarkcolorScheme.onPrimaryContainer,
          ),
        ),
      ),
      /* light mode */
      theme: ThemeData().copyWith(
        colorScheme: kcolorScheme,
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: kcolorScheme.onPrimaryContainer,
          foregroundColor: kcolorScheme.primaryContainer,
        ),
        cardTheme: CardTheme().copyWith(
          color: kcolorScheme.secondaryContainer,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kcolorScheme.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            color: kcolorScheme.onSecondaryContainer,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      themeMode: ThemeMode.system,
      home: Expenses(),
    ),
  );
}
