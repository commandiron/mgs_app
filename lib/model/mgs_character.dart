class MgsCharacter {
  final int id;
  final String name;
  final String? realName;
  final List<String>? alsoKnownNames;
  final String? summary;
  final String imagePath;
  final String? shortClipPath;

  MgsCharacter(
    {
      required this.id,
      required this.name,
      this.realName,
      this.alsoKnownNames,
      this.summary,
      required this.imagePath,
      this.shortClipPath,
    }
  );
}