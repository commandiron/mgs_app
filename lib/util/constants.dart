import 'package:flutter/material.dart';

import '../screens/characters/characters_screen.dart';
import '../screens/games/games_screen.dart';
import '../screens/main/main_screen.dart';

class Constants {

  static String appName = "Mgs App";

  static String localRootUrl = "http://10.0.2.2:8080";

  static Map<String, WidgetBuilder> routes = {
    MainScreen.route : (context) => const MainScreen(),
    GamesScreen.route : (context) => const GamesScreen(),
    CharactersScreen.route : (context) => const CharactersScreen(),
  };
}