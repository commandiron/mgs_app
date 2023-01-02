import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mgs_app/providers/game_platforms.dart';
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

        final platformsDynamicList = extractedGame["platforms"] as List<dynamic>?;
        final platforms = platformsDynamicList?.map(
          (item) {
            return GamePlatforms().fromString(item);
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
            platforms: platforms,
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
}

