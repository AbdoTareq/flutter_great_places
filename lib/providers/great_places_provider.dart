import 'dart:collection';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_great_places/helpers/db_helper.dart';
import 'package:flutter_great_places/helpers/location_helper.dart';
import 'package:flutter_great_places/models/place.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GreatPlacesProvider extends ChangeNotifier {
  List<Place> _places = [];
  UnmodifiableListView<Place> get places => UnmodifiableListView(_places);

  Future<void> addPlace(
      String title, File pickedImage, PlaceLocation pickedPlace) async {
    final placeAddress = await LocationHelper.getAddressFromLatLng(
        LatLng(pickedPlace.latitude, pickedPlace.longitude));
    final placeWithAddress = PlaceLocation(
        latitude: pickedPlace.latitude,
        longitude: pickedPlace.longitude,
        address: placeAddress);

    final newPlace = Place(
        id: DateTime.now().toString(),
        image: pickedImage,
        title: title,
        location: placeWithAddress);
    _places.add(newPlace);
    notifyListeners();
    DBHelper.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      // we store image path not the image
      'image': newPlace.image.path,
      'lat': newPlace.location.latitude,
      'lng': newPlace.location.longitude,
      'address': newPlace.location.address,
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
              location: PlaceLocation(
                latitude: placeMap['lat'],
                longitude: placeMap['lng'],
                address: placeMap['address'],
              ),
            ))
        .toList();
    notifyListeners();
  }
}
