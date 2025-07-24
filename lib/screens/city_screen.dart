// Import Flutter material package for UI components
import 'package:flutter/material.dart';
// Import app constants (input field decoration, button styles, etc.)
import 'package:weather_app/utilities/constants.dart';

// CityScreen allows the user to enter a city name to fetch weather data.
class CityScreen extends StatefulWidget {
  const CityScreen({super.key});

  @override
  State<CityScreen> createState() => _CityScreenState();
}

// State class for CityScreen
class _CityScreenState extends State<CityScreen> {
  // Holds the city name entered by the user.
  String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Sets a background image for the city screen.
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              // Back button to return to the previous screen.
              Align(
                alignment: Alignment.topLeft,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_ios, size: 50.0),
                ),
              ),
              // Text field for user to input the city name.
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  style: TextStyle(color: Colors.black, fontSize: 20.0),
                  decoration: inputFieldDecoration,
                  onSubmitted: (value) {
                    cityName = value;
                  },
                ),
              ),
              // Button to submit the city name and fetch weather data.
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, cityName);
                },
                child: Text('Get Weather', style: buttonTextStyle),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
