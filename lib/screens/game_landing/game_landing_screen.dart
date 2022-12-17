import 'package:flutter/material.dart';

class GameLandingScreen extends StatelessWidget {
  const GameLandingScreen({Key? key}) : super(key: key);

  static const route = "game_landing";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Game landing screen"),
      ),
    );
  }
}
