import 'package:flutter/material.dart';
import 'package:weather_app/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
    getLocation();
  }

  Future<void> getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();

    setState(() {
      latitude = location.latitude;
      longitude = location.longitude;
    });
    print('Latitude: ${location.latitude}, Longitude: ${location.longitude}');
  }

  void getWeatherData() async {
    http.Response response = await http.get(
      Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=785ec99797a3c2373669d88ddfcccc6e',
      ),
    );
    if (response.statusCode == 200) {
      String data = response.body;
      double temperature;
      int condition;
      String cityName;
      dynamic decodedData = jsonDecode(data);

      temperature = decodedData['main']['temp'];
      print('Temperature: $temperature');
      condition = decodedData['weather'][0]['id'];
      print('Condition: $condition');
      cityName = decodedData['name'];
      print('City Name: $cityName');
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await getLocation();
            getWeatherData();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
