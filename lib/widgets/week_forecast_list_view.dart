import 'package:flutter/material.dart';
import 'package:weather_app/utilities/colors.dart';

class WeekForecastListViewWidget extends StatelessWidget {
  const WeekForecastListViewWidget(
      {Key? key,
      required this.weekDay,
      this.weatherIcon = 'assets/images/cloud/thunder.png',
      required this.weatherType,
      required this.highestTemperature,
      required this.lowestTemperature})
      : super(key: key);
  final String weekDay;
  final String weatherIcon;
  final String weatherType;
  final String highestTemperature;
  final String lowestTemperature;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(28, 15, 28, 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            weekDay,
            style: TextStyle(
              color: CustomColors().textColorBlueGrey,
              fontFamily: 'montserrat',
              fontWeight: FontWeight.normal,
              fontSize: 18,
            ),
          ),
          Row(
            children: [
              Image(
                height: 30,
                width: 30,
                image: AssetImage(
                  weatherIcon,
                ),
              ),
              const SizedBox(width: 5),
              Text(
                weatherType,
                style: TextStyle(
                  color: CustomColors().textColorBlueGrey,
                  fontFamily: 'montserrat',
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "$highestTemperature\u00B0",
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'montserrat',
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                ),
              ),
              const SizedBox(width: 5),
              Text(
                "$lowestTemperature\u00B0",
                style: TextStyle(
                  color: CustomColors().textColorBlueGrey,
                  fontFamily: 'montserrat',
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
