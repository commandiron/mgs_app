import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/mgs_characters.dart';

class CharacterNameHero extends StatelessWidget {

  const CharacterNameHero({required this.index, Key? key}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {

    final characters = Provider.of<MgsCharacters>(context, listen: false).items;

    return Hero(
      tag: "name_hero_$index",
      child: Text(
        characters[index].name,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          color: Colors.black
        )
      ),
    );
  }
}
