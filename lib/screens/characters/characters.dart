import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../providers/mgs_characters.dart';

class CharactersScreen extends StatelessWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  static const route = "characters";

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => MgsCharacters(),
      builder: (context, child) {
        final characters = Provider.of<MgsCharacters>(context).items;
        return Scaffold(
          body: ListView.builder(
            itemCount: characters.length,
            itemBuilder: (context, index) {
              return Text(characters[index].name);
            },
          )
        );
      },
    );
  }
}
