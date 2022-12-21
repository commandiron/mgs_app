import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:mgs_app/model/clip.dart';


class ClipCard extends StatefulWidget {
  const ClipCard(
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
  State<ClipCard> createState() => _ClipCardState();
}

class _ClipCardState extends State<ClipCard>  {

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

  @override
  Widget build(BuildContext context) {
    return _isFullScreen
      ? Container(
        color: Colors.black,
        child: Center(
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Stack(
              children: [
                _buildRawVideoPlayer(),
                _buildStartStopButton(),
                _buildExpandSoundButton()
              ],
            )
          ),
        ),
      )
      : Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: _buildCard()
          ),
          _buildProgressIndicator()
        ],
      );
  }

  Widget _buildCard() {
    return Card(
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
          _buildCardHeader(),
          _buildCardBody(),
          const SizedBox(height: 30,),
          _buildVideoPlayer()
        ],
      ),
    );
  }

  Widget _buildProgressIndicator() {
    return  FractionallySizedBox(
      widthFactor: 0.5,
      child: SizedBox(
        height: 2,
        child: VideoProgressIndicator(
            _controller,
            padding: const EdgeInsets.all(0),
            colors: VideoProgressColors(
                playedColor: Theme.of(context).colorScheme.primary,
                backgroundColor: Colors.white ,
                bufferedColor: Colors.white
            ),
            allowScrubbing: false
        ),
      ),
    );
  }

  Widget _buildCardHeader() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.background,
              child: Image.asset(widget.clip.avatarImagePath)
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
    );
  }

  Widget _buildCardBody() {
    return Padding(
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
            widget.clip.subTitle,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }

  Widget _buildVideoPlayer() {
    return ClipRRect(
        borderRadius: BorderRadius.circular(32),
        child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Stack(
              children: [
                _buildRawVideoPlayer(),
                _buildVideoPlayerOverlay()
              ],
            )
        )
    );
  }

  Widget _buildRawVideoPlayer() {
    return VideoPlayer(_controller,);
  }

  Widget _buildVideoPlayerOverlay() {
    return Stack(
      children: [
        _buildStartStopButton(),
        _buildBackNextButton(),
        _buildExpandSoundButton()
      ]
    );
  }

  Widget _buildStartStopButton() {
    return InkWell(
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
    );
  }

  Widget _buildBackNextButton() {
    return Stack(
      children: [
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
      ],
    );
  }

  Widget _buildExpandSoundButton() {
    return Container(
      alignment: Alignment.bottomRight,
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                _isFullScreen = !_isFullScreen;
              });
            },
            icon: Icon(
                !_isFullScreen ? Icons.fullscreen : Icons.fullscreen_exit
            ),
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
    );
  }
}
