import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String mapImageUrl;

  Future<void> _getCurrentLocation()async {
    final myLocation = await Location().getLocation();
    print('dart mess: ${myLocation.longitude}');
    print('dart mess: ${myLocation.latitude}');
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
                onPressed: () {},
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
