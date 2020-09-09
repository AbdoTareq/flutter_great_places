import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_great_places/helpers/location_helper.dart';
import 'package:flutter_great_places/models/place.dart';
import 'package:flutter_great_places/screens/map_screen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  final Function onSelectLocation;

  const LocationInput(this.onSelectLocation);

  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String mapImageUrl;

  Future<void> _getCurrentLocation() async {
    try {
      final myLocation = await Location().getLocation();
      _showPreview(PlaceLocation(
          latitude: myLocation.latitude, longitude: myLocation.longitude));
      widget.onSelectLocation(PlaceLocation(
          latitude: myLocation.latitude, longitude: myLocation.longitude));
    } catch (e) {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: Text('Location permission needed'),
                content: Text('Please give Location permission!'),
                actions: [
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Ok'),
                  )
                ],
              ));
    }
  }

  void _showPreview(PlaceLocation myLocation) {
    print('dart mess: ${myLocation.longitude}');
    print('dart mess: ${myLocation.latitude}');
    final imageUrl = LocationHelper.generateLocationPreviewImage(
        latitude: myLocation.latitude, longitude: myLocation.longitude);
    setState(() {
      mapImageUrl = imageUrl;
    });
  }

  Future<void> _selectOnMap() async {
    final LatLng selectedLocation =
        await Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) => MapScreen(
                  isSelected: true,
                )));
    if (selectedLocation == null) {
      return;
    }
    print('dart mess: ${selectedLocation.latitude}');
    final pickedLocation = PlaceLocation(
        latitude: selectedLocation.latitude,
        longitude: selectedLocation.longitude);

    _showPreview(pickedLocation);
    widget.onSelectLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          margin: EdgeInsets.all(8),
          decoration:
              BoxDecoration(border: Border.all(color: Colors.grey, width: 1)),
          alignment: Alignment.center,
          child: mapImageUrl == null
              ? Text(
                  'No location chosen',
                  textAlign: TextAlign.center,
                )
              : Image.network(
                  mapImageUrl,
                  height: 78,
                  fit: BoxFit.cover,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton.icon(
                onPressed: _getCurrentLocation,
                icon: Icon(
                  Icons.location_on,
                  color: Theme.of(context).primaryColor,
                ),
                label: Text('Current Location')),
            FlatButton.icon(
                onPressed: _selectOnMap,
                icon: Icon(
                  Icons.map,
                  color: Theme.of(context).primaryColor,
                ),
                label: Text('Select on Map')),
          ],
        )
      ],
    );
  }
}
