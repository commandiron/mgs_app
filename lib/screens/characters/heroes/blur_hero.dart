import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/mgs_characters.dart';

class BlurHero extends StatelessWidget {

  const BlurHero({this.height, required this.index, Key? key}) : super(key: key);

  final double? height;
  final int index;

  @override
  Widget build(BuildContext context) {

    return Hero(
      tag: "blur_hero_$index",
      child: SizedBox(
        height: height,
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(bottom: Radius.circular(30)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              height: height,
              color: Colors.transparent,
            ),
          ),
        )
      )
    );
  }
}
