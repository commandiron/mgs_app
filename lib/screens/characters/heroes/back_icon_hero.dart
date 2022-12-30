import 'package:flutter/material.dart';

class BackIconHero extends StatelessWidget {

  const BackIconHero({required this.index, Key? key}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {

    return Hero(
      tag: "back_icon_hero_$index",
      child: CircleAvatar(
        backgroundColor: Colors.black.withOpacity(0.0),
        foregroundColor: Colors.white,
        maxRadius: 26,
        minRadius: 0,
        child: Icon(Icons.arrow_back),
      )
    );
  }
}
