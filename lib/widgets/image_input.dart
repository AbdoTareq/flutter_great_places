import 'dart:io';

import 'package:flutter/material.dart';

class ImageInput extends StatefulWidget {
  ImageInput({Key key}) : super(key: key);

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _storedImage;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Row(
          children: [
            Container(
              width: 200,
              height: 100,
              alignment: Alignment.center,
              child: _storedImage != null
                  ? Image.file(
                      _storedImage,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    )
                  : Text(
                      'No Image taken',
                      textAlign: TextAlign.center,
                    ),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey)),
            ),
            Expanded(
              child: FlatButton.icon(
                icon: Icon(Icons.camera),
                textColor: Theme.of(context).primaryColor,
                label: Text('Take a picture'),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
