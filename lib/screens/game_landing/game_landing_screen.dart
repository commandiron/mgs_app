import 'package:flutter/material.dart';
import 'package:mgs_app/providers/games.dart';
import 'package:provider/provider.dart';

class GameLandingScreen extends StatelessWidget {
  const GameLandingScreen({Key? key}) : super(key: key);

  static const route = "game_landing";

  @override
  Widget build(BuildContext context) {

    final id = ModalRoute.of(context)!.settings.arguments as int;

    final game = Provider.of<Games>(context).findById(id);

    return Scaffold(
      body: Container(
        padding: MediaQuery.of(context).padding,
        child: Column(
          children: [
            Flex(
              direction: Axis.horizontal,
              children: const [
                BackButton()
              ],
            ),
            Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 300,
                  child: Image.network(
                    game.posterUrl,
                  ),
                ),
                const SizedBox(height: 20,),
                Text(
                  game.title,
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ]
        ),
      ),
    );
  }
}
