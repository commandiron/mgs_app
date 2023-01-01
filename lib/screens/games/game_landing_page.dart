import 'package:flutter/material.dart';
import 'package:mgs_app/widgets/info/info_body.dart';
import 'package:mgs_app/widgets/info/info_title.dart';
import '../../model/game.dart';
import '../../widgets/align_left.dart';

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
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if(game.platforms.isNotEmpty)
              AlignLeft(child: InfoTitle("Platforms")),
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
              SizedBox(height: 8,),
            if(game.releaseDate.isNotEmpty)
              AlignLeft(child: InfoTitle("Release Date")),
              SizedBox(height: 8,),
              AlignLeft(child: InfoBody(game.releaseDate)),
              SizedBox(height: 16,),
            if(game.summary.isNotEmpty)
              AlignLeft(child: InfoTitle("Summary")),
              SizedBox(height: 8,),
              InfoBody(game.summary),
          ],
        ),
      ),
    );
  }
}
