import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter_great_places/models/place.dart';

class GreatPlacesProvider extends ChangeNotifier {
  List<Place> _places = [];
  UnmodifiableListView<Place> get places => _places;

}
