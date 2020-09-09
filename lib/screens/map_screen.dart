import 'package:flutter/material.dart';
import 'package:flutter_great_places/models/place.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

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
  LatLng _pickedLocation;

  _addMarker(LatLng location) {
    setState(() {
      _pickedLocation = location;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Map'),
        actions: [
          if (widget.isSelected)
            IconButton(
                icon: Icon(Icons.check),
                onPressed: _pickedLocation == null
                    ? null
                    : () {
                        Navigator.of(context).pop(_pickedLocation);
                      })
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          zoom: 16,
          target: LatLng(
              widget.userLocation.latitude, widget.userLocation.longitude),
        ),
        // if isSelected is flase that means read only map and disable map onTap
        onTap: widget.isSelected
            ? (location) {
                _addMarker(location);
              }
            : null,
        markers: _pickedLocation != null
            ? {Marker(markerId: MarkerId('m1'), position: _pickedLocation)}
            : null,
      ),
    );
  }
}
