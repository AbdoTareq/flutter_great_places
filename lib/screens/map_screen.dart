import 'package:flutter/material.dart';
import 'package:flutter_great_places/models/place.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  final bool isSelected;
  final PlaceLocation userLocation;

  const MapScreen(
      {this.isSelected = false,
      this.userLocation =
          const PlaceLocation(latitude: 37.422, longitude: -122.084)});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Map'),
        ),
        body: GoogleMap(
          initialCameraPosition: CameraPosition(
            zoom: 16,
            target: LatLng(
                widget.userLocation.latitude, widget.userLocation.longitude),
          ),
        ));
  }
}
