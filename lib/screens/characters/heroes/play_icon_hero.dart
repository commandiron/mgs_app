import 'package:flutter/material.dart';

class PlayIconHero extends StatelessWidget {

  const PlayIconHero({this.icon, required this.index, Key? key}) : super(key: key);

  final int index;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {

    return Hero(
      tag: "play_icon_hero_$index",
      child: CircleAvatar(
        backgroundColor: Colors.black.withOpacity(0.7),
        foregroundColor: Colors.white,
        maxRadius: 26,
        minRadius: 0,
        child: Icon(icon ?? Icons.play_arrow),
      )
    );
  }
}
