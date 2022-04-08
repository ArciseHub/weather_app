import 'package:flutter/material.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/models/weather_next_7_days.dart';
import 'package:weather_app/services/webServices.dart';
import 'package:weather_app/utilities/colors.dart';
import 'package:weather_app/widgets/weather_condition.dart';
import 'package:weather_app/widgets/week_forecast.dart';

class WeekForecastScreen extends StatefulWidget {
  const WeekForecastScreen({Key? key}) : super(key: key);

  @override
  State<WeekForecastScreen> createState() => _WeekForecastScreenState();
}

class _WeekForecastScreenState extends State<WeekForecastScreen> {
  WebServices services = WebServices();
  Weather? data;
  List<WeatherNext7Days>? dataList;
  Future<void> getData() async {
    data = await services.getCurrentWeather();
    dataList = await services.getWeatherNext7Days();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors().backgroundColor,
      appBar: AppBar(
        backgroundColor: CustomColors().backgroundColor,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.keyboard_arrow_left, size: 26),
        ),
        title: Stack(
          children: [
            const Positioned(
              left: 75,
              top: 5,
              child: Icon(Icons.date_range),
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
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      CustomColors().backgroundColor,
                      CustomColors().backgroundColorTwo
                    ]),
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(44),
                        bottomRight: Radius.circular(44)),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 12.5),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.fromLTRB(28, 40, 28, 28),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.yellow.withOpacity(0.025),
                                  spreadRadius: 1,
                                  blurRadius: 15,
                                  offset: const Offset(1, 1),
                                ),
                              ],
                            ),
                            child: Image(
                              height: 120,
                              width: 120,
                              image: AssetImage(
                                data!.tomorrowImage.toString(),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  const Positioned(
                                    bottom: 110,
                                    child: Text(
                                      "Tomorrow",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'montserrat',
                                        fontWeight: FontWeight.normal,
                                        fontSize: 24,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    child: Row(
                                      children: [
                                        Text(
                                          '${data!.tomorrowTempMax?.round() ?? 0}',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'montserrat',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 96,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 30),
                                          child: Text(
                                            "/${data!.tomorrowTempMin?.round() ?? 0}\u00B0",
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              fontFamily: 'montserrat',
                                              fontWeight: FontWeight.normal,
                                              fontSize: 44,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    top: 112.5,
                                    left: 5,
                                    child: Text(
                                      data!.tomorrowWeatherType.toString(),
                                      style: TextStyle(
                                        color: Colors.grey.shade700,
                                        fontFamily: 'montserrat',
                                        fontWeight: FontWeight.normal,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      WeatherCondition(
                          headline1: '${data!.tomorrowWind?.round() ?? 0}',
                          headline2: data!.tomorrowHumidity.toString(),
                          headline3: data!.tomorrowRain.toString()),
                      const SizedBox(height: 5),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        WeekForecast(),
                      ],
                    ),
                  ),
                ),
                /* const WeekForecastListViewWidget(
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
                ), */
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
