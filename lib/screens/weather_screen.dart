import 'package:flutter/material.dart';
import 'package:weather_app/models/city.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/screens/week_forecast_screen.dart';
import 'package:weather_app/services/webServices.dart';
import 'package:weather_app/utilities/colors.dart';
import 'package:weather_app/widgets/searchbar.dart';
import 'package:weather_app/widgets/today_forecast_list_view.dart';
import 'package:weather_app/widgets/update_data.dart';
import 'package:weather_app/widgets/weather_condition.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  WebServices services = WebServices();
  Weather? data;
  City? location;
  Future<void> getData() async {
    data = await services.getCurrentWeather();
    location = await services.getLocation('London');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors().backgroundColor,
      appBar: AppBar(
        backgroundColor: CustomColors().backgroundColor,
        elevation: 0,
        leading: const Icon(Icons.sort, size: 26),
        title: const SearchBar(),
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
                Expanded(
                  child: ListView(
                    children: [
                      const SizedBox(height: 40),
                      Stack(
                        alignment: Alignment.center,
                        clipBehavior: Clip.none,
                        children: [
                          /*  const Positioned(
                      bottom: 215,
                      child: UpdateData(),
                    ), */
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
                              child: Image(
                                height: 210,
                                width: 210,
                                image: AssetImage(
                                  data!.image.toString(),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 185,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${data!.temp?.round() ?? 0}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'montserrat',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 144,
                                  ),
                                ),
                                const Padding(
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
                          Positioned(
                            top: 340,
                            child: Text(
                              data!.weatherType.toString(),
                              style: const TextStyle(
                                color: Colors.grey,
                                fontFamily: 'montserrat',
                                fontWeight: FontWeight.normal,
                                fontSize: 28,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 182.5),
                      WeatherCondition(
                          headline1: '${data!.wind?.round() ?? 0}',
                          headline2: data!.humidity.toString(),
                          headline3: data!.rain.toString()),
                      const SizedBox(height: 7.5),
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
                                    builder: (context) =>
                                        const WeekForecastScreen(),
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
                          padding: const EdgeInsets.only(
                              top: 10, left: 22, right: 7),
                          child: Row(
                            children: const [
                              TodayForecastListView(
                                  temperature: '23', time: '10:00'),
                              TodayForecastListView(
                                  temperature: '23', time: '10:00'),
                              TodayForecastListView(
                                  temperature: '23', time: '10:00'),
                              TodayForecastListView(
                                  temperature: '23', time: '10:00'),
                              TodayForecastListView(
                                  temperature: '23', time: '10:00'),
                              TodayForecastListView(
                                  temperature: '23', time: '10:00'),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
