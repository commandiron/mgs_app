import 'package:flutter/material.dart';

import '../model/filter.dart';

class Filters with ChangeNotifier {
  final List<Filter> _items = [
    Filter(
      id: 0,
      name: "MG"
    ),
    Filter(
      id: 1,
      name: "MG 2"
    ),
    Filter(
      id: 2,
      name: "MGS 1"
    ),
    Filter(
      id: 3,
      name: "MGS 2"
    ),
    Filter(
      id: 4,
      name: "MGS 3"
    ),
    Filter(
      id: 5,
      name: "MGS 4"
    ),
    Filter(
      id: 6,
      name: "MGS 5"
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