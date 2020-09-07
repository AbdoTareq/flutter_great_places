import 'dart:collection';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_great_places/models/place.dart';

class GreatPlacesProvider extends ChangeNotifier {
  List<Place> _places = [];
  UnmodifiableListView<Place> get places =>UnmodifiableListView(_places);

  addPlace(String title, File pickedImage) {
    _places.add(Place(
        id: DateTime.now().toString(),
        image: pickedImage,
        title: title,
        location: null));
    notifyListeners();
  }
}
