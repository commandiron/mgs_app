import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/mgs_characters.dart';

class CharacterNameHero extends StatelessWidget {

  const CharacterNameHero({this.width, this.height, required this.index, Key? key}) : super(key: key);

  final double? width;
  final double? height;
  final int index;

  @override
  Widget build(BuildContext context) {

    final characters = Provider.of<MgsCharacters>(context, listen: false).items;

    return Hero(
      tag: "name_hero_$index",
      child: SizedBox(
        width: width,
        height: height,
        child: Text(
          characters[index].name,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
