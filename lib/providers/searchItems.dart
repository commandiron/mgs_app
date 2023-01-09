import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mgs_app/providers/categories.dart';
import '../model/searchItem.dart';
import '../util/constants.dart';
import 'package:http/http.dart' as http;

class SearchItems with ChangeNotifier {
  List<SearchItem> _items = [];

  List<SearchItem> get items {
    return [..._items];
  }

  Future<void> search(String query, int page, int limit) async {
    _items = [];

    final characterSearchItems = await _searchCharacters(query, page, limit);
    if(characterSearchItems != null) {
      _items += characterSearchItems;
    }

    final gameSearchItems = await _searchGames(query);
    if(gameSearchItems != null) {
      _items += gameSearchItems;
    }

    notifyListeners();
  }

  Future<List<SearchItem>?> _searchGames (String query) async {
    final url =
    Uri.parse("${Constants.localRootUrl}/mgs/games/search?query=$query");
    try {
      final response = await http.get(url);
      final List<SearchItem> loadedItems = [];
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final gamesData = extractedData["games"] as List<dynamic>;
      for (var game in gamesData) {
        final extractedGame = game as Map<String, dynamic>;

        final name =  extractedGame["name"] as String;
        final posterPath =  extractedGame["posterPath"] as String;
        final  posterUrl = "${Constants.localRootUrl}$posterPath";

        loadedItems.add(
            SearchItem(
                title: name,
                imageUrl: posterUrl,
                category: Categories().items[0]
            )
        );
      }
      return loadedItems;
    } catch (error) {
      notifyListeners();
      throw error;
    }
  }

  Future<List<SearchItem>?> _searchCharacters (String query, int page, int limit) async {
    final url =
    Uri.parse("${Constants.localRootUrl}/mgs/characters/search?query=$query&page=$page&limit=$limit");
    try {
      final response = await http.get(url);
      final List<SearchItem> loadedItems = [];
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final charactersData = extractedData["characters"] as List<dynamic>;
      for (var character in charactersData) {
        final extractedCharacter = character as Map<String, dynamic>;

        final name = extractedCharacter["name"] as String;

        final imagePathsDynamicList =
        extractedCharacter["imagePaths"] as List<dynamic>;
        final imageUrls =
        imagePathsDynamicList.map((item) => "${Constants.localRootUrl}$item")
            .toList();

        loadedItems.add(
          SearchItem(
            title: name,
            imageUrl: imageUrls[0],
            category: Categories().items[1]
          )
        );
      }
      return loadedItems;
    } catch (error) {
      notifyListeners();
      throw error;
    }
  }
}