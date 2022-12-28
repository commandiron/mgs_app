import 'package:flutter/material.dart';
import 'package:mgs_app/screens/characters/character_image_hero.dart';
import 'package:mgs_app/screens/characters/character_name_hero.dart';

class CharacterDetailPage extends StatelessWidget {
  const CharacterDetailPage(this.index,{Key? key}) : super(key: key);

  final int index;

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
            expandedHeight: 320,
            backgroundColor: Theme.of(context).colorScheme.background,
            iconTheme: const IconThemeData(
              color: Colors.black
            ),
            flexibleSpace: FlexibleSpaceBar(
              expandedTitleScale: 1.0,
              title: CharacterNameHero(
                index: index
              ),
              background: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: CharacterImageHero(
                  width: double.infinity,
                  height: 320,
                  index: index
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  height: 1000,
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}
