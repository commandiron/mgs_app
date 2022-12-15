import 'package:flutter/material.dart';
import 'package:mgs_app/model/category.dart';
import 'package:mgs_app/providers/games.dart';
import 'package:mgs_app/screens/home/home.dart';
import 'package:provider/provider.dart';

import 'providers/categories.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (BuildContext context) => Categories(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => Games(),
        ),
      ],
      builder: (context, child) {
        return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: const ColorScheme.light(
                background: Colors.white,
                primary: Colors.white,
                onPrimary: Color(0xffaf0000),
              ),
              textTheme: TextTheme(
                titleLarge: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                )
              ),
              textSelectionTheme: TextSelectionThemeData(
                  cursorColor: Color(0xffaf0000),
                  selectionColor: Color(0xffaf0000),
                  selectionHandleColor: Color(0xffaf0000)
              ),
            ),
            home: const HomeScreen()
        );
      },
    );
  }
}

