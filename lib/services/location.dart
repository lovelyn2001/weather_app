import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longitude;

  Future<void> getCurrentLocation() async {
    try {
      final LocationSettings locationSettings = LocationSettings(
        accuracy: LocationAccuracy.lowest,
        distanceFilter: 100,
      );

      Position position = await Geolocator.getCurrentPosition(
        locationSettings: locationSettings,
      );
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print('Error getting location: $e');
    }
  }
}
