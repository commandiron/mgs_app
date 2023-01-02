import 'package:flutter/material.dart';

import '../../../model/game.dart';

class GamesItem extends StatelessWidget {
  const GamesItem({required this.game, required this.onTab, Key? key}) : super(key: key);

  final Game game;
  final void Function() onTab;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      child: SizedBox(
        height: 80,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Flex(
                mainAxisAlignment: MainAxisAlignment.center,
                direction: Axis.horizontal,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 50.0),
                    child: Image.network(game.logoUrl),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Flex(
                mainAxisAlignment: MainAxisAlignment.end,
                direction: Axis.horizontal,
                children: const [
                  Icon(Icons.arrow_right)
                ]
              ),
            ),
          ]
        )
      )
    );
  }
}
