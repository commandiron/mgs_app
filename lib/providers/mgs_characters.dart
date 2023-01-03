import 'package:flutter/material.dart';
import '../model/filter.dart';
import '../model/mgs_character.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MgsCharacters with ChangeNotifier {
  List<MgsCharacter> _characters = [];

  List<MgsCharacter> _unFilteredCharacters = [];
  List<MgsCharacter> _filteredCharacters = [];

  List<MgsCharacter> get characters {
    return [..._characters];
  }

  final localRootUrl = "http://10.0.2.2:8080";

  Future<void> fetchCharacters(int page, int limit) async {
    final url =
        Uri.parse("$localRootUrl/mgs/characters?page=$page&limit=$limit");
    try {
      final response = await http.get(url);
      final List<MgsCharacter> loadedCharacters = [];
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final charactersData = extractedData["characters"] as List<dynamic>;
      for (var character in charactersData) {
        final extractedCharacter = character as Map<String, dynamic>;

        final name = extractedCharacter["name"] as String;
        final realName = extractedCharacter["realName"] as String?;

        final alsoKnownNamesDynamicList =
            extractedCharacter["alsoKnownNames"] as List<dynamic>?;
        final alsoKnownNames =
            alsoKnownNamesDynamicList?.map((item) => item as String).toList();

        final nationality = extractedCharacter["nationality"] as String?;
        final born = extractedCharacter["born"] as String?;
        final age = extractedCharacter["age"] as String?;
        final info = extractedCharacter["info"] as String?;

        final imagePathsDynamicList =
            extractedCharacter["imagePaths"] as List<dynamic>;
        final imageUrls =
            imagePathsDynamicList.map((item) => "$localRootUrl$item").toList();

        final shortClipUrl = "$localRootUrl${extractedCharacter["shortClipPath"]}";

        final gameTagsDynamicList =
        extractedCharacter["gameTags"] as List<dynamic>?;
        final gameTags =
        gameTagsDynamicList?.map((item) => item as String).toList();

        loadedCharacters.add(MgsCharacter(
          name: name,
          realName: realName,
          alsoKnownNames: alsoKnownNames,
          nationality: nationality,
          born: born,
          age: age,
          info: info,
          imageUrls: imageUrls,
          shortClipUrl: shortClipUrl,
          gameTags: gameTags
        ));
      }
      _characters = loadedCharacters.toList();
      _unFilteredCharacters = loadedCharacters.toList();
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  filterCharacters(Filter filter) {
    if(!filter.selected){
      _characters = _unFilteredCharacters;
      notifyListeners();
      return;
    }
    _filteredCharacters = _characters.where(
      (character) {
        if(character.gameTags != null) {
          return character.gameTags!.contains(filter.gameTag);
        } else {
          return false;
        }
      }
    ).toList();
    _characters = _filteredCharacters;
    notifyListeners();
  }
}
