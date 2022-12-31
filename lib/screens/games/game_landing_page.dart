import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mgs_app/model/game_platform.dart';
import 'package:mgs_app/widgets/info_body.dart';
import 'package:mgs_app/widgets/info_title.dart';

import '../../model/game.dart';

class GameLandingPage extends StatefulWidget {
  const GameLandingPage({Key? key}) : super(key: key);

  static const route = "gameLanding";

  @override
  State<GameLandingPage> createState() => _GameLandingPageState();
}

class _GameLandingPageState extends State<GameLandingPage> {

  @override
  Widget build(BuildContext context) {

    final game = ModalRoute.of(context)!.settings.arguments as Game;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: CustomScrollView(
        controller: ScrollController(
          initialScrollOffset: 160
        ),
        slivers: <Widget>[
          _buildSliverAppBar(game),
          _buildSliverBox(game)
        ],
      )
    );
  }

  Widget _buildSliverAppBar(Game game) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: true,
      snap: false,
      floating: false,
      elevation: 0,
      expandedHeight: 600,
      backgroundColor: Theme.of(context).colorScheme.background,
      iconTheme: Theme.of(context).iconTheme,
      flexibleSpace: _buildFlexibleSpace(game.posterUrl, game.title)
    );
  }

  Widget _buildFlexibleSpace(String posterUrl, String title) {
    return Flexible(
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    alignment: Alignment.center,
                    image: NetworkImage(posterUrl),
                    fit: BoxFit.cover
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: Colors.black.withOpacity(0.7),
                  foregroundColor: Colors.white,
                  maxRadius: 26,
                  minRadius: 26,
                  child: const Icon(Icons.arrow_back),
                ),
              ),
            )
          )
        ],
      )
    );
  }

  Widget _buildSliverBox(Game game) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          if(game.platforms.isNotEmpty)
            _buildPlatforms(game.platforms),
          if(game.releaseDate.isNotEmpty)
            _buildReleaseDate(game.releaseDate),
          if(game.summary.isNotEmpty)
            _buildSummary(game.summary),
          Container(
            height: 1000,
          ),
        ],
      ),
    );
  }
  Widget _buildPlatforms(List<GamePlatform> platforms) {
    return Column(
      children: [
        const InfoTitle("Platforms"),
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
        const InfoTitle("Release Date"),
        Text(
          releaseDate,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.normal
          ),
        ),
      ],
    );
  }
  Widget _buildSummary(String summary) {
    return Column(
      children: [
        const InfoTitle("Summary"),
        InfoBody(summary)
      ],
    );
  }
}
