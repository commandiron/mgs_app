import 'package:flutter/material.dart';
import 'package:mgs_app/model/category.dart';

class Categories with ChangeNotifier {
  final List<Category> _items = [
    Category(
      id: 0,
      title: "Games",
      imagePath: "assets/images/categories/category_games_image.jpg"
    ),
    Category(
      id: 1,
      title: "Characters",
      imagePath: "assets/images/categories/category_characters_image.jpg"
    ),
    Category(
      id: 2,
      title: "Weapons",
      imagePath: "assets/images/categories/category_weapons_image.jpg",
      isUnderConstruction: true
    ),
    Category(
      id: 3,
      title: "Events",
      imagePath: "assets/images/categories/category_events_image.jpg",
      isUnderConstruction: true
    ),
    Category(
      id: 4,
      title: "Metal Gears",
      imagePath: "assets/images/categories/category_metal_gears_image.jpg",
      isUnderConstruction: true
    ),
    Category(
      id: 5,
      title: "Equipments",
      imagePath: "assets/images/categories/category_equipments_image.jpg",
      isUnderConstruction: true
    ),
  ];

  List<Category> get items {
    return [..._items];
  }
}