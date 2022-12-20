import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';


class ClipsVideoPlayer extends StatefulWidget {
  const ClipsVideoPlayer(
    {
      required this.shouldStart,
      required this.clipPath,
      required this.title,
      required this.initialVolume,
      required this.onVolumeIconPressed,
      required this.onNext,
      required this.onBack,
      Key? key
    }
  ) : super(key: key);

  final bool shouldStart;
  final String clipPath;
  final String title;
  final double initialVolume;
  final VoidCallback onVolumeIconPressed;
  final VoidCallback onNext;
  final VoidCallback onBack;

  @override
  State<ClipsVideoPlayer> createState() => _ClipsVideoPlayerState();
}

class _ClipsVideoPlayerState extends State<ClipsVideoPlayer>  {

  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.clipPath);
    _controller.setVolume(widget.initialVolume);
    _controller.initialize().then((value) {
      _controller.setLooping(true);
      if(!widget.shouldStart) {
        _controller.pause();
      } else {
        _controller.play();
      }
    });
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void didUpdateWidget(oldWidget) {
    if(widget.shouldStart) {
      _controller.play();
    } else {
      _controller.pause();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.pause().then((_) {
      _controller.dispose();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      padding: MediaQuery.of(context).padding,
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      VideoPlayer(_controller,),
                      InkWell(
                        onTap: () {
                          _controller.pause();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.black.withOpacity(
                            _controller.value.isPlaying ? 0.0 : 0.5
                          ),
                          child: !_controller.value.isPlaying ? IconButton(
                            iconSize: 64,
                            onPressed: () {
                              _controller.play();
                            },
                            icon: Icon(
                              Icons.play_arrow,
                              color: Colors.white.withOpacity(0.5)
                            ),
                          ) : null
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                            onPressed: widget.onNext,
                            icon: const Icon(
                              Icons.arrow_right,
                              color: Colors.white,
                            )
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          onPressed: widget.onBack,
                          icon: const Icon(
                            Icons.arrow_left,
                            color: Colors.white
                          )
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: IconButton(
                          onPressed: () {
                            widget.onVolumeIconPressed();
                            setState(() {
                              _controller.value.volume == 0
                                ? _controller.setVolume(1.0)
                                : _controller.setVolume(0.0);
                            });
                          },
                          icon: Icon(
                            _controller.value.volume == 0
                                ? Icons.volume_off
                                : Icons.volume_up,
                            color: Colors.white.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ]
                  ),
                ),
              ),
              VideoProgressIndicator(
                padding: const EdgeInsets.all(0),
                  _controller,
                  colors: VideoProgressColors(
                    playedColor: Theme.of(context).colorScheme.primary,
                  ),
                  allowScrubbing: false
              ),
              const SizedBox(height: 32,),
              Text(
                widget.title,
                style: Theme.of(context).textTheme.titleMedium
              )
            ],
          ),
        ]
      ),
    );
  }
}
