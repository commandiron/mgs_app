class Game {
  final int id;
  final String name;
  final String logoUrl;
  final String posterUrl;
  final List<String?> platformLogoPaths;
  final String releaseDate;
  final String summary;

  Game(
    {
      required this.id,
      required this.name,
      required this.logoUrl,
      required this.posterUrl,
      required this.platformLogoPaths,
      required this.releaseDate,
      required this.summary,
    }
  );
}