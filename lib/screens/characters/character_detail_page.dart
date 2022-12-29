import 'package:flutter/material.dart';
import 'package:mgs_app/screens/characters/heroes/character_image_hero.dart';
import 'package:mgs_app/screens/characters/heroes/character_name_hero.dart';
import 'package:mgs_app/screens/characters/heroes/character_summary_hero.dart';
import 'package:mgs_app/screens/characters/heroes/divider_hero.dart';

import 'heroes/blur_hero.dart';

class CharacterDetailPage extends StatefulWidget {
  const CharacterDetailPage(this.index,{Key? key}) : super(key: key);

  final int index;

  @override
  State<CharacterDetailPage> createState() => _CharacterDetailPageState();
}

class _CharacterDetailPageState extends State<CharacterDetailPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            snap: false,
            floating: false,
            elevation: 0,
            expandedHeight: 320,
            backgroundColor: Theme.of(context).colorScheme.background,
            iconTheme: const IconThemeData(
              color: Colors.black
            ),
            flexibleSpace: Flexible(
              child: Stack(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: CharacterImageHero(
                      imageWidth: double.infinity,
                      imageHeight: double.infinity,
                      index: widget.index,
                      blurHeight: 56,
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
                      child: CharacterNameHero(
                        index: widget.index
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
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
          )
        ],
      )
    );
  }
}

