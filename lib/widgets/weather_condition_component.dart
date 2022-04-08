import 'package:flutter/material.dart';
import 'package:weather_app/utilities/colors.dart';

class WeatherConditionComponent extends StatelessWidget {
  const WeatherConditionComponent(
      {Key? key,
      required this.image,
      required this.headline,
      required this.subtitle,
      this.paddingLeft = 17.5,
      this.paddingRight = 17.5})
      : super(key: key);
  final String image;
  final String headline;
  final String subtitle;
  final double paddingLeft;
  final double paddingRight;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(paddingLeft, 12.5, paddingRight, 12.5),
      child: Column(
        children: [
          Image(
            height: 25,
            width: 25,
            image: AssetImage(
              image,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            headline,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'montserrat',
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 2.5),
          Text(
            subtitle,
            style: TextStyle(
              color: CustomColors().textColorBlueGrey,
              fontFamily: 'montserrat',
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
