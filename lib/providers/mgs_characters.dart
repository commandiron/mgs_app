import 'package:flutter/material.dart';
import '../model/filter.dart';
import '../model/mgs_character.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../util/constants.dart';

class MgsCharacters with ChangeNotifier {
  List<MgsCharacter> _characters = [];

  List<MgsCharacter> _unFilteredCharacters = [];
  List<MgsCharacter> _filteredCharacters = [];

  List<MgsCharacter> get characters {
    return [..._characters];
  }


  Future<void> fetchCharacters(int page, int limit) async {
    final url =
        Uri.parse("${Constants.localRootUrl}/mgs/characters?page=$page&limit=$limit");
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
            imagePathsDynamicList.map((item) => "${Constants.localRootUrl}$item").toList();

        final shortClipPath = extractedCharacter["shortClipPath"] as String?;
        String? shortClipUrl;
        if(shortClipPath != null) {
          shortClipUrl = "${Constants.localRootUrl}$shortClipPath";
        }

        final gameTagsDynamicList =
        extractedCharacter["gameTags"] as List<dynamic>;
        final gameTags = gameTagsDynamicList.map((item) => item as String).toList();

        loadedCharacters.add(MgsCharacter(
          name: name,
          realName: realName,
          alsoKnownNames: alsoKnownNames,
          nationality: nationality,
          born: born,
          age: age,
          info: info,
          imageUrls: imageUrls,
          coverIndex: 0,
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

  filterCharacters(List<Filter> filters) {
    _filteredCharacters = _unFilteredCharacters;

    for (var filter in filters) {
      if(filter.isSelected) {
        _filteredCharacters = _filteredCharacters.where(
          (character) {
            if (character.gameTags != null) {
              return character.gameTags!.contains(filter.gameTag);
            } else {
              return false;
            }
          }
        ).toList();
      }
    }

    final isAnySelected = filters.any((element) => element.isSelected);

    String? firstFilterGameTag;

    if(isAnySelected) {
      firstFilterGameTag = filters.firstWhere((element) => element.isSelected).gameTag;
    } else {
      firstFilterGameTag = null;
    }

    final filteredCharactersWithNewCoverIndex = _filteredCharacters.map(
      (character) {
        int coverIndex = 0;
        if(firstFilterGameTag != null) {
          coverIndex = character.gameTags?.indexOf(firstFilterGameTag) ?? 0;
          if(coverIndex >= character.imageUrls.length) {
            coverIndex = 0;
          }
        }

        return MgsCharacter(
          name: character.name,
          realName: character.realName,
          alsoKnownNames: character.alsoKnownNames,
          nationality: character.nationality,
          born: character.born,
          age: character.age,
          info: character.info,
          imageUrls: character.imageUrls,
          coverIndex: coverIndex,
          shortClipUrl: character.shortClipUrl,
          gameTags: character.gameTags,
        );
      }
    ).toList();

    _characters = filteredCharactersWithNewCoverIndex;
    notifyListeners();
  }

  Future<void> searchCharacters(String query, int page, int limit) async {
    final url =
      Uri.parse("${Constants.localRootUrl}/mgs/characters/search?query=$query&page=$page&limit=$limit");
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
        imagePathsDynamicList.map((item) => "${Constants.localRootUrl}$item")
            .toList();

        final shortClipPath = extractedCharacter["shortClipPath"] as String?;
        String? shortClipUrl;
        if (shortClipPath != null) {
          shortClipUrl = "${Constants.localRootUrl}$shortClipPath";
        }

        final gameTagsDynamicList =
        extractedCharacter["gameTags"] as List<dynamic>;
        final gameTags = gameTagsDynamicList.map((item) => item as String)
            .toList();

        loadedCharacters.add(
          MgsCharacter(
            name: name,
            realName: realName,
            alsoKnownNames: alsoKnownNames,
            nationality: nationality,
            born: born,
            age: age,
            info: info,
            imageUrls: imageUrls,
            coverIndex: 0,
            shortClipUrl: shortClipUrl,
            gameTags: gameTags
          )
        );

        _characters = loadedCharacters.toList();
        notifyListeners();
      }
    } catch (error) {
      _characters = [];
      notifyListeners();
      throw error;
    }
  }
}
