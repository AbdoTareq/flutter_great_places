import 'package:flutter/material.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your Places',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
          actions: [IconButton(icon: Icon(Icons.add), onPressed: () {})],
        ),
        body: Center(
          child: Container(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
