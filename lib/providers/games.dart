import 'package:flutter/material.dart';
import 'package:mgs_app/providers/game_platforms.dart';

import '../model/game.dart';
import '../model/game_platform.dart';

class Games with ChangeNotifier {

  final List<Game> _items = [
    Game(
      id: 0,
      title: "Metal Gear",
      logoPath: "assets/images/games/mg_logo.png",
      posterUrl: "https://static.wikia.nocookie.net/metalgear/images/e/e1/Metal_Gear.jpg/",
      platforms: [
        GamePlatforms().playstation,
        GamePlatforms().playstation3,
        GamePlatforms().playstationVita,
        GamePlatforms().xBox360,
        GamePlatforms().mobilePhone,
        GamePlatforms().virtualConsole,
        GamePlatforms().mSX2,
      ],
      releaseDate: "1998",
      summary: """
      Metal Gear (メタルギア Metaru Gia?) is a stealth action game designed by Hideo Kojima. Metal Gear was developed and first published by Konami in 1987 for the MSX2 home computer and was well-received critically and commercially.

      The game's premise revolves around a special forces operative codenamed Solid Snake who carries out a one-man sneaking mission into the hostile nation of Outer Heaven to destroy Metal Gear, a bipedal walking tank capable of launching nuclear missiles from anywhere in the world. Most of the subsequent games in the series follow this same premise, often changing the characters, locations, and weapons.

      Originally released for the MSX2 in Japan and Europe, the game was later ported to the Nintendo Entertainment System during the same year, although with many significant changes made to the game. This was followed with ports to various home computers, such as the PC MS-DOS and Commodore 64. It was also ported to mobile phones and Nintendo GameCube (as part of the Metal Gear Solid: The Twin Snakes Premium Package) in 2004 and for the PlayStation 2 in 2005 as a component of Metal Gear Solid 3: Subsistence, with several enhancements and changes, such as typo corrections and some grammatical changes. Its success led to the creation of two separately-produced sequels; the first one, Snake's Revenge, was produced specifically for the Western market for the NES and the other, Metal Gear 2: Solid Snake, was the canonical sequel developed by Kojima and released in Japan for the MSX2 in response to the former's creation. The latter was followed by a successful series of sequels and spin-offs.

       The cover art of Metal Gear is based on a photo of Michael Biehn in character as Kyle Reese from The Terminator.
      """
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

