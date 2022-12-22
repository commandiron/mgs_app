import 'package:flutter/material.dart';
import 'package:mgs_app/widgets/my_app_bar/search.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {

  const MyAppBar(
    {
      required this.visible,
      required this.onSearchTextChange, Key? key
    }
  ) : super(key: key);

  final bool visible;
  final Function(String) onSearchTextChange;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 200),
      child: SizedBox(
        height: visible
            ? MediaQuery.of(context).padding.top + 56.0
            : 0.0,
        child: AppBar(
          title: Row(
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
        ),
      ),
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
