import 'package:flutter/material.dart';
import 'package:mgs_app/screens/main/pages/categories/widgets/category_item.dart';
import 'package:mgs_app/util/page_route.dart';
import 'package:provider/provider.dart';

import '../../../../providers/categories.dart';
import '../../../characters/characters.dart';
import '../../../games/games_screen.dart';

class CategoriesPage extends StatefulWidget {

  const CategoriesPage({Key? key}) : super(key: key);

  static final pageRoute = MyPageRoute(route:"categories", index: 0);

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {

    final categories = Provider.of<Categories>(context).items;
    final scrollController = ScrollController();

    return RawScrollbar(
      thumbColor: Theme.of(context).colorScheme.primary,
      thickness: 2,
      thumbVisibility: true,
      controller: scrollController,
      child: ListView.builder(
        controller: scrollController,
        itemCount: categories.length,
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height / 4
        ),
        itemBuilder: (context, index) => CategoryItem(
          category: categories[index],
          onTab: () {
            if(index == 0) {
              Navigator.of(context).pushNamed(GamesScreen.route);
            } else if(index == 1) {
              Navigator.of(context).pushNamed(CharactersScreen.route);
            }
          }
        )
      ),
    );
  }
}

