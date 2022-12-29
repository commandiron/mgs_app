import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mgs_app/screens/characters/character_detail_page.dart';
import 'package:mgs_app/screens/characters/heroes/blur_hero.dart';
import 'package:mgs_app/screens/characters/heroes/character_image_hero.dart';
import 'package:mgs_app/screens/characters/heroes/divider_hero.dart';
import 'package:provider/provider.dart';
import '../../../../providers/mgs_characters.dart';
import '../../widgets/back_app_bar/back_app_bar.dart';
import 'heroes/back_hero.dart';
import 'heroes/character_name_hero.dart';
import 'heroes/character_summary_hero.dart';
import 'heroes/play_hero.dart';

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
              padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 8
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Filters",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ),
            FilterChip(
              selected: true,
              label: Text("MGS 1"),
              onSelected: (value) {},
            ),
            const SizedBox(height: 28,),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 8
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Characters",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ),
            const SizedBox(height: 16,),
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.6 ,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.zero,
                itemCount: characters.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 180,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
                      child: Stack(
                        children: [
                          CharacterImageHero(
                            index: index,
                            blurHeight: 84,
                            scrollPhysics: const NeverScrollableScrollPhysics(),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: BlurHero(
                              index: index,
                              height: 100,
                            )
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: SizedBox(
                              width: double.infinity,
                              height: 100,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 12,
                                  right: 16,
                                  left: 16,
                                  bottom: 12
                                ),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: CharacterNameHero(
                                          index: index
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.bottomRight,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).push(
                                                PageRouteBuilder(
                                                  transitionDuration: const Duration(seconds: 1),
                                                  reverseTransitionDuration: const Duration(seconds: 1),
                                                  pageBuilder: (context, animation, secondaryAnimation) {
                                                    return CharacterDetailPage(characters[index], index);
                                                  },
                                                )
                                            );
                                          },
                                          child: const Text("Details"),
                                        )
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Transform.translate(
                              offset: Offset(
                                0.0,
                                - MediaQuery.of(context).size.height * 2,
                              ),
                              child: BackHero(index: index)
                          ),
                          Transform.translate(
                              offset: Offset(
                                0.0,
                                - MediaQuery.of(context).size.height * 2,
                              ),
                              child: PlayHero(index: index)
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

