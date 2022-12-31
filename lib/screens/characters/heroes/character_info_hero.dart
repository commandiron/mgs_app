import 'package:flutter/material.dart';
import 'package:mgs_app/widgets/info_body.dart';
import 'package:provider/provider.dart';
import '../../../providers/mgs_characters.dart';
import '../../../widgets/info_title.dart';

class CharacterInfoHero extends StatelessWidget {

  const CharacterInfoHero({required this.index, Key? key}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {

    final characters = Provider.of<MgsCharacters>(context, listen: false).items;

    return Hero(
      tag: "character_info_hero_$index",
      child: Container(
        height: 500,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const InfoTitle("Real Name"),
            InfoBody(characters[index].realName ?? ""),
            const InfoTitle("Also Known As"),
            if(characters[index].alsoKnownNames != null)
              Column(
                children:
                  characters[index].alsoKnownNames!.map(
                    (name) => Text(name)
                  ).toList()
              ),
            InfoBody(characters[index].summary ?? "")
          ],
        ),
      ),
    );
  }
}
