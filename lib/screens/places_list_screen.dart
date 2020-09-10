import 'package:flutter/material.dart';
import 'package:flutter_great_places/providers/great_places_provider.dart';
import 'package:flutter_great_places/screens/add_place_screen.dart';
import 'package:flutter_great_places/screens/place_detail_screen.dart';
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
        body: FutureBuilder(
          future: Provider.of<GreatPlacesProvider>(context, listen: false)
              .fetchAndSetPlaces(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) =>
              snapshot.connectionState == ConnectionState.waiting
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Consumer<GreatPlacesProvider>(
                      child: Center(
                        child: Container(
                          child: Text('Please add a location'),
                        ),
                      ),
                      builder: (ctx, placesProvider, ch) => placesProvider
                              .places.isEmpty
                          ? ch
                          : ListView.builder(
                              itemCount: placesProvider.places.length,
                              itemBuilder: (ctx, i) => ListTile(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (ctx) => PlaceDetailScreen(),
                                      settings: RouteSettings(
                                          arguments:
                                              placesProvider.places[i].id)));
                                },
                                leading: Hero(
                                  tag: '${placesProvider.places[i].id}',
                                  child: CircleAvatar(
                                    backgroundImage: FileImage(
                                        placesProvider.places[i].image),
                                  ),
                                ),
                                title:
                                    Text('${placesProvider.places[i].title}'),
                                subtitle: Text(
                                    // we should use address not latitude but there is a problem in thre api key so no address returned
                                    '${placesProvider.places[i].location.latitude}\n${placesProvider.places[i].location.address}'),
                              ),
                            ),
                    ),
        ),
      ),
    );
  }
}
