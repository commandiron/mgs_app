import 'package:flutter/material.dart';
import 'package:mgs_app/providers/clips.dart';
import 'package:provider/provider.dart';
import 'widgets/clips_video_player.dart';

class ClipsPage extends StatefulWidget {
  const ClipsPage({Key? key}) : super(key: key);

  @override
  State<ClipsPage> createState() => _ClipsPageState();
}

class _ClipsPageState extends State<ClipsPage> {

  final PageController _pageController = PageController();
  var _volume = 0.0;

  void toNextPage() {
    _pageController.nextPage(
        duration: const Duration(milliseconds: 200),
        curve: Curves.fastLinearToSlowEaseIn
    );
  }

  void toPreviousPage() {
    _pageController.previousPage(
        duration: const Duration(milliseconds: 200),
        curve: Curves.fastLinearToSlowEaseIn
    );
  }

  @override
  Widget build(BuildContext context) {
    final clips = Provider.of<Clips>(context, listen: false).items;
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        int sensitivity = 8;
        if (details.delta.dx > sensitivity) {
          toPreviousPage();
        } else if(details.delta.dx < -sensitivity){
          toNextPage();
        }
      },
      child: PageView.builder(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 100, top: 20, right: 10, left: 10),
            child: Card(
              margin: const EdgeInsets.all(0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(36),
              ),
              color: Colors.grey.shade300,
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  children: [
                    Text(
                        clips[index % clips.length].title,
                        style: Theme.of(context).textTheme.titleMedium
                    ),
                    const SizedBox(height: 32,),
                    ClipsVideoPlayer(
                      clipPath: clips[index % clips.length].clipPath,
                      initialVolume: _volume,
                      onVolumeIconPressed: () {
                        _volume == 0 ? _volume = 1 : _volume = 0;
                      },
                      onNext: toNextPage,
                      onBack: toPreviousPage,
                      onEnd: toNextPage,
                    ),
                  ],
                ),
              )
            ),
          );
        },
      ),
    );
  }
}


