import 'package:flutter/material.dart';

class WeatherModel {
  String date;
  String cityName;
  double temp;
  double minTemp;
  double maxTemp;
  String weatherStateName;
  String icon;
  WeatherModel({
    required this.date,
    required this.cityName,
    required this.temp,
    required this.minTemp,
    required this.maxTemp,
    required this.weatherStateName,
    required this.icon,
  });

  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data["forecast"]["forecastday"][0]["day"];

    return WeatherModel(
      date: data["location"]["localtime"],
      cityName: data["location"]["name"],
      temp: jsonData["avgtemp_c"],
      minTemp: jsonData["mintemp_c"],
      maxTemp: jsonData["maxtemp_c"],
      weatherStateName: jsonData["condition"]["text"],
      icon: jsonData["condition"]["icon"],
    );
  }

  MaterialColor getThemeColor() {
    if (weatherStateName == 'Clear' || weatherStateName == 'Light Cloud') {
      return Colors.orange;
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == "Snow" ||
        weatherStateName == "Hail") {
      return Colors.blue;
    } else if (weatherStateName == "Heavy Cloud") {
      return Colors.blueGrey;
    } else if (weatherStateName == "light Rain" ||
        weatherStateName == "Heavy Rain" ||
        weatherStateName == "Showers") {
      return Colors.blue;
    } else {
      return Colors.orange;
    }
  }
}
