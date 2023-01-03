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
        backgroundColor: Colors.blue.withOpacity(0.5),
        foregroundColor: Colors.white,
        radius: 26,
        child: Icon(icon ?? Icons.play_arrow),
      )
    );
  }
}
