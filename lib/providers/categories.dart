import 'package:flutter/material.dart';
import 'package:mgs_app/model/category.dart';

class Categories with ChangeNotifier {
  final List<Category> _items = [
    Category(
      id: 0,
      title: "Games",
      imageUrl: "https://images.gog-statics.com/e7c6ab0d300a11ed9195f0d8bf65954d042a2d4d405d99069edb3fbe3b1906c8_product_card_v2_mobile_slider_639.jpg"
    ),
    Category(
      id: 1,
      title: "Characters",
      imageUrl: "https://static.wikia.nocookie.net/metalgear/images/9/92/Metal_gear_solid4_12.jpg/"
    ),
    Category(
      id: 2,
      title: "Weapons",
      imageUrl: "https://www.imfdb.org/images/5/52/SOCOM.jpg"
    ),
    Category(
        id: 3,
        title: "Events",
        imageUrl: "https://wallpapercave.com/wp/wp8918223.jpg"
    ),
    Category(
        id: 4,
        title: "Metal Gears",
        imageUrl: "https://i.ytimg.com/vi/vX_rLYMz8cE/maxresdefault.jpg"
    ),
    Category(
        id: 5,
        title: "Equipments",
        imageUrl: "https://preview.redd.it/0k4ali39zdu41.png?auto=webp&s=a4abf3afa92d09c9c5b1e37f3c2f9add55dfad76"
    ),
  ];

  List<Category> get items {
    return [..._items];
  }
}