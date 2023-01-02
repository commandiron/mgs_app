import 'dart:convert';
import 'package:flutter/material.dart';
import '../model/game.dart';
import 'package:http/http.dart' as http;

class Games with ChangeNotifier {

  List<Game> _games = [

  ];

  List<Game> get games {
    return [..._games];
  }

  final localRootUrl = "http://10.0.2.2:8080";

  Future<void> fetchGames() async {
    final url = Uri.parse("$localRootUrl/mgs/games");
    try {
      final response = await http.get(url);
      final List<Game> loadedGames = [];
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final gamesData = extractedData["games"] as List<dynamic>;
      for(var game in gamesData) {
        final extractedGame = game as Map<String, dynamic>;

        final id = extractedGame["id"] as int;
        final name = extractedGame["name"] as String;
        final logoUrl = "$localRootUrl${extractedGame["logoPath"]}";
        final posterUrl = "$localRootUrl${extractedGame["posterPath"]}";

        final platformNames = extractedGame["platformNames"] as List<dynamic>?;
        final platformLogoUrls = platformNames?.map(
          (item) {
            return platformNameToLogoUrl[item];
          }
        ).toList();

        final releaseDate = extractedGame["releaseDate"] as String?;
        final summary = extractedGame["summary"] as String?;

        loadedGames.add(
          Game(
            id: id,
            name: name,
            logoUrl: logoUrl,
            posterUrl: posterUrl,
            platformLogoUrls: platformLogoUrls,
            releaseDate: releaseDate,
            summary: summary,
          )
        );
      }

      _games = loadedGames.toList();
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  static Map<String, String> platformNameToLogoUrl = {
    "PlayStation" : "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/Playstation_logo_colour.svg/1200px-Playstation_logo_colour.svg.png",
    "PlayStation 2" : "https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Playstation2-Logo.svg/1200px-Playstation2-Logo.svg.png",
    "PlayStation 3" : "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/PlayStation_3_logo_%282009%29.svg/2560px-PlayStation_3_logo_%282009%29.svg.png",
    "PlayStation 4" : "https://upload.wikimedia.org/wikipedia/commons/thumb/8/87/PlayStation_4_logo_and_wordmark.svg/1280px-PlayStation_4_logo_and_wordmark.svg.png",
    "PlayStation 5 " : "https://upload.wikimedia.org/wikipedia/commons/thumb/0/00/PlayStation_logo.svg/619px-PlayStation_logo.svg.png",
    "PlayStation Vita" : "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3d/PlayStation_Vita_logo.svg/2560px-PlayStation_Vita_logo.svg.png",
    "XBOX 360" : "https://static.wikia.nocookie.net/logopedia/images/7/7b/Xbox_360_logo.png/",
    "Mobile Phone" : "https://cdn-icons-png.flaticon.com/512/0/191.png",
    "Virtual Console" : "https://upload.wikimedia.org/wikipedia/commons/b/ba/Wii_Virtual_console_Logo.png",
    "MSX 2" : "https://www.msx.org/wiki/images/3/37/MSX2_logo.png",
  };
}

