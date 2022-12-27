import 'package:flutter/material.dart';
import 'package:mgs_app/providers/games.dart';
import 'package:mgs_app/providers/mgs_characters.dart';
import 'package:mgs_app/util/theme.dart';
import 'package:provider/provider.dart';

import 'providers/categories.dart';
import 'providers/clips.dart';
import 'screens/main/main_screen.dart';
import 'util/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => Categories(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => Clips(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => Games(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => MgsCharacters(),
        ),
      ],
      builder: (context, child) {
        return MaterialApp(
          title: Constants.appName,
          theme: MyTheme.light,
          darkTheme: MyTheme.dark,
          routes: Constants.routes,
          initialRoute: MainScreen.route,
        );
      },
    );
  }
}

