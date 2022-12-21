import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:mgs_app/model/clip.dart';


class ClipsVideoPlayer extends StatefulWidget {
  const ClipsVideoPlayer(
    {
      required this.clip,
      required this.initialVolume,
      required this.onVolumeIconPressed,
      required this.onNext,
      required this.onBack,
      required this.onEnd,
      Key? key
    }
  ) : super(key: key);

  final Clip clip;
  final double initialVolume;
  final VoidCallback onVolumeIconPressed;
  final VoidCallback onNext;
  final VoidCallback onBack;
  final VoidCallback onEnd;

  @override
  State<ClipsVideoPlayer> createState() => _ClipsVideoPlayerState();
}

class _ClipsVideoPlayerState extends State<ClipsVideoPlayer>  {

  late VideoPlayerController _controller;
  bool _isFullScreen = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.clip.clipPath);
    _controller.setVolume(widget.initialVolume);
    _controller.initialize().then((value) {
      _controller.play();
    });
    _controller.addListener(() {
      setState(() {});
      if(!_controller.value.isPlaying && _controller.value.position == _controller.value.duration) {
        widget.onEnd();
      }
    });
  }

  @override
  void dispose() {
    _controller.pause().then((_) {
      _controller.dispose();
    });
    super.dispose();
  }

  Widget _buildFullScreen() {
    return Container(
      color: Colors.black,
    );
  }

  Widget _buildNormalScreen() {
    return
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32),
              side: BorderSide(
                color: Theme.of(context).colorScheme.primary,
                width: 1,
                strokeAlign: StrokeAlign.inside
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundColor: Theme.of(context).colorScheme.background,
                        child: Image.asset("assets/images/mgs_main_logo.jpg")
                      ),
                      CircleAvatar(
                        backgroundColor: Theme.of(context).colorScheme.background,
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              widget.clip.isFavorite ? Icons.favorite : Icons.favorite_border,
                              color: widget.clip.isFavorite ? Colors.red : Colors.white
                            )
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.clip.title,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 20,),
                      Text(
                        widget.clip.title,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30,),
                ClipRRect(
                  borderRadius: BorderRadius.circular(32),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Stack(
                      children: [
                        VideoPlayer(_controller,),
                        InkWell(
                          onTap: () {
                            if(_controller.value.isPlaying) {
                              _controller.pause();
                            } else {
                              _controller.play();
                            }

                          },
                          child: Container(
                            alignment: Alignment.center,
                            color: Colors.black.withOpacity(
                              _controller.value.isPlaying ? 0.0 : 0.5
                            ),
                            child: !_controller.value.isPlaying
                              ? CircleAvatar(
                                backgroundColor: Colors.grey.shade300.withOpacity(0.2),
                                maxRadius: 50,
                                child: const Icon(
                                  Icons.play_arrow,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              )
                              : null
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
                        Container(
                          alignment: Alignment.bottomRight,
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.fullscreen),
                                color: Colors.white.withOpacity(0.5),
                              ),
                              IconButton(
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
                            ],
                          ),
                        ),
                      ],
                    )
                  )
                ),
              ],
            ),
          ),
        ),
        FractionallySizedBox(
          widthFactor: 0.5,
          child: SizedBox(
            height: 2,
            child: VideoProgressIndicator(
              _controller,
              padding: const EdgeInsets.all(0),
              colors: VideoProgressColors(
                playedColor: Theme.of(context).colorScheme.primary,
                bufferedColor: Colors.white
              ),
              allowScrubbing: false
            ),
          ),
        ),
      ],
    );
  }
}
