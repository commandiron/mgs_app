import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/categories.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final categories  = Provider.of<Categories>(context).items;

    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) => Container(
        height: MediaQuery.of(context).size.height / 6,
        margin: const EdgeInsets.symmetric(
          vertical: 2,
          horizontal: 4
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(categories[index].imageUrl, scale: 0.2)
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black.withOpacity(0.3)
          ),
          alignment: Alignment.centerLeft,
          child: Text(
            categories[index].title,
            style: Theme.of(context).textTheme.titleLarge
          ),
        )
      )
    );
  }
}
