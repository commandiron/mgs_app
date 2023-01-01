import 'package:flutter/material.dart';
import 'package:mgs_app/model/mgs_character.dart';
import 'package:mgs_app/screens/characters/heroes/character_image_hero.dart';
import 'package:mgs_app/screens/characters/heroes/character_name_hero.dart';
import 'package:mgs_app/widgets/info/info_body.dart';
import 'package:mgs_app/widgets/info/info_sub_title.dart';
import 'package:mgs_app/widgets/scroll_divider.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:video_player/video_player.dart';
import '../../widgets/align_left.dart';
import '../../widgets/background_container.dart';
import '../../widgets/info/info_card.dart';
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

  Future<Color?>_updateBgColor()async
  {
    final paletteGenerator = await PaletteGenerator.fromImageProvider(
      Image.network(widget.character.imageUrls[0]).image,
    );
    return paletteGenerator.lightMutedColor?.color;
  }

  late VideoPlayerController _controller;
  bool _showCharImage = true;
  Offset _animationOffset = const Offset(0 , 1);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      enterInfoOffsetAnimation();
    });
    _controller = VideoPlayerController.network(widget.character.shortClipUrl ?? "");
    _controller.setVolume(0.0);
    _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void enterInfoOffsetAnimation() {
    setState(() {
      _animationOffset = Offset.zero;
    });
  }
  void exitInfoOffsetAnimation() {
    setState(() {
      _animationOffset = const Offset(0 , 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Color?>(
        future: _updateBgColor(),
        builder: (context, snapshot) {
          return BackgroundContainer(
            endColor: snapshot.data,
            child: CustomScrollView(
              controller: ScrollController(
                  initialScrollOffset: 80
              ),
              slivers: <Widget>[
                buildSliverAppBar(),
                buildSliverBox()
              ],
            ),
          );
        },
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
      collapsedHeight: 60 + 56 + MediaQuery.of(context).padding.top,
      backgroundColor: Theme.of(context).colorScheme.background,
      iconTheme: Theme.of(context).iconTheme,
      flexibleSpace: buildFlexibleSpace(),
    );
  }
  Widget buildFlexibleSpace() {
    return Stack(
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
          exitInfoOffsetAnimation();
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
      child: AnimatedSlide(
        offset: _animationOffset,
        duration: const Duration(milliseconds: 800),
        curve: Curves.fastOutSlowIn,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 16,),
              const ScrollDivider(),
              const SizedBox(height: 16,),
              Row(
                children: [
                  if(widget.character.realName != null)
                    Expanded(child: _buildRealName(),),
                  if(widget.character.nationality != null)
                    Expanded(child: _buildNationality(),),
                ],
              ),
              Row(
                children: [
                  if(widget.character.born != null)
                    Expanded(child: _buildBorn(),),
                  if(widget.character.age != null)
                    Expanded(child: _buildAge()),
                ],
              ),
              if(widget.character.alsoKnownNames != null)
                _buildAlsoKnownAs(),
              if(widget.character.info != null)
                _buildInfo(),
              SizedBox(height: MediaQuery.of(context).size.height),
            ],
          )
        ),
      )
    );
  }
  Widget _buildRealName() {
    return InfoCard(
      title: "RealName",
      body: widget.character.realName ?? ""
    );
  }
  Widget _buildNationality() {
    return InfoCard(
      title: "Nationality",
      body: widget.character.nationality ?? ""
    );
  }
  Widget _buildBorn() {
    return InfoCard(
      title: "Born",
      body: widget.character.born ?? "",
    );
  }
  Widget _buildAge() {
    return InfoCard(
      title: "Age",
      body: widget.character.age ?? ""
    );
  }
  Widget _buildAlsoKnownAs() {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            InfoSubTitle("Also Known As"),
            SizedBox(height: 8,),
            Column(
              children: widget.character.alsoKnownNames!.map(
                    (name) => AlignLeft(
                    padding: const EdgeInsets.only(left: 8),
                    child: Center(child: InfoBody(name))
                ),
              ).toList(),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildInfo() {
    return InfoCard(
      title: "Info",
      body: widget.character.info ?? ""
    );
  }
}

