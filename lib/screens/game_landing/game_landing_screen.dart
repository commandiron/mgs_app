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
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(26))
              ),
              backgroundColor: Colors.grey.shade300,
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top + 56 + 16,
                    bottom: 16,
                    right: 32,
                    left: 32
                  ),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: const BorderSide(
                        width: 1,
                        color: Colors.grey
                      )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(game.posterUrl),
                    ),
                  )
                )
              ),
              surfaceTintColor: Colors.red,
              titleSpacing: 0,
              centerTitle: true,
              title: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(26)),
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 56,
                  color: Colors.grey.withOpacity(0.7),
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const BackButton(),
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(horizontal: 46),
                        child: FittedBox(
                          child: Text(
                            game.title,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
