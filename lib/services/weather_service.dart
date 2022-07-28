import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  Future<WeatherModel?> getWeather({required String cityName}) async {
    WeatherModel? weatherModel;
    try {
      Uri url = Uri.parse(
          "http://api.weatherapi.com/v1/forecast.json?key=bf5b1e8193184ebd9ab163023222707&q=$cityName&days=1&aqi=no&alerts=no");

      http.Response response = await http.get(url);

      Map<String, dynamic> data =
          await const JsonDecoder().convert(response.body);

      // var jsonData = data["forecast"]["forecastday"][0]["day"];

      weatherModel = WeatherModel.fromJson(data);
    } catch (e) {
      print(e);
    }

    return weatherModel;
  }
}
