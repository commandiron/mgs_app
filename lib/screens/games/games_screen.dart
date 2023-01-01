import 'package:flutter/material.dart';
import 'package:mgs_app/screens/games/game_landing_page.dart';
import 'package:mgs_app/widgets/background_container.dart';
import 'package:provider/provider.dart';

import '../../providers/games.dart';
import '../../widgets/back_app_bar/back_app_bar.dart';
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

    final games = Provider.of<Games>(context, listen: false).items;

    return Scaffold(
      appBar: const BackAppBar(),
      body: BackgroundContainer(
        height: double.infinity,
        child: ListView.builder(
          physics: const ClampingScrollPhysics(),
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: games.length,
          itemBuilder: (context, index) => GamesItem(
            game: games[index],
            onTab: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const GameLandingPage(),
                  settings: RouteSettings(arguments: games[index])
                )
              );
            }
          )
        ),
      )
    );
  }
}
