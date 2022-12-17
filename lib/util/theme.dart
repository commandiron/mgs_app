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
      titleLarge: TextStyle(
          fontWeight: FontWeight.bold
      ),
      headlineMedium: TextStyle(
          color: Colors.black
      )
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: primary,
      selectionColor: primary,
      selectionHandleColor: primary
    ),
  );
}