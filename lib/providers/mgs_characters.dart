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
      nationality: "American",
      born: "1972, United States",
      age: "42",
      info:
      """
      Solid Snake, real name David, also known as Old Snake, and briefly known as Iroquois Pliskin, or simply Snake, was a former spy, special operations soldier, and mercenary. Possessing an IQ of 180 and fluent in six languages,[3][4], the fame he achieved from his military exploits earned him such monikers as "Legendary Soldier,"[3] "Legendary Hero,"[5] and "the Man Who Makes the Impossible Possible."[3]

      Snake was one of the children born of the 1972 project Les Enfants Terribles. He was created as a clone of the world-renowned soldier Big Boss, along with his brothers Liquid Snake and Solidus Snake. Initially a Green Beret, Snake was later inducted into the High-Tech Special Forces Unit FOXHOUND in the 1990s while it was commanded by Big Boss. Repeatedly tasked with disarming and destroying the latest incarnation of Metal Gear, a bipedal nuclear weapon-armed tank, Snake would thrice avert potential nuclear catastrophe, becoming a famed war hero.

      Following the Shadow Moses Incident and subsequent smear campaign by the Patriots, the secret organization behind American politics, Snake was labeled a terrorist. He faked his own death in the Manhattan Tanker Incident, though he re-emerged years later to assist Raiden in the Big Shell Incident. During this time, his health declined as his body entered a state of accelerated aging due to intentional genetic changes made during the cloning process.

      In 2014, Snake performed his final mission, during which he defeated Liquid Ocelot and destroyed the Patriots. After one last encounter with Big Boss, Snake chose to live his remaining days in peace.
      """,
      imagePaths: [
        "assets/images/characters/solid_snake.jpg",
        "assets/images/characters/liquid_snake.jpg",
        "assets/images/characters/kazuhira_miller.jpg"
      ],
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
      imagePaths: ["assets/images/characters/liquid_snake.jpg"],
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
      imagePaths: ["assets/images/characters/kazuhira_miller.jpg"],
    ),
  ];

  List<MgsCharacter> get items {
    return [..._items];
  }
}