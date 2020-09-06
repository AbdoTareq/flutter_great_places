import 'dart:io';

import 'package:flutter/foundation.dart';

class PlaceLocation {
  double latitude;
  double longitude;
  String address;
  PlaceLocation(
      {@required this.latitude, @required this.longitude, this.address});
}

class Place {
  final String id;
  final String title;
  final PlaceLocation location;
  final File image;

  Place({this.id, this.title, this.location, this.image});

}
