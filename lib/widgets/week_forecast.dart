import 'package:flutter/material.dart';
import 'package:weather_app/utilities/colors.dart';

class WeekForecast extends StatelessWidget {
  final weekDays = [
    'Mon',
    'Tue  ',
    'Wed',
    'Thu  ',
    'Fri    ',
    'Sat   ',
    'Sun  '
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 7,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(28, 15, 28, 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                weekDays[index],
                style: TextStyle(
                  color: CustomColors().textColorBlueGrey,
                  fontFamily: 'montserrat',
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                ),
              ),
              Row(
                children: [
                  const Image(
                    height: 30,
                    width: 30,
                    image: AssetImage(
                      'assets/images/cloud/17.png',
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'Rainy',
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
                  const Text(
                    "23\u00B0",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'montserrat',
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "17\u00B0",
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
      },
    );
  }
}
