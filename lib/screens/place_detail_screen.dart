import 'package:flutter/material.dart';
import 'package:flutter_great_places/models/place.dart';
import 'package:flutter_great_places/providers/great_places_provider.dart';
import 'package:flutter_great_places/screens/map_screen.dart';
import 'package:provider/provider.dart';

class PlaceDetailScreen extends StatelessWidget {
  static const routeName = '/place-detail';

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments;
    final Place _selectedLocation =
        Provider.of<GreatPlacesProvider>(context, listen: false)
            .findPlaceById(id);
    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedLocation.title),
      ),
      body: Column(
        children: [
          Container(
            height: 250,
            width: double.infinity,
            child: Hero(
              tag: '${_selectedLocation.id}',
              child: Image.file(
                _selectedLocation.image,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            _selectedLocation.location.address,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10,
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (ctx) => MapScreen(
                        isSelected: false,
                        userLocation: PlaceLocation(
                            latitude: _selectedLocation.location.latitude,
                            longitude: _selectedLocation.location.longitude),
                      )));
            },
            child: Text('View on Map'),
          )
        ],
      ),
    );
  }
}
