import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/mgs_characters.dart';

class PlayHero extends StatelessWidget {

  const PlayHero({this.icon, required this.index, Key? key}) : super(key: key);

  final int index;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {

    return Hero(
      tag: "play_hero_$index",
      child: CircleAvatar(
        backgroundColor: Colors.black.withOpacity(0.2),
        foregroundColor: Colors.white,
        maxRadius: 26,
        minRadius: 0,
        child: Icon(icon ?? Icons.play_arrow),
      )
    );
  }
}
