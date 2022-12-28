import 'package:flutter/material.dart';
import 'package:mgs_app/widgets/my_app_bar/search.dart';

class BackAppBar extends StatelessWidget implements PreferredSizeWidget {

  const BackAppBar({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.background,
      elevation: 0,
      iconTheme: Theme.of(context).iconTheme,
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
