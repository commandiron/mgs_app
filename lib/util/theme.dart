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
      //
      headlineSmall: TextStyle(
        fontFamily: "Inter",
        fontWeight: FontWeight.w700
      ),
      //
      titleLarge: TextStyle(
        fontFamily: "Inter",
        fontWeight: FontWeight.w700
      ),
      //
      titleMedium: TextStyle(
        fontFamily: "Inter",
        fontWeight: FontWeight.w600
      ),
      //
      //
      titleSmall: TextStyle(
        fontFamily: "Inter",
        fontWeight: FontWeight.w600
      ),
      //
      //
      bodyLarge: TextStyle(
        fontFamily: "Inter",
        fontWeight: FontWeight.w500,
      ),
      //
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
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30))
          )
        )
      )
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: primaryLight,
      contentTextStyle: const TextStyle(
        fontFamily: "Inter",
        fontWeight: FontWeight.w500,
      ),
    )
  );

  static ThemeData dark = MyTheme.light;
}