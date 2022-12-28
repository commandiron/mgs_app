import 'package:flutter/material.dart';
import 'package:mgs_app/screens/main/pages/categories/widgets/category_item.dart';
import 'package:provider/provider.dart';

import '../../../../providers/categories.dart';
import '../../../characters/characters_screen.dart';
import '../../../games/games_screen.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {

    final categories = Provider.of<Categories>(context, listen: false).items;
    final scrollController = ScrollController();

    return RawScrollbar(
      thumbColor: Theme.of(context).colorScheme.primary,
      thickness: 2,
      thumbVisibility: true,
      controller: scrollController,
      child: ListView.builder(
        controller: scrollController,
        itemCount: categories.length,
        padding: const EdgeInsets.only(
          bottom: 100
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

