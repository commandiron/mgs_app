import 'package:flutter/material.dart';
import 'package:mgs_app/screens/characters/heroes/character_image_hero.dart';
import 'package:mgs_app/screens/characters/heroes/character_name_hero.dart';
import 'package:mgs_app/screens/characters/heroes/character_summary_hero.dart';
import 'package:mgs_app/screens/characters/heroes/divider_hero.dart';

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
            expandedHeight: 400,
            backgroundColor: Theme.of(context).colorScheme.background,
            iconTheme: const IconThemeData(
              color: Colors.black
            ),
            titleSpacing: 0,
            toolbarHeight: 56,
            title: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: BackButton(),
                ),
                CharacterNameHero(
                  index: widget.index
                ),
              ],
            ),
            flexibleSpace: Stack(
              children: [
                FlexibleSpaceBar(
                  background: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: CharacterImageHero(
                      width: double.infinity,
                      height: 320,
                      index: widget.index
                    ),
                  ),
                ),
                Container(
                  height: double.infinity,
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(30))
                    ),
                    height: 20,
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              alignment: Alignment.topCenter,
              height: 1000,
              child: Column(
                children: [
                  DividerHero(index: widget.index),
                  const SizedBox(height: 16,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: CharacterSummaryHero(index: widget.index),
                  )
                ],
              ),
            )
          )
        ],
      )
    );
  }
}

