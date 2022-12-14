import 'package:flutter/material.dart';
import 'package:mgs_app/screens/characters/character_detail_page.dart';
import 'package:mgs_app/screens/characters/heroes/blur_box_hero.dart';
import 'package:mgs_app/screens/characters/heroes/character_image_hero.dart';
import 'package:mgs_app/widgets/align_left.dart';
import 'package:mgs_app/widgets/info/info_title.dart';
import 'package:provider/provider.dart';
import '../../../../providers/mgs_characters.dart';
import '../../model/mgs_character.dart';
import '../../providers/filters.dart';
import '../../widgets/back_app_bar/back_app_bar.dart';
import '../../widgets/background_container.dart';
import 'heroes/back_icon_hero.dart';
import 'heroes/character_name_hero.dart';
import 'heroes/play_icon_hero.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  static const route = "characters";

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late Future _charactersFuture;

  Future _obtainCharactersFuture() {
    return Provider.of<MgsCharacters>(context, listen: false)
        .fetchCharacters(1, 50);
  }

  @override
  void initState() {
    _charactersFuture = _obtainCharactersFuture();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const BackAppBar(),
        body: BackgroundContainer(
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                AlignLeft(
                    padding: const EdgeInsets.only(left: 16),
                    child: const InfoTitle("Filters")),
                buildFilterChipList(),
                AlignLeft(
                  padding: const EdgeInsets.only(left: 16),
                  child: const InfoTitle("Characters"),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 1.6,
                  child: FutureBuilder(
                    future: _charactersFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return buildCharacterList();
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ));
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
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: FilterChip(
                    selected: filter.isSelected,
                    label: Text(filter.gameTag),
                    onSelected: (isSelected) {
                      filters.setSelected(filter.id, isSelected);
                      Provider.of<MgsCharacters>(context, listen: false)
                          .filterCharacters(filters.items);
                    },
                  ),
                );
              },
            );
          },
        ));
  }

  Widget buildCharacterList() {
    return Consumer<MgsCharacters>(
      builder: (context, charactersData, child) {
        return ListView.builder(
          key: UniqueKey(),
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.zero,
          itemCount: charactersData.characters.length,
          itemBuilder: (context, index) {
            return buildCharacterItem(charactersData.characters[index], index);
          },
        );
      },
    );
  }

  Widget buildCharacterItem(
    MgsCharacter character,
    int index,
  ) {
    return SizedBox(
      width: 180,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
        child: Stack(
          children: [
            CharacterImageHero(
              topRadius: 30,
              character: character,
              index: index,
              scrollPhysics: const NeverScrollableScrollPhysics(),
            ),
            Column(
              children: [
                if (character.shortClipUrl != null) 
                  buildHasVideoIcon(),
                if (character.imageUrls.length > 1)
                  buildHasMultipleImageIcon(),
              ],
            ),
            buildCharacterFooter(character, index),
            buildOffScreenHeroWidgets(index)
          ],
        ),
      ),
    );
  }

  Widget buildHasVideoIcon() {
    return Container(
      alignment: Alignment.topRight,
      padding: const EdgeInsets.all(8),
      child: CircleAvatar(
        backgroundColor:
            Theme.of(context).colorScheme.secondary.withOpacity(0.5),
        radius: 16,
        child: const Icon(
          Icons.videocam,
          color: Colors.white,
          size: 20,
        ),
      )
    );
  }

  Widget buildHasMultipleImageIcon() {
    return Container(
      alignment: Alignment.topRight,
      padding: const EdgeInsets.all(8),
      child: CircleAvatar(
        backgroundColor:
            Theme.of(context).colorScheme.secondary.withOpacity(0.5),
        radius: 16,
        child: const Icon(
          Icons.amp_stories,
          color: Colors.white,
          size: 20,
        ),
      )
    );
  }

  Widget buildCharacterFooter(MgsCharacter character, int index) {
    return Stack(
      children: [
        Align(
            alignment: Alignment.bottomCenter,
            child: BlurBoxHero(
              index: index,
              height: 100,
            )),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: double.infinity,
            height: 100,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 12, right: 16, left: 16, bottom: 12),
              child: Column(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: CharacterNameHero(index: index),
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

  Widget buildOffScreenHeroWidgets(int index) {
    return Stack(
      children: [
        Transform.translate(
            offset: Offset(
              0.0,
              -MediaQuery.of(context).size.height * 2,
            ),
            child: BackIconHero(index: index)),
        Transform.translate(
            offset: Offset(
              0.0,
              -MediaQuery.of(context).size.height * 2,
            ),
            child: PlayIconHero(index: index)),
      ],
    );
  }
}
