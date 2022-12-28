import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mgs_app/screens/characters/character_detail_page.dart';
import 'package:mgs_app/screens/characters/character_image_hero.dart';
import 'package:provider/provider.dart';
import '../../../../providers/mgs_characters.dart';
import '../../widgets/back_app_bar/back_app_bar.dart';
import 'character_name_hero.dart';

class CharactersScreen extends StatelessWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  static const route = "characters";

  @override
  Widget build(BuildContext context) {

    final characters = Provider.of<MgsCharacters>(context, listen: false).items;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: BackAppBar(),
      body: ListView.builder(
        physics: ClampingScrollPhysics(),
        padding: EdgeInsets.all(8),
        itemCount: characters.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  transitionDuration: const Duration(seconds: 1),
                  reverseTransitionDuration: const Duration(seconds: 1),
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return CharacterDetailPage(index);
                  },
                )
              );
            },
            child: AspectRatio(
              aspectRatio: 1.77,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Stack(
                  children: [
                    Stack(
                      children: [
                        CharacterImageHero(
                          height: double.infinity,
                          width: double.infinity,
                          index: index
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: CharacterNameHero(
                              index: index
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      )
    );
  }
}

