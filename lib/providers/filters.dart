import 'package:flutter/material.dart';

import '../model/filter.dart';

class Filters with ChangeNotifier {
  final List<Filter> _items = [
    Filter(
      id: 0,
      gameTag: "MG"
    ),
    Filter(
      id: 1,
      gameTag: "MG 2"
    ),
    Filter(
      id: 2,
      gameTag: "MGS"
    ),
    Filter(
      id: 3,
      gameTag: "MGS 2"
    ),
    Filter(
      id: 4,
      gameTag: "MGS 3"
    ),
    Filter(
      id: 5,
      gameTag: "MGS 4"
    ),
    Filter(
      id: 6,
      gameTag: "MGS PW"
    ),
    Filter(
      id: 7,
      gameTag: "MGS 5 GZ"
    ),
    Filter(
      id: 8,
      gameTag: "MGS 5 TPP"
    ),
  ];

  List<Filter> get items {
    return [..._items];
  }

  setSelected(int id, bool value) {
    _items.firstWhere((element) => element.id == id).selected = value;
    notifyListeners();
  }
}