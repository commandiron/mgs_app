import 'package:mgs_app/model/category.dart';

class SearchItem {
  String title;
  String imageUrl;
  Category category;

  SearchItem(
    {
      required this.title,
      required this.imageUrl,
      required this.category
    }
  );
}