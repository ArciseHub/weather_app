import 'package:flutter/material.dart';
import 'package:weather_app/utilities/colors.dart';
import 'package:weather_app/widgets/weather_condition.dart';
import 'package:weather_app/widgets/week_forecast_list_view.dart';

class WeekForecastScreen extends StatelessWidget {
  const WeekForecastScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors().backgroundColor,
      appBar: AppBar(
        backgroundColor: CustomColors().backgroundColor,
        elevation: 0,
        leading: const Icon(Icons.keyboard_arrow_left, size: 26),
        title: Stack(
          children: [
            const Positioned(
              left: 75,
              top: 5,
              child: Icon(Icons.calendar_month),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(width: 22.5),
                Text(
                  '7 days',
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
          Container(
            decoration: const BoxDecoration(),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.yellow.withOpacity(0.05),
                            spreadRadius: 1,
                            blurRadius: 25,
                            offset: const Offset(1, 1),
                          ),
                        ],
                      ),
                      child: const Image(
                        height: 140,
                        width: 140,
                        image: AssetImage(
                          'assets/images/cloud/thunder.png',
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Tomorrow",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'montserrat',
                            fontWeight: FontWeight.normal,
                            fontSize: 24,
                          ),
                        ),
                        Row(
                          children: const [
                            Text(
                              "20",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'montserrat',
                                fontWeight: FontWeight.bold,
                                fontSize: 96,
                              ),
                            ),
                            Text(
                              "/17\u00B0",
                              style: TextStyle(
                                color: Colors.grey,
                                fontFamily: 'montserrat',
                                fontWeight: FontWeight.normal,
                                fontSize: 42,
                              ),
                            ),
                          ],
                        ),
                        const Text(
                          "Rainy - Cloudy",
                          style: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'montserrat',
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const WeatherCondition(),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const WeekForecastListViewWidget(
            weekDay: 'Mon',
            weatherType: 'Rainy',
            highestTemperature: '+20',
            lowestTemperature: '+14',
          ),
          const WeekForecastListViewWidget(
            weekDay: 'Tue  ',
            weatherType: 'Rainy',
            highestTemperature: '+20',
            lowestTemperature: '+14',
          ),
          const WeekForecastListViewWidget(
            weekDay: 'Wed',
            weatherType: 'Rainy',
            highestTemperature: '+20',
            lowestTemperature: '+14',
          ),
          const WeekForecastListViewWidget(
            weekDay: 'Thu  ',
            weatherType: 'Rainy',
            highestTemperature: '+20',
            lowestTemperature: '+14',
          ),
          const WeekForecastListViewWidget(
            weekDay: 'Fri    ',
            weatherType: 'Rainy',
            highestTemperature: '+20',
            lowestTemperature: '+14',
          ),
          const WeekForecastListViewWidget(
            weekDay: 'Sat   ',
            weatherType: 'Rainy',
            highestTemperature: '+20',
            lowestTemperature: '+14',
          ),
          const WeekForecastListViewWidget(
            weekDay: 'Sun  ',
            weatherType: 'Rainy',
            highestTemperature: '+20',
            lowestTemperature: '+14',
          ),
        ],
      ),
    );
  }
}
