import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Video extends StatefulWidget {
  const Video({Key? key}) : super(key: key);

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {

  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..initialize().then((_) {
        setState(() {
          _controller.setVolume(0.0);
          _controller.play();
          _controller.setLooping(true);
        });
      });
  }

  @override
  Widget build(BuildContext context) {

    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          InkWell(
            onTap: () {
              _controller.value.isPlaying ? _controller.pause() : _controller.play();
            },
            child: VideoPlayer(
              _controller,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(
              onPressed: () {
                _controller.setVolume(
                    _controller.value.volume == 0 ? 1.0 : 0.0
                );
                setState(() {});
              },
              icon: Icon(
                _controller.value.volume == 0 ? Icons.volume_off : Icons.volume_up,
                color: Colors.white.withOpacity(0.5),
              ),
            ),
          ),
        ]
      ),
    );
  }
}
