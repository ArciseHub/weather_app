import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/screens/weather_screen.dart';
import 'package:weather_app/utilities/colors.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: CustomColors().backgroundColor,
    statusBarColor: CustomColors().backgroundColor,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WeatherScreen(),
    );
  }
}
