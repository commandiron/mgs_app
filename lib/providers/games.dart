import 'dart:convert';
import 'package:flutter/material.dart';
import '../model/game.dart';
import 'package:http/http.dart' as http;

import '../util/constants.dart';

class Games with ChangeNotifier {

  List<Game> _games = [

  ];

  List<Game> get games {
    return [..._games];
  }

  Future<void> fetchGames() async {
    final url = Uri.parse("${Constants.localRootUrl}/mgs/games");
    try {
      final response = await http.get(url);
      final List<Game> loadedGames = [];
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final gamesData = extractedData["games"] as List<dynamic>;
      for(var game in gamesData) {
        final extractedGame = game as Map<String, dynamic>;

        final id = extractedGame["id"] as int;
        final name = extractedGame["name"] as String;
        final logoUrl = "${Constants.localRootUrl}${extractedGame["logoPath"]}";
        final posterUrl = "${Constants.localRootUrl}${extractedGame["posterPath"]}";

        final platformNames = extractedGame["platformNames"] as List<dynamic>;
        final platformLogoPaths = platformNames.map(
          (item) {
            return platformNameToPlatformLogoPath[item];
          }
        ).toList();

        final releaseDate = extractedGame["releaseDate"] as String;
        final summary = extractedGame["summary"] as String;

        loadedGames.add(
          Game(
            id: id,
            name: name,
            logoUrl: logoUrl,
            posterUrl: posterUrl,
            platformLogoPaths: platformLogoPaths,
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

  static Map<String, String> platformNameToPlatformLogoPath = {
    "PlayStation" : "assets/images/platform_logo/ps_logo.png",
    "PlayStation 2" : "assets/images/platform_logo/ps2_logo.png",
    "PlayStation 3" : "assets/images/platform_logo/ps3_logo.png",
    "PlayStation 4" : "assets/images/platform_logo/ps4_logo.png",
    "PlayStation 5 " : "assets/images/platform_logo/ps5_logo.png",
    "PlayStation Vita" : "assets/images/platform_logo/ps_vita_logo.png",
    "XBOX 360" : "assets/images/platform_logo/xbox360_logo.png",
    "Mobile Phone" : "assets/images/platform_logo/mobile_phone_logo.png",
    "Virtual Console" : "assets/images/platform_logo/virtual_console_logo.png",
    "MSX 2" : "assets/images/platform_logo/msx2_logo.png",
    "Nvidia Shield" : "assets/images/platform_logo/nvidia_shield_logo.png",
    "PlayStation Network" : "assets/images/platform_logo/playstation_network_logo.png",
    "Microsoft Windows" : "assets/images/platform_logo/microsoft_windows_logo.png",
  };
}

