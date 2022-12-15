import 'package:flutter/cupertino.dart';

import '../model/game.dart';

class Games with ChangeNotifier {
  final List<Game> _items = [
    Game(
      id: 0,
      title: "Metal Gear",
      imageUrl: "https://upload.wikimedia.org/wikipedia/en/b/bd/Metal_Gear_cover.jpg"
    ),
    Game(
        id: 1,
        title: "Metal Gear 2 Solid Snake",
        imageUrl: "https://images.igdb.com/igdb/image/upload/t_cover_big_2x/co3whu.jpg"
    ),
    Game(
        id: 2,
        title: "Metal Gear Solid",
        imageUrl: "https://upload.wikimedia.org/wikipedia/tr/8/8b/308Image.jpg"
    ),
    Game(
        id: 3,
        title: "Metal Gear Solid Peace Walker",
        imageUrl: ""
    ),
    Game(
        id: 4,
        title: "Metal Gear Solid II Sons of Liberty",
        imageUrl: ""
    ),
    Game(
        id: 5,
        title: "Metal Gear Solid III Snake Eater",
        imageUrl: ""
    ),
    Game(
        id: 6,
        title: "Metal Gear Solid IV Guns of the Patriots",
        imageUrl: ""
    ),
    Game(
        id: 7,
        title: "Metal Gear Solid V Ground Zeroes",
        imageUrl: ""
    ),
    Game(
        id: 8,
        title: "Metal Gear Solid V Phantom Pain",
        imageUrl: ""
    ),
  ];

  List<Game> get items {
    return [..._items];
  }
}

