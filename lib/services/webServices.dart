// ignore_for_file: file_names

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:weather_app/models/city.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/models/weather_next_7_days.dart';
import 'package:weather_app/utilities/findIcon.dart';

class WebServices {
  Future<City>? getLocation(String locationName) async {
    var endpoint = Uri.parse(
        "https://api.openweathermap.org/geo/1.0/direct?q=$locationName&limit=5&appid=e8fcf670d3cc498be53d0374fee36520");

    var response = await http.get(endpoint);
    var body = jsonDecode(response.body);
    print(body);
    return City.fromJSON(body[0]);
  }

  Future<Weather>? getCurrentWeather() async {
    var endpoint = Uri.parse(
        "https://api.openweathermap.org/data/2.5/onecall?lat=51.5072&lon=0.1276&units=metric&appid=e8fcf670d3cc498be53d0374fee36520");

    var response = await http.get(endpoint);
    var body = jsonDecode(response.body);
    //print(body);
    return Weather.fromJSON(body);
  }

  Future<List<WeatherNext7Days>> getWeatherNext7Days() async {
    var endpoint = Uri.parse(
        "https://api.openweathermap.org/data/2.5/onecall?lat=51.5072&lon=0.1276&units=metric&appid=e8fcf670d3cc498be53d0374fee36520");

    var response = await http.get(endpoint);

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);

      List<dynamic> body = json["daily"];

      List<WeatherNext7Days> daily =
          body.map((dynamic item) => WeatherNext7Days.fromJSON(item)).toList();

      print(daily);
      return daily;
    } else {
      throw ("Can't get the Articles");
    }
  }
}
