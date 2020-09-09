import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_great_places/models/place.dart';
import 'package:flutter_great_places/providers/great_places_provider.dart';
import 'package:flutter_great_places/widgets/image_input.dart';
import 'package:flutter_great_places/widgets/location_input.dart';
import 'package:provider/provider.dart';

class AddPlaceScreen extends StatefulWidget {
  static const routeName = '/AddPlaceScreen';

  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  File _pickedImage;
  PlaceLocation _pickedLlocation;
  TextEditingController _controller = TextEditingController();

  _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  _selectLocation(PlaceLocation pickedLocation) {
    _pickedLlocation = pickedLocation;
  }

  _savePlace() {
    if (_controller.text.isEmpty ||
        _pickedImage == null ||
        _pickedLlocation == null) {
      print(
          'dart mess: ${_controller.text} ${_pickedImage}, ${_pickedLlocation}}');
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: Text('Please enter fields'),
                content: Text('Please enter missing fields'),
                actions: [
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Ok'),
                  )
                ],
              ));
      return;
    }
    Provider.of<GreatPlacesProvider>(context, listen: false)
        .addPlace(_controller.text, _pickedImage, _pickedLlocation);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a New Place'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                      controller: _controller,
                    ),
                  ),
                  ImageInput(_selectImage),
                  LocationInput(_selectLocation),
                ],
              ),
            ),
          ),
          RaisedButton.icon(
            elevation: 0,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            color: Theme.of(context).accentColor,
            onPressed: _savePlace,
            icon: Icon(Icons.add),
            label: Text('Add Place'),
          )
        ],
      ),
    );
  }
}
