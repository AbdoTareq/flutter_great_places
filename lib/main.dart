import 'package:flutter/material.dart';
import 'package:flutter_great_places/providers/great_places_provider.dart';
import 'package:flutter_great_places/screens/add_place_screen.dart';
import 'package:flutter_great_places/screens/place_detail_screen.dart';
import 'package:flutter_great_places/screens/places_list_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => GreatPlacesProvider(),
      child: MaterialApp(
        title: 'Great Places',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.amber,
        ),
        home: PlacesListScreen(),
        debugShowCheckedModeBanner: false,
        routes: {
          AddPlaceScreen.routeName: (ctx) => AddPlaceScreen(),
          PlaceDetailScreen.routeName: (ctx) => PlaceDetailScreen(),
        },
      ),
    );
  }
}
