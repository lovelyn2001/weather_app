// Import Flutter material package for UI components
import 'package:flutter/material.dart';
// Import the LocationScreen to navigate after loading
import 'package:weather_app/screens/location_screen.dart';
// Import a loading spinner widget
import 'package:flutter_spinkit/flutter_spinkit.dart';
// Import the Weather service to fetch weather data
import 'package:weather_app/services/weather.dart';

// LoadingScreen shows a loading spinner while fetching weather data.
class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  initState() {
    super.initState();
    getLocationData();
  }

  // Fetches weather data and navigates to LocationScreen
  Future<void> getLocationData() async {
    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getLocationWeather();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LocationScreen(locationweather: weatherData),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SpinKitFadingFour(color: Colors.white, size: 50.0));
  }
}
