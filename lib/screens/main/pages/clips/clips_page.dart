import 'package:flutter/material.dart';
import 'package:mgs_app/providers/clips.dart';
import 'package:provider/provider.dart';
import '../../../../util/page_route.dart';
import 'widgets/clips_video_player.dart';

class ClipsPage extends StatefulWidget {
  const ClipsPage({Key? key}) : super(key: key);

  static final pageRoute = MyPageRoute(route: "clips", index: 1);

  @override
  State<ClipsPage> createState() => _ClipsPageState();
}

class _ClipsPageState extends State<ClipsPage> {

  final PageController _pageController = PageController();
  var _volume = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Consumer<Clips>(
            builder: (context, value, child) {
              return ClipsVideoPlayer(
                clipPath: value.findById(index).clipPath,
                title: value.findById(index).title,
                initialVolume: _volume,
                key: UniqueKey(),
                onVolumeIconPressed: () {
                  _volume == 0 ? _volume = 1 : _volume = 0;
                },
                onNext: () {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.fastLinearToSlowEaseIn
                  );
                },
                onBack: () {
                  _pageController.previousPage(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.fastLinearToSlowEaseIn
                  );
                },
              );
            },
          );
        },
      )
    );
  }
}
