import 'package:flutter/material.dart';

import 'search.dart';

class AppBarContent extends StatelessWidget {

  final Function onSearchTextChange;

  const AppBarContent({required this.onSearchTextChange, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Image.asset(
          "assets/images/mgs_main_logo.jpg",
          width: MediaQuery.of(context).size.width / 3,
          fit: BoxFit.cover,
        ),
        const Expanded(
            child: SizedBox()
        ),
        Search(onSearchTextChange)
      ],
    );
  }
}
