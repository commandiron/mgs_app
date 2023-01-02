import 'package:mgs_app/model/game_platform.dart';

class Game {
  final int id;
  final String name;
  final String logoUrl;
  final String posterUrl;
  final List<GamePlatform?>? platforms;
  final String? releaseDate;
  final String? summary;

  Game(
    {
      required this.id,
      required this.name,
      required this.logoUrl,
      required this.posterUrl,
      this.platforms,
      this.releaseDate,
      this.summary,
    }
  );
}