import 'package:weather_app/utilities/findIcon.dart';

class Weather {
  double? lat;
  double? lon;
  int? rain;
  double? temp;
  double? wind;
  int? humidity;
  String? weatherType;
  String? image;
  String? time;
  double? tomorrowTempMax;
  double? tomorrowTempMin;
  String? tomorrowWeatherType;
  String? tomorrowImage;
  double? tomorrowWind;
  int? tomorrowHumidity;
  int? tomorrowRain;

  Weather(
      {this.lat,
      this.lon,
      this.rain,
      this.temp,
      this.wind,
      this.humidity,
      this.weatherType,
      this.image,
      this.time,
      this.tomorrowTempMax,
      this.tomorrowTempMin,
      this.tomorrowWeatherType,
      this.tomorrowImage,
      this.tomorrowHumidity,
      this.tomorrowRain,
      this.tomorrowWind});

  factory Weather.fromJSON(Map<String, dynamic> json) {
    return Weather(
      lat: json["lat"],
      lon: json["lon"],
      rain: json["current"]["clouds"],
      temp: json["current"]["temp"],
      wind: json["current"]["wind_speed"],
      humidity: json["current"]["humidity"],
      weatherType: json["current"]["weather"][0]["main"],
      image: findIcon(json["current"]["weather"][0]["main"].toString(), true),
      tomorrowTempMax: json["daily"][0]["temp"]["max"],
      tomorrowTempMin: json["daily"][0]["temp"]["min"],
      tomorrowWeatherType: json["daily"][0]["weather"][0]["main"],
      tomorrowImage:
          findIcon(json["daily"][0]["weather"][0]["main"].toString(), true),
      tomorrowHumidity: json["daily"][0]["humidity"],
      tomorrowWind: json["daily"][0]["wind_speed"],
      tomorrowRain: json["daily"][0]["clouds"],
    );
  }
}
