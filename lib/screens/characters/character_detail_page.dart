import 'package:flutter/material.dart';
import 'package:mgs_app/model/mgs_character.dart';
import 'package:mgs_app/screens/characters/heroes/character_image_hero.dart';
import 'package:mgs_app/screens/characters/heroes/character_name_hero.dart';
import 'package:mgs_app/widgets/info_body.dart';
import 'package:mgs_app/widgets/info_title.dart';
import 'package:video_player/video_player.dart';
import 'heroes/back_icon_hero.dart';
import 'heroes/blur_box_hero.dart';
import 'heroes/play_icon_hero.dart';

class CharacterDetailPage extends StatefulWidget {
  const CharacterDetailPage(this.character, this.index,{Key? key}) : super(key: key);

  final MgsCharacter character;
  final int index;

  @override
  State<CharacterDetailPage> createState() => _CharacterDetailPageState();
}

class _CharacterDetailPageState extends State<CharacterDetailPage> {

  late VideoPlayerController _controller;
  bool _showCharImage = true;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.character.shortClipPath ?? "");
    _controller.setVolume(0.0);
    _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: CustomScrollView(
        controller: ScrollController(
          initialScrollOffset: 80
        ),
        slivers: <Widget>[
          buildSliverAppBar(),
          buildSliverBox()
        ],
      )
    );
  }

  Widget buildSliverAppBar() {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: true,
      snap: false,
      floating: false,
      elevation: 0,
      expandedHeight: 380,
      backgroundColor: Theme.of(context).colorScheme.background,
      iconTheme: Theme.of(context).iconTheme,
      flexibleSpace: buildFlexibleSpace(),
    );
  }
  Widget buildFlexibleSpace() {
    return Flexible(
      child: Stack(
        children: [
          if(_showCharImage)
            buildCharacterImageHero(),
          if(!_showCharImage)
            buildVideoPlayer(),
          buildBackIconHero(),
          buildPlayIconHero(),
          buildBlurBoxHero(),
         buildCharacterNameHero()
        ],
      ),
    );
  }
  Widget buildCharacterImageHero() {
    return CharacterImageHero(
      imageWidth: double.infinity,
      imageHeight: double.infinity,
      index: widget.index,
    );
  }
  Widget buildVideoPlayer() {
    return InkWell(
      onTap: () {
        setState(() {
          if(_controller.value.isPlaying) {
            _controller.pause();
          } else {
            _controller.play();
          }
        });
      },
      child: SizedBox.expand(
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(bottom: Radius.circular(30)),
          child: Container(
            color: Colors.black,
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: _controller.value.size.width,
                height: _controller.value.size.height,
                child: VideoPlayer(_controller),
              ),
            ),
          ),
        ),
      ),
    );
  }
  Widget buildBackIconHero() {
    return InkWell(
      onTap: () {
        setState((){
          _controller.pause();
          _showCharImage = true;
        });
        Navigator.of(context).pop();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 32
        ),
        child: BackIconHero(index: widget.index),
      ),
    );
  }
  Widget buildPlayIconHero() {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 32
        ),
        child: InkWell(
            onTap: () {
              setState(() {
                if(_controller.value.isPlaying) {
                  _controller.pause();
                  _controller.seekTo(Duration.zero);
                  _showCharImage = true;
                } else if(!_controller.value.isPlaying && _controller.value.position == _controller.value.duration) {
                  _controller.pause();
                  _controller.seekTo(Duration.zero);
                  _showCharImage = true;
                } else {
                  _showCharImage = false;
                  _controller.setLooping(true);
                  _controller.play();
                }
              });
            },
            child: PlayIconHero(icon: _controller.value.isPlaying ? Icons.close : null, index: widget.index)
        ),
      ),
    );
  }
  Widget buildBlurBoxHero() {
    return  Align(
        alignment: Alignment.bottomCenter,
        child: BlurBoxHero(
          index: widget.index,
          height: 56,
        )
    );
  }
  Widget buildCharacterNameHero() {
    return  Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Align(
          alignment: Alignment.bottomCenter,
          child:  CharacterNameHero(
              index: widget.index
          )
      ),
    );
  }

  Widget buildSliverBox() {
    return SliverToBoxAdapter(
        child: Container(
          alignment: Alignment.topCenter,
          height: 1000,
          child: Column(
            children: [
              InfoTitle("Real Name"),
              InfoBody(widget.character.realName ?? ""),
              if(widget.character.alsoKnownNames != null)
                InfoTitle("Also Known As"),
                Column(
                  children: widget.character.alsoKnownNames!.map(
                    (name) => InfoBody(name)
                  ).toList(),
                )
            ],
          )
        )
    );
  }
}

