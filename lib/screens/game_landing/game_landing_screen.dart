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
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              snap: false,
              floating: false,
              expandedHeight: MediaQuery.of(context).size.height / 2,
              iconTheme: Theme.of(context).iconTheme,
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(26))),
              backgroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).padding.top + 56, bottom: 4),
                  child: Image.network(game.posterUrl),
                ),
              ),
              surfaceTintColor: Colors.red,
              titleSpacing: 0,
              title: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(26)),
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 56,
                  color: Colors.grey.withOpacity(0.7),
                  child: Row(
                    children: [
                      const BackButton(),
                      Text(
                        game.title,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                ),
              ),
              centerTitle: true,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return const SizedBox(
                    height: 1000.0,
                    child: Center(
                      child: Text("1dsadasd"),
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
