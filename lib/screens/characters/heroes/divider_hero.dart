import 'package:flutter/material.dart';

class DividerHero extends StatelessWidget {

  const DividerHero({required this.index, Key? key}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {

    return Hero(
      tag: "divider_hero_$index",
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 160),
        child: Divider(
          color: Colors.black,
          thickness: 3,
          height: 3,
        ),
      ),
    );
  }
}
