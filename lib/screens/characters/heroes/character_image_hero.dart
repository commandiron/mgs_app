import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/mgs_characters.dart';

class CharacterImageHero extends StatelessWidget {

  const CharacterImageHero({this.imageWidth, this.imageHeight, this.scrollPhysics, required this.index, Key? key}) : super(key: key);

  final double? imageWidth;
  final double? imageHeight;
  final ScrollPhysics? scrollPhysics;
  final int index;

  @override
  Widget build(BuildContext context) {

    final characters = Provider.of<MgsCharacters>(context, listen: false).characters;

    return Hero(
      tag: "character_image_hero_$index",
      child: SizedBox(
        width: imageWidth,
        height: imageHeight,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          child: PageView.builder(
            physics: scrollPhysics,
            itemCount: characters[index].imageUrls.length,
            itemBuilder: (context, pageIndex) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(characters[index].imageUrls[pageIndex]),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          )
        ),
      )
    );
  }
}
