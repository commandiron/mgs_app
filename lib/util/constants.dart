import 'package:flutter/material.dart';

import '../screens/characters/characters_screen.dart';
import '../screens/games/games_screen.dart';
import '../screens/intro/intro_screen.dart';
import '../screens/main/main_screen.dart';

class Constants {

  static String appName = "Mgs App";

  static Map<String, WidgetBuilder> routes = {
    IntroScreen.route : (context) => const IntroScreen(),
    MainScreen.route : (context) => const MainScreen(),
    GamesScreen.route : (context) => const GamesScreen(),
    CharactersScreen.route : (context) => const CharactersScreen(),
  };
}