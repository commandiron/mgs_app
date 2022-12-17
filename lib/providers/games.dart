import 'package:flutter/cupertino.dart';

import '../model/game.dart';

class Games with ChangeNotifier {
  final List<Game> _items = [
    Game(
      id: 0,
      title: "Metal Gear",
      imagePath: "assets/images/games/mg_logo.png"
    ),
    Game(
      id: 1,
      title: "Metal Gear 2 Solid Snake",
      imagePath: "assets/images/games/mg_ii_logo.png"
    ),
    Game(
      id: 2,
      title: "Metal Gear Solid",
      imagePath: "assets/images/games/mgs_logo.png"
    ),
    Game(
      id: 3,
      title: "Metal Gear Solid II Sons of Liberty",
      imagePath: "assets/images/games/mgs_ii_logo.png"
    ),
    Game(
      id: 4,
      title: "Metal Gear Solid III Snake Eater",
      imagePath: "assets/images/games/mgs_iii_logo.png"
    ),
    Game(
      id: 5,
      title: "Metal Gear Solid IV Guns of the Patriots",
      imagePath: "assets/images/games/mgs_iv_logo.png"
    ),
    Game(
      id: 6,
      title: "Metal Gear Solid Peace Walker",
      imagePath: "assets/images/games/mgs_pw_logo.png"
    ),
    Game(
      id: 7,
      title: "Metal Gear Solid V Phantom Pain",
      imagePath: "assets/images/games/mgs_v_logo.png"
    ),
  ];

  List<Game> get items {
    return [..._items];
  }
}

