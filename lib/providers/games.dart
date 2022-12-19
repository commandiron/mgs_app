import 'package:flutter/cupertino.dart';

import '../model/game.dart';

class Games with ChangeNotifier {
  final List<Game> _items = [
    Game(
      id: 0,
      title: "Metal Gear",
      logoPath: "assets/images/games/mg_logo.png",
      posterUrl: "https://static.wikia.nocookie.net/metalgear/images/e/e1/Metal_Gear.jpg/"
    ),
    Game(
      id: 1,
      title: "Metal Gear 2 Solid Snake",
      logoPath: "assets/images/games/mg_ii_logo.png",
      posterUrl: "https://static.wikia.nocookie.net/metalgear/images/b/be/MG2-Solid_Snake.jpg"
    ),
    Game(
      id: 2,
      title: "Metal Gear Solid",
      logoPath: "assets/images/games/mgs_logo.png",
      posterUrl: "https://static.wikia.nocookie.net/metalgear/images/3/3c/SLUS-00594-F-ALL.jpg"
    ),
    Game(
      id: 3,
      title: "Metal Gear Solid II Sons of Liberty",
      logoPath: "assets/images/games/mgs_ii_logo.png",
      posterUrl: "https://static.wikia.nocookie.net/metalgear/images/0/0a/Mgs2sol.jpg"
    ),
    Game(
      id: 4,
      title: "Metal Gear Solid III Snake Eater",
      logoPath: "assets/images/games/mgs_iii_logo.png",
      posterUrl: "https://static.wikia.nocookie.net/metalgear/images/7/74/Mgs3fc.jpg"
    ),
    Game(
      id: 5,
      title: "Metal Gear Solid IV Guns of the Patriots",
      logoPath: "assets/images/games/mgs_iv_logo.png",
      posterUrl: "https://static.wikia.nocookie.net/metalgear/images/8/8d/MGS4_North_American_Cover.jpg"
    ),
    Game(
      id: 6,
      title: "Metal Gear Solid Peace Walker",
      logoPath: "assets/images/games/mgs_pw_logo.png",
      posterUrl: "https://static.wikia.nocookie.net/metalgear/images/c/cc/256px-Metal_Gear_Solid_Peace_Walker_Cover_Art.jpg"
    ),
    Game(
      id: 7,
      title: "Metal Gear Solid V Phantom Pain",
      logoPath: "assets/images/games/mgs_v_logo.png",
      posterUrl: "https://static.wikia.nocookie.net/metalgear/images/4/46/MGS5_Box_art.png"
    ),
  ];

  List<Game> get items {
    return [..._items];
  }

  Game findById(int id) {
    return _items.firstWhere((element) => element.id == id);
  }
}

