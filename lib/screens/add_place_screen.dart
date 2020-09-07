import 'package:flutter/material.dart';
import 'package:flutter_great_places/widgets/image_input.dart';

class AddPlaceScreen extends StatelessWidget {
  static const routeName = '/AddPlaceScreen';
  @override
  Widget build(BuildContext context) {
    TextEditingController _controller;
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
                  ImageInput(),
                ],
              ),
            ),
          ),
          RaisedButton.icon(
            elevation: 0,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            color: Theme.of(context).accentColor,
            onPressed: () {},
            icon: Icon(Icons.add),
            label: Text('Add Place'),
          )
        ],
      ),
    );
  }
}
