import 'package:flutter/material.dart';
import 'package:mgs_app/screens/game_landing/game_landing_screen.dart';

import '../screens/games/games_screen.dart';
import '../screens/intro/intro_screen.dart';
import '../screens/main/main_screen.dart';

class ScreenRoute {
  static Map<String, WidgetBuilder> routes = {
    IntroScreen.route : (context) => const IntroScreen(),
    MainScreen.route : (context) => const MainScreen(),
    GamesScreen.route : (context) => const GamesScreen(),
    GameLandingScreen.route : (context) => const GameLandingScreen()
  };
}