import 'package:flutter/material.dart';

class ScrollDivider extends StatelessWidget {
  const ScrollDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 80,
      child: Divider(
        color: Colors.black,
        thickness: 4,
        height: 4,
      ),
    );
  }
}
