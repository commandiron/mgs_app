import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:mgs_app/model/clip.dart';


class ClipView extends StatefulWidget {
  const ClipView(
    {
      required this.clip,
      required this.initialVolume,
      required this.onVolumeIconPressed,
      required this.isExpanded,
      required this.onExpandCollapsePressed,
      required this.onNext,
      required this.onBack,
      required this.onEnd,
      required this.onSharePressed,
      Key? key
    }
  ) : super(key: key);

  final Clip clip;
  final double initialVolume;
  final VoidCallback onVolumeIconPressed;
  final bool isExpanded;
  final VoidCallback onExpandCollapsePressed;
  final VoidCallback onNext;
  final VoidCallback onBack;
  final VoidCallback onEnd;
  final VoidCallback onSharePressed;

  @override
  State<ClipView> createState() => _ClipViewState();
}

class _ClipViewState extends State<ClipView>  {

  late VideoPlayerController _controller;

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
    return widget.isExpanded
      ? _buildExpandedView()
      : _buildCollapsedView();
  }

  Widget _buildExpandedView() {
    return Container(
      color: Colors.black,
      child: Stack(
        children: [
          Center(
            child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Stack(
                  children: [
                    _buildRawVideoPlayer(),
                    _buildStartStopButton(),
                    _buildExpandAndSoundButton(),
                  ],
                )
            ),
          ),
          _buildExpandedSideIcons(),
          _buildExpandedFooter()
        ]
      ),
    );
  }

  Widget _buildExpandedSideIcons() {
    return Container(
      alignment: Alignment.topRight,
      padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 64
      ),
      child: Column(
        children: [
          _logoAvatar(),
          const SizedBox(height: 10,),
          _likeIcon(
            iconColor: Colors.white.withOpacity(0.4),
          ),
          const SizedBox(height: 10,),
          _shareIcon(
            iconColor: Colors.white.withOpacity(0.4),
          )
        ],
      ),
    );
  }

  Widget _buildExpandedFooter() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(bottom: 50),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildTitleText(
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.white
                ),
              ),
              _buildSubTitleText(
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Colors.white54
                ),
              )
            ],
          ),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          child: _buildProgressIndicator(widthFactor: 1.0),
        )
      ],
    );
  }

  Widget _buildCollapsedView() {
    return OrientationBuilder(
      builder: (context, orientation) {
        if(orientation == Orientation.portrait) {
          return _buildPortraitView();
        } else {
          return _buildLandscapeView();
        }
      },
    );
  }

  Widget _buildPortraitView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: _buildClipCard()
        ),
        _buildProgressIndicator()
      ],
    );
  }

  Widget _buildLandscapeView() {
    return Center(
      child:
      AspectRatio(
        aspectRatio: 16 / 9,
        child: Stack(
          alignment: Alignment.center,
          children: [
            _buildVideoPlayer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: _buildProgressIndicator(),
            )
          ],
        )
      ),
    );
  }

  Widget _buildClipCard() {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 32),
            child: _buildCardHeader()
          ),
          _buildCardBody(),
          const SizedBox(height: 30,),
          _buildVideoPlayer()
        ],
      ),
    );
  }

  Widget _buildProgressIndicator({double? widthFactor = 0.4}) {
    return  FractionallySizedBox(
      widthFactor: widthFactor,
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _logoAvatar(),
        Row(
          children: [
            _shareIcon(),
            const SizedBox(width: 10,),
            _likeIcon()
          ],
        )
      ],
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
          Row(
            children: [
              Expanded(
                  flex: 2,
                  child: _buildTitleText()
              ),
              const Expanded(flex: 1, child: SizedBox())
            ],
          ),
          widget.clip.subTitle.isNotEmpty
              ?
          Column(
            children: [
              const SizedBox(height: 10,),
              _buildSubTitleText()
            ],
          )
              : const SizedBox.shrink()
        ],
      ),
    );
  }

  Widget _logoAvatar() {
    return IconButton(
      onPressed: null,
      icon: Image.asset(widget.clip.avatarImagePath)
    );
  }

  Widget _shareIcon({Color? iconColor}) {
    return IconButton(
      onPressed: widget.onSharePressed,
      icon: Icon(
          Icons.share,
          color: iconColor ?? Colors.black.withOpacity(0.2)
      ),
    );
  }

  Widget _likeIcon({Color? iconColor}) {
    return IconButton(
      onPressed: () {},
      icon: Icon(
        widget.clip.isFavorite ? Icons.favorite : Icons.favorite_border,
        color: widget.clip.isFavorite ? Colors.red : iconColor ?? Colors.black.withOpacity(0.2)
      ),
    );
  }

  Widget _buildTitleText({TextStyle? style}) {
    return Text(
      widget.clip.title,
      style: style ?? Theme.of(context).textTheme.headlineSmall,
    );
  }

  Widget _buildSubTitleText({TextStyle? style}) {
    return Text(
      widget.clip.subTitle,
      style: style ?? Theme.of(context).textTheme.titleSmall?.copyWith(
          color: Colors.black38
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
                _buildStartStopButton(),
                _buildBackNextButton(),
                _buildExpandAndSoundButton()
              ],
            )
        )
    );
  }

  Widget _buildRawVideoPlayer() {
    return VideoPlayer(_controller,);
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

  Widget _buildExpandAndSoundButton() {
    return Container(
      alignment: Alignment.bottomRight,
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () {
              widget.onExpandCollapsePressed();
            },
            icon: Icon(
              !widget.isExpanded ? Icons.fullscreen : Icons.fullscreen_exit
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
