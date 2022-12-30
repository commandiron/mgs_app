class Filter {
  final int id;
  final String name;
  bool selected;
  Filter(
    {
      required this.id,
      required this.name,
      this.selected = false
    }
  );
}