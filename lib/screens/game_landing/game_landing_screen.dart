import 'package:flutter/material.dart';
import 'package:mgs_app/model/game_platform.dart';
import 'package:mgs_app/providers/games.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:provider/provider.dart';

import '../../model/game.dart';

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
        builder: (context, paletteSnapshot) {
          if(paletteSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(),);
          } else {
            return CustomScrollView(
              slivers: <Widget>[
                _buildSliverAppBar(game, paletteSnapshot),
                _buildSliverBox(game)
              ],
            );
          }
        },
      )
    );
  }

  Widget _buildSliverAppBar(Game game, AsyncSnapshot<PaletteGenerator> paletteSnapshot) {
    return SliverAppBar(
      pinned: true,
      snap: false,
      floating: false,
      expandedHeight: MediaQuery.of(context).size.height / 2,
      iconTheme: Theme.of(context).iconTheme,
      flexibleSpace: _buildFlexibleSpaceBar(game.posterUrl, paletteSnapshot),
      titleSpacing: 0,
      centerTitle: true,
      title: Text(
        game.title,
        style: Theme.of(context).textTheme.titleLarge,
      )
    );
  }

  Widget _buildFlexibleSpaceBar(String posterUrl, AsyncSnapshot<PaletteGenerator> paletteSnapshot) {
    return FlexibleSpaceBar(
        background: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
          ),
          child: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top + 52 + 16,
                  bottom: 16,
                  right: 32,
                  left: 32
              ),
              child: Card(
                color: paletteSnapshot.data?.lightMutedColor?.color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Image.network(posterUrl),
                ),
              )
          ),
        )
    );
  }

  Widget _buildSliverBox(Game game) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            if(game.platforms.isNotEmpty)
              _buildPlatforms(game.platforms),
            if(game.releaseDate.isNotEmpty)
              _buildReleaseDate(game.releaseDate),
            if(game.summary.isNotEmpty)
              _buildSummary(game.summary)
          ],
        ),
      ),
    );
  }

  Widget _buildPlatforms(List<GamePlatform> platforms) {
    return Column(
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
            itemCount: platforms.length,
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
                            platforms[index].logoUrl,
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
    );
  }

  Widget _buildReleaseDate(String releaseDate) {
    return Column(
      children: [
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
        Column(
          children: [
            Flex(
                direction: Axis.horizontal,
                children: [
                  Text(
                    releaseDate,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.normal
                    ),
                  )
                ]
            ),
            const SizedBox(height: 16,),
          ],
        ),
      ],
    );
  }

  Widget _buildSummary(String summary) {
    return Column(
      children: [
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
        Text(
          summary,
          style: Theme.of(context).textTheme.bodyLarge
        ),
      ],
    );
  }
}
