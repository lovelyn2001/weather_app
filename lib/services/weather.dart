import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/networking.dart';

// API key for OpenWeatherMap
const key = '785ec99797a3c2373669d88ddfcccc6e';
// Base URL for OpenWeatherMap API
const opernWeatherMapUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  // WeatherModel provides methods to fetch weather data and interpret results.
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
      '$opernWeatherMapUrl?q=$cityName&appid=$key&units=metric',
    );

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    double? latitude = location.latitude;
    double? longitude = location.longitude;
    NetworkHelper networking = NetworkHelper(
      '$opernWeatherMapUrl?lat=$latitude&lon=$longitude&appid=$key&units=metric',
    );

    var weatherData = await networking.getData();
    return weatherData;
  }

  // Fetch weather data for the current device location
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  // Get a message based on the temperature
  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
