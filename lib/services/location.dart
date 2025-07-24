// Import geolocator package for location services
import 'package:geolocator/geolocator.dart';

// Location class handles fetching the device's current latitude and longitude
class Location {
  // Latitude of the current location
  double? latitude;
  // Longitude of the current location
  double? longitude;

  // Gets the current location of the device
  Future<void> getCurrentLocation() async {
    try {
      // Check if location services are enabled
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        print('Location services are disabled.');
        return;
      }

      // Check and request location permissions
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          print('Location permission denied.');
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        print('Location permission permanently denied.');
        return;
      }

      // Use high accuracy for location
      final settings = LocationSettings(accuracy: LocationAccuracy.high);

      // Get the current position
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: settings,
      );

      latitude = position.latitude;
      longitude = position.longitude;
      print(latitude);
      print(longitude);
    } catch (e) {
      print('Error: $e');
    }
  }
}
