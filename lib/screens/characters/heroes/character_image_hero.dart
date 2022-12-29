import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/mgs_characters.dart';

class CharacterImageHero extends StatelessWidget {

  const CharacterImageHero({this.imageWidth, this.imageHeight, this.blurHeight, required this.index, Key? key}) : super(key: key);

  final double? imageWidth;
  final double? imageHeight;
  final double? blurHeight;
  final int index;

  @override
  Widget build(BuildContext context) {

    final characters = Provider.of<MgsCharacters>(context, listen: false).items;

    return Hero(
        tag: "image_hero_$index",
        child: SizedBox(
          width: imageWidth,
          height: imageHeight,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: ExactAssetImage(characters[index].imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            )
          ),
        )
    );
  }
}
