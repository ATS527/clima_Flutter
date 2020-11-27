import 'package:geolocator/geolocator.dart';

class Location {
  double lattitude;
  double longitude;
  Position position;

  Future<void> getCurrentLocation() async {
    try {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      lattitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
