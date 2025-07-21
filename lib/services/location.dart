import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longitude;

  Future<void> getCurrentLocation() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        print('Location services are disabled.');
        return;
      }

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

      /// ✅ Use LocationSettings instead of deprecated `desiredAccuracy`
      final settings = LocationSettings(accuracy: LocationAccuracy.high);

      Position position = await Geolocator.getCurrentPosition(
        locationSettings: settings,
      );

      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print('❌ Error: $e');
    }
  }
}
