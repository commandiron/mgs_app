import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mgs_app/screens/characters/character_detail_page.dart';
import 'package:mgs_app/screens/characters/character_image_hero.dart';
import 'package:provider/provider.dart';
import '../../../../providers/mgs_characters.dart';
import 'character_name_hero.dart';

class CharactersScreen extends StatelessWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  static const route = "characters";

  @override
  Widget build(BuildContext context) {

    final characters = Provider.of<MgsCharacters>(context, listen: false).items;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: MediaQuery.of(context).padding,
        child: ListView.builder(
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
                aspectRatio: 1,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          height: double.infinity,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: ExactAssetImage(characters[index].imagePath),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                            child: Container(
                              decoration: BoxDecoration(color: Colors.black.withOpacity(0.3)),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(12),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 3,
                              child: CharacterImageHero(
                                height: double.infinity,
                                width: double.infinity,
                                index: index
                              )
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                height: double.infinity,
                                alignment: Alignment.center,
                                child: CharacterNameHero(
                                  index: index
                                ),
                              )
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        )
      )
    );
  }
}

