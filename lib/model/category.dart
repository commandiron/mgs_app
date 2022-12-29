class Category {
  final int id;
  final String title;
  final String imageUrl;
  final bool isUnderConstruction;

  Category({required this.id, required this.title, required this.imageUrl, this.isUnderConstruction = false});
}