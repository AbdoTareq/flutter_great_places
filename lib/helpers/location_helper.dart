import 'package:flutter/foundation.dart';

const GOOGLE_API_KEY = 'AIzaSyDIudB5Cn0DoKHZa-0JxppyqfGsEYW2KnA';

class LocationHelper {
  static String generateLocationPreviewImage(
      {@required double latitude,@required double longitude}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Alabel:C%7C$latitude,$longitude&key=$GOOGLE_API_KEY';
  }
}
