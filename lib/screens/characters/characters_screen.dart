import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mgs_app/screens/characters/character_detail_page.dart';
import 'package:mgs_app/screens/characters/heroes/blur_hero.dart';
import 'package:mgs_app/screens/characters/heroes/character_image_hero.dart';
import 'package:mgs_app/screens/characters/heroes/divider_hero.dart';
import 'package:provider/provider.dart';
import '../../../../providers/mgs_characters.dart';
import '../../widgets/back_app_bar/back_app_bar.dart';
import 'heroes/character_name_hero.dart';
import 'heroes/character_summary_hero.dart';

class CharactersScreen extends StatelessWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  static const route = "characters";

  @override
  Widget build(BuildContext context) {

    final characters = Provider.of<MgsCharacters>(context, listen: false).items;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: const BackAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Characters",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ),
            const SizedBox(height: 28,),
            Container(
              height: MediaQuery.of(context).size.height / 2 ,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.zero,
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
                    child: SizedBox(
                      width: 220,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
                        child: Stack(
                          children: [
                            CharacterImageHero(
                              index: index,
                              blurHeight: 84,
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: BlurHero(
                                index: index,
                                height: 84,
                              )
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                bottom: 56,
                                left: 10,
                                right: 10
                              ),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: CharacterNameHero(
                                  index: index
                                ),
                              ),
                            ),
                            Transform.translate(
                              offset: Offset(
                                0.0,
                                MediaQuery.of(context).size.height * 2,
                              ),
                              child: DividerHero(index: index)
                            ),
                            Transform.translate(
                              offset: Offset(
                                0.0,
                                MediaQuery.of(context).size.height,
                              ),
                              child: CharacterSummaryHero(
                                  index: index
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      )
    );
  }
}

