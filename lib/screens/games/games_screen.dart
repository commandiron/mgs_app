import 'package:flutter/material.dart';
import 'package:mgs_app/screens/game_landing/game_landing_screen.dart';
import 'package:provider/provider.dart';

import '../../providers/games.dart';
import 'widgets/games_item.dart';

class GamesScreen extends StatefulWidget {
  const GamesScreen({Key? key}) : super(key: key);

  static const route = "games";

  @override
  State<GamesScreen> createState() => _GamesScreenState();
}

class _GamesScreenState extends State<GamesScreen> {

  @override
  Widget build(BuildContext context) {

    final games = Provider.of<Games>(context).items;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: MediaQuery.of(context).padding,
        child: Stack(
          children: [
            const BackButton(),
            Padding(
              padding: const EdgeInsets.only(top: 46),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: games.length,
                itemBuilder: (context, index) => GamesItem(
                  game: games[index],
                  onTab: () {
                    Navigator.of(context).pushNamed(
                        GameLandingScreen.route,
                        arguments: games[index].id
                    );
                  }
                )
              ),
            ),
          ]
        ),
      )
    );
  }
}
