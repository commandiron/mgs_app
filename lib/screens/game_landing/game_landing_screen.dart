import 'package:flutter/material.dart';
import 'package:mgs_app/providers/games.dart';
import 'package:provider/provider.dart';

class GameLandingScreen extends StatelessWidget {
  const GameLandingScreen({Key? key}) : super(key: key);

  static const route = "game_landing";

  @override
  Widget build(BuildContext context) {

    final id = ModalRoute.of(context)!.settings.arguments as int;

    final game = Provider.of<Games>(context, listen: false).findById(id);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ,
    );
  }
}
