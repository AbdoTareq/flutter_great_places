import 'package:flutter/material.dart';
import 'package:flutter_great_places/providers/great_places_provider.dart';
import 'package:flutter_great_places/screens/add_place_screen.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your Places',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
          actions: [
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
                })
          ],
        ),
        body: Consumer<GreatPlacesProvider>(
          child: Center(
            child: Container(
              child: Text('Please add a location'),
            ),
          ),
          builder: (ctx, placesProvider, ch) => placesProvider.places.isEmpty
              ? ch
              : ListView.builder(
                  itemCount: placesProvider.places.length,
                  itemBuilder: (ctx, i) => ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          FileImage(placesProvider.places[i].image),
                    ),
                    title: Text('${placesProvider.places[i].title}'),
                  ),
                ),
        ),
      ),
    );
  }
}
