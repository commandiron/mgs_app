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
      imagePath: "assets/images/characters/solid_snake.jpg",
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