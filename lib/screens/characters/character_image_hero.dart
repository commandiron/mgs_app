import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/mgs_characters.dart';

class CharacterImageHero extends StatelessWidget {

  const CharacterImageHero({this.width, this.height, required this.index, Key? key}) : super(key: key);

  final double? width;
  final double? height;
  final int index;

  @override
  Widget build(BuildContext context) {

    final characters = Provider.of<MgsCharacters>(context, listen: false).items;

    return Hero(
        tag: "$index",
        child: SizedBox(
          width: width,
          height: height,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              characters[index].imagePath,
              fit: BoxFit.cover,
            ),
          ),
        )
    );
  }
}
