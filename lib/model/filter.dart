class Filter {
  final int id;
  final String gameTag;
  bool isSelected;
  Filter(
    {
      required this.id,
      required this.gameTag,
      this.isSelected = false
    }
  );
}