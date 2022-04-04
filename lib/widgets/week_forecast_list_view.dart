import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.fromLTRB(28, 12.5, 28, 12.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            weekDay,
            style: const TextStyle(
              color: Colors.grey,
              fontFamily: 'montserrat',
              fontWeight: FontWeight.normal,
              fontSize: 22,
            ),
          ),
          Row(
            children: [
              Image(
                height: 40,
                width: 40,
                image: AssetImage(
                  weatherIcon,
                ),
              ),
              const SizedBox(width: 5),
              Text(
                weatherType,
                style: const TextStyle(
                  color: Colors.grey,
                  fontFamily: 'montserrat',
                  fontWeight: FontWeight.normal,
                  fontSize: 22,
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
                  fontSize: 22,
                ),
              ),
              const SizedBox(width: 5),
              Text(
                "$lowestTemperature\u00B0",
                style: const TextStyle(
                  color: Colors.grey,
                  fontFamily: 'montserrat',
                  fontWeight: FontWeight.normal,
                  fontSize: 22,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
