import 'package:flutter/material.dart';
import 'package:mgs_app/widgets/background_container.dart';
import 'package:mgs_app/widgets/info/info_title.dart';
import '../../model/game.dart';
import '../../widgets/align_left.dart';
import '../../widgets/info/info_card.dart';
import '../../widgets/scroll_divider.dart';

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
      expandedHeight: MediaQuery.of(context).size.height,
      collapsedHeight: 60 + MediaQuery.of(context).padding.top,
      backgroundColor: Colors.transparent,
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
            borderRadius: const BorderRadius.vertical(bottom: Radius.circular(30)),
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
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          borderRadius: const BorderRadius.vertical(
              top: Radius.circular(30)
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              const ScrollDivider(),
              const SizedBox(
                height: 16,
              ),
              _buildPlatformsCard(),
              _buildReleaseDateCard(),
              _buildSummaryCard()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlatformsCard() {
    return Card(
      color: Colors.white.withOpacity(0.7),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
              Radius.circular(16)
          )
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flex(
                direction: Axis.vertical,
                children: const [
                  SizedBox(
                    width: double.infinity,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(4.0),
                        child: InfoTitle(
                          "Platforms",
                        ),
                      ),
                    ) ,
                  )
                ]
            ),
            Flex(
                direction: Axis.vertical,
                children: [
                  SizedBox(
                    height: 64,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
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
                ]
            )
          ],
        ),
      ),
    );
  }
  Widget _buildReleaseDateCard() {
    return AlignLeft(
        child: InfoCard(
          title: "Release Date",
          bodies: [widget.game.releaseDate],
        )
    );
  }
  Widget _buildSummaryCard() {
    return AlignLeft(
      child: InfoCard(
        title: "Summary",
        bodies: [widget.game.summary],
        fit: false,
      )
    );
  }
}
