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
  var _shouldStart = true;

  @override
  void initState() {
    _pageController.addListener(() {
      if(_pageController.offset.remainder(MediaQuery.of(context).size.width) == 0) {
        setState(() {
          _shouldStart = true;
        });
      } else {
        setState(() {
          _shouldStart = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final clips = Provider.of<Clips>(context, listen: false).items;

    return Scaffold(
      body: GestureDetector(
        onHorizontalDragUpdate: (details) {
          int sensitivity = 8;
          if (details.delta.dx > sensitivity) {
            _pageController.previousPage(
                duration: const Duration(milliseconds: 200),
                curve: Curves.fastLinearToSlowEaseIn
            );
          } else if(details.delta.dx < -sensitivity){
            _pageController.nextPage(
                duration: const Duration(milliseconds: 200),
                curve: Curves.fastLinearToSlowEaseIn
            );
          }
        },
        child: PageView.builder(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return ClipsVideoPlayer(
              shouldStart: _shouldStart,
              clipPath: clips[index % clips.length].clipPath,
              title: clips[index % clips.length].title,
              initialVolume: _volume,
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
        ),
      ),
    );
  }
}
