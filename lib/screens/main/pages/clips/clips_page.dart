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
    return Padding(
      padding: MediaQuery.of(context).padding,
      child: GestureDetector(
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
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 8,
                    color: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                      side: BorderSide(
                        color: Colors.white,
                        width: 1,
                        strokeAlign: StrokeAlign.inside
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20,),
                              Text(
                                clips[index % clips.length].title,
                                style: Theme.of(context).textTheme.headlineSmall,
                              ),
                              SizedBox(height: 20,),
                              Text(
                                clips[index % clips.length].title,
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30,),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(32),
                          child: ClipsVideoPlayer(
                            clipPath: clips[index % clips.length].clipPath,
                            initialVolume: _volume,
                            onVolumeIconPressed: () {
                              _volume == 0 ? _volume = 1 : _volume = 0;
                            },
                            onNext: toNextPage,
                            onBack: toPreviousPage,
                            onEnd: toNextPage,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}


