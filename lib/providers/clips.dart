import 'package:flutter/material.dart';

import '../model/clip.dart';

class Clips with ChangeNotifier {
  final List<Clip> _items = [
    Clip(
        id: 0,
        title: "Theme",
        subTitle: "Game: Metal Gear Solid",
        clipPath: "assets/videos/mgs_theme.mp4"
    ),
    Clip(
        id: 1,
        title: "Game Over Screen",
        subTitle: "Game: Metal Gear Solid",
        clipPath: "assets/videos/mgs_game_over.mp4"
    ),
  ];

  List<Clip> get items {
    return [..._items];
  }

  Clip findById(int id) {
    return _items.firstWhere(
      (element) => element.id == id,
      orElse: () { return _items[0];},
    );
  }
}