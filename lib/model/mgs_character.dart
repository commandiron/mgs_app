class MgsCharacter {
  final String name;
  final String? realName;
  final List<String>? alsoKnownNames;
  final String? nationality;
  final String? born;
  final String? age;
  final String? info;
  final List<String> imageUrls;
  final int coverIndex;
  final String? shortClipUrl;
  final List<String>? gameTags;

  MgsCharacter(
    {
      required this.name,
      this.realName,
      this.alsoKnownNames,
      this.nationality,
      this.born,
      this.age,
      this.info,
      required this.imageUrls,
      required this.coverIndex,
      this.shortClipUrl,
      this.gameTags
    }
  );
}