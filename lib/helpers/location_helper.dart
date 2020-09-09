import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

const GOOGLE_API_KEY = 'AIzaSyDIudB5Cn0DoKHZa-0JxppyqfGsEYW2KnA';

class LocationHelper {
  static String generateLocationPreviewImage(
      {@required double latitude, @required double longitude}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Alabel:C%7C$latitude,$longitude&key=$GOOGLE_API_KEY';
  }

  static Future<String> getAddressFromLatLng(LatLng latLng) async {
    final addressResponse = await http.get(
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=${latLng.latitude},${latLng.longitude}&key=$GOOGLE_API_KEY');
    print('dart mess: ${json.decode(addressResponse.body)}');
    if (json.decode(addressResponse.body)['error_message'] ==
        'This API project is not authorized to use this API.') {
      return 'This API project is not authorized to use this API.';
    } else
      return json.decode(addressResponse.body)['results'][0]
          ['formatted_address'];
  }
}
