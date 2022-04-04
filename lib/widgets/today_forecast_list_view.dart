import 'package:flutter/material.dart';
import 'package:weather_app/utilities/colors.dart';

class TodayForecastListView extends StatelessWidget {
  const TodayForecastListView(
      {Key? key,
      required this.temperature,
      this.image = 'assets/images/cloud/17.png',
      required this.time})
      : super(key: key);
  final String temperature;
  final String image;
  final String time;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Container(
        padding:
            const EdgeInsets.only(top: 10, left: 17.5, right: 17.5, bottom: 10),
        decoration: BoxDecoration(
          color: CustomColors().todayForecastBackgroundColor,
          border: Border.all(width: 1, color: Colors.grey.shade900),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Column(
            children: [
              Text(
                "$temperature\u00B0",
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'montserrat',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 5),
              Image(
                height: 40,
                width: 40,
                image: AssetImage(
                  image,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                time,
                style: const TextStyle(
                  color: Colors.grey,
                  fontFamily: 'montserrat',
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
