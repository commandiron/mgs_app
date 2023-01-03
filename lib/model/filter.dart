class Filter {
  final int id;
  final String gameTag;
  bool selected;
  Filter(
    {
      required this.id,
      required this.gameTag,
      this.selected = false
    }
  );
}