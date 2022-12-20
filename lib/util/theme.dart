import 'package:flutter/material.dart';

class MyTheme {

  static Color primaryLight = const Color(0xffaf0000);
  static Color secondaryLight = const Color(0xffFF6F6F);
  static Color backgroundLight = Colors.grey.shade100;

  static ThemeData light = ThemeData(
    colorScheme: ColorScheme.light(
      primary: primaryLight,
      secondary: secondaryLight,
      background: backgroundLight
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.white,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: primaryLight,
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
      cursorColor: primaryLight,
      selectionColor: primaryLight,
      selectionHandleColor: primaryLight
    ),
  );

  static Color backgroundDark = Colors.black;

  static ThemeData dark = ThemeData(
    colorScheme: ColorScheme.dark(
        primary: primaryLight,
        secondary: secondaryLight,
        background: backgroundDark
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: backgroundDark,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: backgroundDark,
      selectedItemColor: primaryLight,
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
        cursorColor: primaryLight,
        selectionColor: primaryLight,
        selectionHandleColor: primaryLight
    ),
  );
}