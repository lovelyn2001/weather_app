import 'package:flutter/material.dart';
import 'package:weather_app/utilities/constants.dart';
import 'package:weather_app/services/weather.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key, this.locationweather});

  final dynamic locationweather;

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  double temp = 0.0;
  int temperature = 0;
  int condition = 0;
  String? conditionIcon;
  String? tempMessage;
  String? cityName;
  dynamic weatherData;
  WeatherModel weatherModel = WeatherModel();

  @override
  void initState() {
    super.initState();
    weatherData = widget.locationweather;
    updateUI(weatherData);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      condition = weatherData['weather'][0]['id'];
      cityName = weatherData['name'];
      conditionIcon = weatherModel.getWeatherIcon(condition);
      tempMessage = weatherModel.getMessage(temperature);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              const Color.fromRGBO(255, 255, 255, 0.8),
              BlendMode.dstATop,
            ),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {},
                    child: Icon(Icons.near_me, size: 50.0),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Icon(Icons.location_city, size: 50.0),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text('$temperature', style: tempTextStyle),
                    Text('$conditionIcon', style: conditionTextStyle),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$tempMessage in $cityName!",
                  textAlign: TextAlign.right,
                  style: messageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
