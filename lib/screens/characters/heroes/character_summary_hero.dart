import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/mgs_characters.dart';

class CharacterSummaryHero extends StatelessWidget {

  const CharacterSummaryHero({required this.index, Key? key}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {

    final characters = Provider.of<MgsCharacters>(context, listen: false).items;

    return Hero(
      tag: "summary_hero_$index",
      child: Text(
        characters[index].summary ?? "",
        style: Theme.of(context).textTheme.bodyLarge
      ),
    );
  }
}
