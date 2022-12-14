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

  late Future _gamesFuture;

  Future _obtainGamesFuture() {
    return Provider.of<Games>(context, listen: false).fetchGames();
  }

  @override
  void initState() {
    _gamesFuture = _obtainGamesFuture();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: const BackAppBar(),
      body: BackgroundContainer(
        height: double.infinity,
        child: FutureBuilder(
          future: _gamesFuture,
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator(),);
            } else {
              return Consumer<Games>(
                builder: (context, gamesData, child) {
                  return ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: gamesData.games.length,
                    itemBuilder: (context, index) => GamesItem(
                      game: gamesData.games[index],
                      onTab: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => GameLandingPage(gamesData.games[index]),
                          )
                        );
                      }
                    )
                  );
                },
              );
            }
          },
        ),
      )
    );
  }
}
