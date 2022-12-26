import 'package:mgs_app/model/game_platform.dart';

class Game {
  final int id;
  final String title;
  final String logoPath;
  final String posterUrl;
  final List<GamePlatform> platforms;
  final String releaseDate;
  final String summary;

  Game(
    {
      required this.id,
      required this.title,
      required this.logoPath,
      required this.posterUrl,
      this.platforms = const [],
      this.releaseDate = "",
      this.summary = "",
    }
  );
}