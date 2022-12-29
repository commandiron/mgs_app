import 'package:flutter/material.dart';

class MyTheme {

  static Color primaryLight = const Color(0xffaf0000);
  static Color secondaryLight = const Color(0xffFF6F6F);
  static Color backgroundLight = const Color(0xffEDEDED);

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
      titleMedium: TextStyle(
          fontWeight: FontWeight.bold
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: primaryLight,
      selectionColor: primaryLight,
      selectionHandleColor: primaryLight
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white),
        foregroundColor: MaterialStateProperty.all(primaryLight),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30))
          )
        )
      )
    )
  );

  static ThemeData dark = MyTheme.light;
}