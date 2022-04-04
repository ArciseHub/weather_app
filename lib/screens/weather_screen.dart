import 'package:flutter/material.dart';
import 'package:weather_app/screens/week_forecast_screen.dart';
import 'package:weather_app/utilities/colors.dart';
import 'package:weather_app/widgets/today_forecast_list_view.dart';
import 'package:weather_app/widgets/update_data.dart';
import 'package:weather_app/widgets/weather_condition.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors().backgroundColor,
      appBar: AppBar(
        backgroundColor: CustomColors().backgroundColor,
        elevation: 0,
        leading: const Icon(Icons.menu, size: 26),
        title: Stack(
          children: [
            const Positioned(
              left: 75,
              top: 5,
              child: Icon(Icons.location_on),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(width: 7.5),
                Text(
                  'Minsk',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.more_vert, size: 26),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 60),
          Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              const Positioned(
                bottom: 235,
                child: UpdateData(),
              ),
              Positioned(
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.yellow.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 75,
                        offset: const Offset(1, 1),
                      ),
                    ],
                  ),
                  child: const Image(
                    height: 210,
                    width: 210,
                    image: AssetImage(
                      'assets/images/cloud/thunder.png',
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 185,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "23",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'montserrat',
                        fontWeight: FontWeight.bold,
                        fontSize: 144,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 70),
                      child: Text(
                        "\u00B0",
                        style: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'montserrat',
                          fontWeight: FontWeight.normal,
                          fontSize: 45,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Positioned(
                top: 340,
                child: Text(
                  'Thunderclouds',
                  style: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'montserrat',
                    fontWeight: FontWeight.normal,
                    fontSize: 28,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 175),
          const WeatherCondition(),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Today',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WeekForecastScreen(),
                      ),
                    );
                  },
                  child: Row(
                    children: const [
                      Text(
                        '7 days',
                        style: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'montserrat',
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 2),
                        child: Icon(Icons.keyboard_arrow_right,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 22, right: 7),
              child: Row(
                children: const [
                  TodayForecastListView(temperature: '23', time: '10:00'),
                  TodayForecastListView(temperature: '23', time: '10:00'),
                  TodayForecastListView(temperature: '23', time: '10:00'),
                  TodayForecastListView(temperature: '23', time: '10:00'),
                  TodayForecastListView(temperature: '23', time: '10:00'),
                  TodayForecastListView(temperature: '23', time: '10:00'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
