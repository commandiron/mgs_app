import 'package:flutter/material.dart';
import 'package:mgs_app/widgets/background_container.dart';
import 'package:mgs_app/widgets/info/info_body.dart';
import 'package:mgs_app/widgets/info/info_title.dart';
import '../../model/game.dart';
import '../../widgets/align_left.dart';

class GameLandingPage extends StatefulWidget {
  const GameLandingPage(this.game, {Key? key}) : super(key: key);

  final Game game;

  @override
  State<GameLandingPage> createState() => _GameLandingPageState();
}

class _GameLandingPageState extends State<GameLandingPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: BackgroundContainer(
        child: CustomScrollView(
          controller: ScrollController(
            initialScrollOffset: 260
          ),
          slivers: <Widget>[
            _buildSliverAppBar(),
            _buildSliverBox()
          ],
        ),
      )
    );
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: true,
      snap: false,
      floating: false,
      elevation: 0,
      expandedHeight: 600,
      backgroundColor: Theme.of(context).colorScheme.background,
      iconTheme: Theme.of(context).iconTheme,
      flexibleSpace: _buildFlexibleSpace()
    );
  }

  Widget _buildFlexibleSpace() {
    return Stack(
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
                  image: NetworkImage(widget.game.posterUrl),
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
    );
  }

  Widget _buildSliverBox() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Column(
              children: [
                AlignLeft(child: const InfoTitle("Platforms")),
                SizedBox(
                  height: 64,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.game.platformLogoPaths.length,
                    itemBuilder: (context, index) {
                      if(widget.game.platformLogoPaths[index] != null) {
                        return Flex(
                          direction: Axis.vertical,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                    width: 50,
                                    child: Image.asset(
                                      widget.game.platformLogoPaths[index]!,
                                    )
                                ),
                                const SizedBox(width: 20,)
                              ],
                            )
                          ],
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),
                ),
                const SizedBox(height: 8,),
              ],
            ),
            Column(
              children: [
                AlignLeft(child: const InfoTitle("Release Date")),
                const SizedBox(height: 8,),
                AlignLeft(child: InfoBody(widget.game.releaseDate)),
                const SizedBox(height: 16,),
              ],
            ),
            Column(
              children: [
                AlignLeft(child: const InfoTitle("Summary")),
                const SizedBox(height: 8,),
                InfoBody(widget.game.summary),
              ],
            )
          ],
        ),
      ),
    );
  }
}
