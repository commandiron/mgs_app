import 'package:flutter/material.dart';

import '../model/mgs_character.dart';

class MgsCharacters with ChangeNotifier {
  final List<MgsCharacter> _items = [
    MgsCharacter(
      id: 0,
      name: "Solid Snake",
      realName: "David",
      alsoKnownNames: [
        "Snake",
        "Dave",
        "Iroquois Pliskin",
        "Old Snake",
        "Legendary Mercenary",
        "Legendary Hero",
        "The Man Who Makes the Impossible Possible"
      ],
      summary:
      """
      Solid Snake, real name David, also known as Old Snake, and briefly known as Iroquois Pliskin, or simply Snake, was a former spy, special operations soldier, and mercenary. Possessing an IQ of 180 and fluent in six languages,[3][4], the fame he achieved from his military exploits earned him such monikers as "Legendary Soldier,"[3] "Legendary Hero,"[5] and "the Man Who Makes the Impossible Possible."[3]
      """,
      imagePath: "assets/images/characters/solid_snake.jpg",
      shortClipPath: "assets/videos/mgs_theme.mp4"
    ),
    MgsCharacter(
      id: 1,
      name: "Liquid Snake",
      realName: "Eli",
      alsoKnownNames: [
        "White Mamba",
        "McDonell Miller"
      ],
      imagePath: "assets/images/characters/liquid_snake.jpg",
    ),
    MgsCharacter(
      id: 2,
      name: "Kazuhira Miller",
      alsoKnownNames: [
        "Kaz",
        "McDonell Benedict Miller",
        "Hell Master",
        "Master Miller"
      ],
      imagePath: "assets/images/characters/kazuhira_miller.jpg",
    ),
  ];

  List<MgsCharacter> get items {
    return [..._items];
  }
}