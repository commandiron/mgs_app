import 'package:flutter/material.dart';
import 'package:mgs_app/providers/games.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:provider/provider.dart';

class GameLandingScreen extends StatefulWidget {
  const GameLandingScreen({Key? key}) : super(key: key);

  static const route = "game_landing";

  @override
  State<GameLandingScreen> createState() => _GameLandingScreenState();
}

class _GameLandingScreenState extends State<GameLandingScreen> {
  @override
  Widget build(BuildContext context) {

    final id = ModalRoute.of(context)!.settings.arguments as int;

    final game = Provider.of<Games>(context, listen: false).findById(id);

    Future<PaletteGenerator> updatePaletteGenerator () async {
      final paletteGenerator = await PaletteGenerator.fromImageProvider(
        Image.network(game.posterUrl).image,
      );
      return paletteGenerator;
    }

    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: FutureBuilder<PaletteGenerator>(
          future: updatePaletteGenerator(),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator(),);
            } else {
              return CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    pinned: true,
                    snap: false,
                    floating: false,
                    expandedHeight: MediaQuery.of(context).size.height / 2,
                    iconTheme: Theme.of(context).iconTheme,
                    backgroundColor: Colors.grey.shade300,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).padding.top + 52 + 16,
                            bottom: 16,
                            right: 32,
                            left: 32
                        ),
                        child: Card(
                          color: snapshot.data?.lightMutedColor?.color,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side: BorderSide(
                                width: 1,
                                color: snapshot.data?.lightMutedColor?.color ?? Colors.grey
                            )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Image.network(game.posterUrl),
                          ),
                        )
                      )
                    ),
                    surfaceTintColor: Colors.red,
                    titleSpacing: 0,
                    centerTitle: true,
                    title: ClipRRect(
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: 56,
                        color: snapshot.data?.lightMutedColor?.color.withOpacity(0.7),
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
                                  style: Theme.of(context).textTheme.titleMedium,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          if(game.platforms.isNotEmpty)
                            Column(
                              children: [
                                Flex(
                                  direction: Axis.horizontal,
                                  children: [
                                    Text(
                                      "Platforms",
                                      style: Theme.of(context).textTheme.headlineSmall,
                                      textAlign: TextAlign.start,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 64,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: game.platforms.length,
                                    itemBuilder: (context, index) {
                                      return Flex(
                                        direction: Axis.vertical,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 50,
                                                child: Image.network(
                                                  game.platforms[index].logoUrl,
                                                )
                                              ),
                                              const SizedBox(width: 20,)
                                            ],
                                          )
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          Flex(
                            direction: Axis.horizontal,
                            children: [
                              Text(
                                "Release Date",
                                style: Theme.of(context).textTheme.headlineSmall,
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                          const SizedBox(height: 16,),
                          Flex(
                            direction: Axis.horizontal,
                            children: [
                              Text(
                                game.releaseDate,
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.normal
                                ),
                              )
                            ]
                          ),
                          const SizedBox(height: 16,),
                          Flex(
                            direction: Axis.horizontal,
                            children: [
                              Text(
                                "Summary",
                                style: Theme.of(context).textTheme.headlineSmall,
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                          const SizedBox(height: 16,),
                          Text(game.summary),
                        ],
                      ),
                    ),

                  ),
                ],
              );
            }
          },
        ));
  }
}
