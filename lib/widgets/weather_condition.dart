import 'package:flutter/material.dart';
import 'package:weather_app/utilities/colors.dart';
import 'package:weather_app/widgets/weather_condition_component.dart';

class WeatherCondition extends StatelessWidget {
  const WeatherCondition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(22),
      child: Container(
        height: 90,
        width: double.infinity,
        decoration: BoxDecoration(
          color: CustomColors().weatherConditionColor,
          borderRadius: BorderRadius.circular(27.5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const WeatherConditionComponent(
              image: 'assets/images/lightning/lightning.png',
              headline: '13 km/h',
              subtitle: 'Wind',
              paddingLeft: 37.5,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 30),
              child: VerticalDivider(
                  width: 1, thickness: 1, color: Colors.grey.shade800),
            ),
            const WeatherConditionComponent(
              image: 'assets/images/lightning/lightning.png',
              headline: '22%',
              subtitle: 'Humidity',
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 30),
              child: VerticalDivider(
                  width: 1, thickness: 1, color: Colors.grey.shade800),
            ),
            const WeatherConditionComponent(
              image: 'assets/images/lightning/lightning.png',
              headline: '87%',
              subtitle: 'Rain',
              paddingRight: 42.5,
            ),
          ],
        ),
      ),
    );
  }
}
