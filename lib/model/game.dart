class Game {
  final int id;
  final String name;
  final String logoUrl;
  final String posterUrl;
  final List<String?>? platformLogoPaths;
  final String? releaseDate;
  final String? summary;

  Game(
    {
      required this.id,
      required this.name,
      required this.logoUrl,
      required this.posterUrl,
      this.platformLogoPaths,
      this.releaseDate,
      this.summary,
    }
  );
}