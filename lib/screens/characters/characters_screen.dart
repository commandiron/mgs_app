import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mgs_app/screens/characters/character_detail_page.dart';
import 'package:mgs_app/screens/characters/heroes/blur_box_hero.dart';
import 'package:mgs_app/screens/characters/heroes/character_image_hero.dart';
import 'package:mgs_app/screens/characters/heroes/divider_hero.dart';
import 'package:provider/provider.dart';
import '../../../../providers/mgs_characters.dart';
import '../../model/mgs_character.dart';
import '../../providers/filters.dart';
import '../../widgets/back_app_bar/back_app_bar.dart';
import 'heroes/back_icon_hero.dart';
import 'heroes/character_name_hero.dart';
import 'heroes/character_summary_hero.dart';
import 'heroes/play_icon_hero.dart';

class CharactersScreen extends StatelessWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  static const route = "characters";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: const BackAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildTitle(context, "Filters"),
            buildFilterChipList(),
            buildTitle(context, "Characters"),
            const SizedBox(height: 16,),
            buildCharacterList(context)
          ],
        ),
      )
    );
  }

  Widget buildFilterChipList() {
    return SizedBox(
      height: 64,
      child: Consumer<Filters>(
        builder: (context, filters, child) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: filters.items.length,
            itemBuilder: (context, index) {
              final filter = filters.items[index];
              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 4
                ),
                child: FilterChip(
                  selected: filter.selected,
                  label: Text(filter.name),
                  onSelected: (isSelected) {
                    filters.setSelected(filter.id, isSelected);
                  },
                ),
              );
            },
          );
        },
      )
    );
  }
  Widget buildCharacterList(BuildContext context) {

    final characters = Provider.of<MgsCharacters>(context, listen: false).items;

    return SizedBox(
      height: MediaQuery.of(context).size.height / 2 ,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        itemCount: characters.length,
        itemBuilder: (context, index) {
          return buildCharacterItem(context, characters[index], index);
        },
      ),
    );
  }
  Widget buildCharacterItem(BuildContext context, MgsCharacter character, int index) {
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
            buildCharacterFooter(context, character, index),
            buildOffScreenHeroWidgets(context, index)
          ],
        ),
      ),
    );
  }
  Widget buildCharacterFooter(BuildContext context, MgsCharacter character, int index) {
    return Stack(
      children: [
        Align(
            alignment: Alignment.bottomCenter,
            child: BlurBoxHero(
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
                                    return CharacterDetailPage(character, index);
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
      ],
    );
  }
  Widget buildOffScreenHeroWidgets(BuildContext context, int index) {
    return Stack(
      children: [
        Transform.translate(
            offset: Offset(
              0.0,
              - MediaQuery.of(context).size.height * 2,
            ),
            child: BackIconHero(index: index)
        ),
        Transform.translate(
            offset: Offset(
              0.0,
              - MediaQuery.of(context).size.height * 2,
            ),
            child: PlayIconHero(index: index)
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
    );
  }

  Widget buildTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }
}



