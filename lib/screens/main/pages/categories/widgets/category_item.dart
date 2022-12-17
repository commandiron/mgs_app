import 'package:flutter/material.dart';
import 'package:mgs_app/model/category.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({required this.category, required this.onTab, Key? key}) : super(key: key);

  final Category category;
  final void Function() onTab;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      child: Container(
          height: MediaQuery.of(context).size.height / 6,
          margin: const EdgeInsets.symmetric(
            vertical: 2,
            horizontal: 4
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(category.imageUrl, scale: 0.2)
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black.withOpacity(0.25)
            ),
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                category.title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                )
              ),
            ),
          )
      ),
    );
  }
}
