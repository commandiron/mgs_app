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
            titleSpacing: 0,
            toolbarHeight: 56,
            title: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: BackButton(),
                ),
                CharacterNameHero(
                    index: index
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
                      index: index
                    ),
                  ),
                ),
                AnimatedSize(
                  duration: Duration(milliseconds: 5000),
                  child: Container(
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
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  height: 1000,
                ),
              ],
            )
          )
        ],
      )
    );
  }
}

