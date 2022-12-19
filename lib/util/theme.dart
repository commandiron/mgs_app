import 'package:flutter/material.dart';

class MyTheme {

  static Color primary = const Color(0xffaf0000);
  static Color secondary = const Color(0xffFF6F6F);

  static ThemeData myThemeData = ThemeData(
    colorScheme: ColorScheme.light(
      primary: primary,
      secondary: secondary
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.white,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: primary,
      unselectedItemColor: Colors.grey.shade400,

    ),
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        fontWeight: FontWeight.bold
      ),
      headlineSmall: TextStyle(
          fontWeight: FontWeight.bold
      ),
      titleLarge: TextStyle(
          fontWeight: FontWeight.bold
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: primary,
      selectionColor: primary,
      selectionHandleColor: primary
    ),
  );
}