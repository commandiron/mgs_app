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
              child: AspectRatio(
                aspectRatio: 3,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: CharacterImageHero(
                          height: double.infinity,
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
              ),
            );
          },
        )
      )
    );
  }
}

