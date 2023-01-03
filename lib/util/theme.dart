import 'package:flutter/material.dart';

class MyTheme {

  static Color primaryLight = const Color(0xffaf0000);
  static Color secondaryLight = const Color(0xff00A2ED);
  static Color backgroundLight = const Color(0xffEDEDED);
  static Color lightGrey = const Color(0xffDCDCDC);

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
        fontWeight: FontWeight.w700,
        fontSize: 22
      ),
      //
      titleLarge: TextStyle(
        fontFamily: "Inter",
        fontWeight: FontWeight.w700,
        fontSize: 18
      ),
      //
      titleMedium: TextStyle(
        fontFamily: "Inter",
        fontWeight: FontWeight.w600,
        fontSize: 16
      ),
      //
      //
      titleSmall: TextStyle(
        fontFamily: "Inter",
        fontWeight: FontWeight.w600,
        fontSize: 14
      ),
      //
      //
      bodyLarge: TextStyle(
        fontFamily: "Inter",
        fontWeight: FontWeight.w500,
        fontSize: 14
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
    ),
    chipTheme: ChipThemeData(
      backgroundColor: lightGrey,
      selectedColor: lightGrey,
      checkmarkColor: primaryLight,
    )
  );

  static ThemeData dark = MyTheme.light;
}