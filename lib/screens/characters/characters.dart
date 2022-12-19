import 'package:flutter/material.dart';

class CharactersScreen extends StatelessWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  static const route = "characters";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Characters Screen"),),
    );
  }
}
