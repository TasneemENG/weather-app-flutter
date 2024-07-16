import 'package:flutter/material.dart';
import 'package:weather_app/view/HomeScreen.dart';
import 'package:weather_app/view/WeatherScreen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'WeatherScreen': (context) => WeatherScreen(),
      },
      debugShowCheckedModeBanner: false,
      home:HomePage(),
    );
  }
}
