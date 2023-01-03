class Category {
  final int id;
  final String title;
  final String imagePath;
  final bool isUnderConstruction;

  Category({required this.id, required this.title, required this.imagePath, this.isUnderConstruction = false});
}