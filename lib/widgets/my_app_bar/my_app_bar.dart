import 'package:flutter/material.dart';
import 'package:mgs_app/widgets/my_app_bar/search.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key, required this.onSearchTextChange}) : super(key: key);

  final Function(String) onSearchTextChange;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title:  Row(
        children: <Widget>[
          Image.asset(
            "assets/images/mgs_main_logo.jpg",
            width: 120,
            fit: BoxFit.cover,
          ),
          const Expanded(
              child: SizedBox()
          ),
          Search(onSearchTextChange)
        ],
      )
    );
  }

  @override
  Size get preferredSize {
    return const Size(
      double.infinity,
      56.0
    );
  }
}
