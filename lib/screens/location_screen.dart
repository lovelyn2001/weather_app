// Import Flutter material package for UI components
import 'package:flutter/material.dart';
// Import CityScreen for navigation
import 'package:weather_app/screens/city_screen.dart';
// Import app constants (styles, decorations, etc.)
import 'package:weather_app/utilities/constants.dart';
// Import Weather service for fetching weather data
import 'package:weather_app/services/weather.dart';

// LocationScreen displays weather information for a specific location.
class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key, this.locationweather});

  // Weather data passed to this screen
  final dynamic locationweather;

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

// State class for LocationScreen
class _LocationScreenState extends State<LocationScreen> {
  // Temperature in double (raw value)
  double temp = 0.0;
  // Temperature as integer (rounded)
  int temperature = 0;
  // Weather condition code
  int condition = 0;
  // Icon representing the weather condition
  String? conditionIcon;
  // Message based on the temperature
  String? tempMessage;
  // Name of the city
  String? cityName;
  // Weather data object
  dynamic weatherData;
  // WeatherModel instance for utility methods
  WeatherModel weatherModel = WeatherModel();

  // Called when the state is initialized
  @override
  void initState() {
    super.initState();
    weatherData = widget.locationweather;
    updateUI(weatherData);
  }

  // Updates the UI with new weather data
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
    // Main UI for displaying weather information
    return Scaffold(
      body: Container(
        // Sets a background image for the location screen.
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
                    onPressed: () async {
                      var weatherData = await weatherModel.getLocationWeather();
                      updateUI(weatherData);
                    },
                    child: Icon(Icons.near_me, size: 50.0),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      var typedName = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return CityScreen();
                          },
                        ),
                      );
                      if (typedName != null) {
                        var weatherData = await weatherModel.getCityWeather(
                          typedName,
                        );
                        updateUI(weatherData);
                      }
                    },
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
