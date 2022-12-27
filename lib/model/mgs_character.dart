class MgsCharacter {
  final int id;
  final String name;
  final String? realName;
  final List<String>? alsoKnownNames;
  final String imagePath;
  final String? shortClipPath;

  MgsCharacter(
    {
      required this.id,
      required this.name,
      this.realName,
      this.alsoKnownNames,
      required this.imagePath,
      this.shortClipPath,
    }
  );
}