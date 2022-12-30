import 'package:flutter/material.dart';
import 'package:mgs_app/model/mgs_character.dart';
import 'package:mgs_app/screens/characters/heroes/character_image_hero.dart';
import 'package:mgs_app/screens/characters/heroes/character_name_hero.dart';
import 'package:mgs_app/screens/characters/heroes/character_summary_hero.dart';
import 'package:mgs_app/screens/characters/heroes/divider_hero.dart';
import 'package:video_player/video_player.dart';
import 'heroes/back_hero.dart';
import 'heroes/blur_hero.dart';
import 'heroes/play_hero.dart';

class CharacterDetailPage extends StatefulWidget {
  const CharacterDetailPage(this.character, this.index,{Key? key}) : super(key: key);

  final MgsCharacter character;
  final int index;

  @override
  State<CharacterDetailPage> createState() => _CharacterDetailPageState();
}

class _CharacterDetailPageState extends State<CharacterDetailPage> {

  late VideoPlayerController _controller;
  bool _showCharAvatar = true;

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
      expandedHeight: 360,
      backgroundColor: Theme.of(context).colorScheme.background,
      iconTheme: const IconThemeData(
          color: Colors.black
      ),
      flexibleSpace: Flexible(
        child: Stack(
          children: [
            if(_showCharAvatar)
              CharacterImageHero(
                imageWidth: double.infinity,
                imageHeight: double.infinity,
                index: widget.index,
                blurHeight: 56,
              ),
            if(!_showCharAvatar)
              InkWell(
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
                          width: _controller.value.size.width ?? 0,
                          height: _controller.value.size.height ?? 0,
                          child: VideoPlayer(_controller),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            InkWell(
              onTap: () {
                setState((){
                  _controller.pause();
                  _showCharAvatar = true;
                });
                Navigator.of(context).pop();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 32
                ),
                child: BackHero(index: widget.index),
              ),
            ),
            Align(
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
                          _showCharAvatar = true;
                        } else if(!_controller.value.isPlaying && _controller.value.position == _controller.value.duration) {
                          _controller.pause();
                          _controller.seekTo(Duration.zero);
                          _showCharAvatar = true;
                        } else {
                          _showCharAvatar = false;
                          _controller.setLooping(true);
                          _controller.play();
                        }
                      });
                    },
                    child: PlayHero(icon: _controller.value.isPlaying ? Icons.close : null, index: widget.index)
                ),
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: BlurHero(
                  index: widget.index,
                  height: 56,
                )
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child:  CharacterNameHero(
                      index: widget.index
                  )
              ),
            ),
          ],
        ),
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
              const SizedBox(height: 8,),
              DividerHero(index: widget.index),
              const SizedBox(height: 16,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CharacterSummaryHero(index: widget.index),
              ),
            ],
          ),
        )
    );
  }
}

