import 'dart:collection';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_great_places/helpers/db_helper.dart';
import 'package:flutter_great_places/models/place.dart';

class GreatPlacesProvider extends ChangeNotifier {
  List<Place> _places = [];
  UnmodifiableListView<Place> get places => UnmodifiableListView(_places);

  addPlace(String title, File pickedImage) {
    final newPlace = Place(
        id: DateTime.now().toString(),
        image: pickedImage,
        title: title,
        location: null);
    _places.add(newPlace);
    notifyListeners();
    DBHelper.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      // we store image path not the image
      'image': newPlace.image.path,
    });
  }

  Future<void> fetchAndSetPlaces() async {
    // get list of places maps  
    final placesListMap = await DBHelper.getData('user_places');
    // convert it to a places list 
    _places = placesListMap
        .map((placeMap) => Place(
              id: placeMap['id'],
              title: placeMap['title'],
              image: File(placeMap['image']),
              location: null,
            ))
        .toList();
    notifyListeners();
  }
}
