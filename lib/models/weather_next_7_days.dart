import 'package:flutter/material.dart';
import 'package:weather_app/utilities/findIcon.dart';

class WeatherNext7Days {
  double? tempMax;
  double? tempMin;
  int? humidity;
  double? wind;
  String? image;
  String? weatherType;

  WeatherNext7Days({
    this.tempMax,
    this.tempMin,
    this.humidity,
    this.wind,
    this.image,
    this.weatherType,
  });

  factory WeatherNext7Days.fromJSON(Map<String, dynamic> json) {
    return WeatherNext7Days(
      tempMax: json["temp"]["max"],
      tempMin: json["temp"]["min"],
      humidity: json["humidity"],
      wind: json["wind_speed"],
      image: findIcon(json["weather"][0]["main"].toString(), true),
      weatherType: json["weather"][0]["main"],
    );
  }
}
