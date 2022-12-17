import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Video extends StatefulWidget {
  const Video({required this.onEnd, Key? key}) : super(key: key);

  final Function onEnd;

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {

  late VideoPlayerController _controller;
  bool _isSkipable = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
        "assets/videos/mgs_theme.mp4")
      ..initialize().then((_) {
        setState(() {
          _controller.setVolume(0.0);
          _controller.play();
        });
      });
    _controller.addListener(() {
      if(!_controller.value.isPlaying) {
        setState(() {});
      }
      if(_controller.value.position.inSeconds > (_controller.value.duration.inSeconds * 4 / 5)){
        setState(() {
          _isSkipable = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      onEnd: () async {
        if(!_controller.value.isPlaying) {
          Future.delayed(const Duration(milliseconds: 750)).then((value) {
            widget.onEnd();
          });
        }
      },
      opacity: _controller.value.isPlaying ? 1 : 0,
      duration: const Duration(milliseconds: 750),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            InkWell(
              onTap: () {
                if(_isSkipable) {
                  widget.onEnd();
                } else {
                  setState(() {
                    _controller.setVolume(
                        _controller.value.volume == 0 ? 1.0 : 0.0
                    );
                  });
                }
              },
              child: VideoPlayer(
                _controller,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    _controller.setVolume(
                        _controller.value.volume == 0 ? 1.0 : 0.0
                    );
                  });
                },
                icon: Icon(
                  _controller.value.volume == 0 ? Icons.volume_off : Icons.volume_up,
                  color: Colors.white.withOpacity(0.5),
                ),
              ),
            ),
          ]
        ),
      ),
    );
  }
}
