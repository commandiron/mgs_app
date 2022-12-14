import 'package:flutter/material.dart';
import 'package:mgs_app/screens/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          background: Colors.white,
          primary: Colors.white,
          onPrimary: Color(0xffaf0000)
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Color(0xffaf0000),
          selectionColor: Color(0xffaf0000),
          selectionHandleColor: Color(0xffaf0000)
        ),
      ),
      home: const HomeScreen()
    );
  }
}

