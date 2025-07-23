import 'package:flutter/material.dart';
import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/networking.dart';
import 'package:weather_app/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const key = '785ec99797a3c2373669d88ddfcccc6e';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? latitude;
  double? longitude;
  initState() {
    super.initState();
    getLocationData();
  }

  Future<void> getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();

    setState(() {
      latitude = location.latitude;
      longitude = location.longitude;
    });

    NetworkHelper networking = NetworkHelper(
      'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$key&units=metric',
    );

    var weatherData = await networking.getData();

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
