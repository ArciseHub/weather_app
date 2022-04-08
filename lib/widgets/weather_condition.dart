import 'package:flutter/material.dart';
import 'package:weather_app/utilities/colors.dart';
import 'package:weather_app/widgets/weather_condition_component.dart';

class WeatherCondition extends StatelessWidget {
  const WeatherCondition({
    Key? key,
    required this.headline1,
    required this.headline2,
    required this.headline3,
  }) : super(key: key);

  final String headline1;
  final String headline2;
  final String headline3;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        height: 92.5,
        width: double.infinity,
        decoration: BoxDecoration(
          color: CustomColors().weatherConditionColor,
          borderRadius: BorderRadius.circular(27.5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            WeatherConditionComponent(
              image: 'assets/images/wind/wind1.png',
              headline: '$headline1 km/h',
              subtitle: 'Wind',
              paddingLeft: 37.5,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 30),
              child: VerticalDivider(
                  width: 1, thickness: 1, color: Colors.grey.shade800),
            ),
            WeatherConditionComponent(
              image: 'assets/images/rain/rain_drop.png',
              headline: '$headline2%',
              subtitle: 'Humidity',
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 30),
              child: VerticalDivider(
                  width: 1, thickness: 1, color: Colors.grey.shade800),
            ),
            WeatherConditionComponent(
              image: 'assets/images/rain/rainy.png',
              headline: '$headline3%',
              subtitle: 'Rain',
              paddingRight: 42.5,
            ),
          ],
        ),
      ),
    );
  }
}
