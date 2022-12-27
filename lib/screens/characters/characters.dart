import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../providers/mgs_characters.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  static const route = "characters";

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  @override
  Widget build(BuildContext context) {

    final characters = Provider.of<MgsCharacters>(context).items;

    return Scaffold(
      body: ListView.builder(
        itemCount: characters.length,
        itemBuilder: (context, index) {
          return Text(characters[index].name);
        },
      )
    );
  }
}
