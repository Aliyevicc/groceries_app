import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

Future<String?> getCurrentCity() async {
  try {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);


    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);


    if (placemarks.isNotEmpty) {
      Placemark place = placemarks[0];
      return place.locality;
    }
  } catch (e) {
    print('Error occurred while getting location: $e');
  }
  return null;
}
