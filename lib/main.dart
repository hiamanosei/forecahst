import 'package:flutter/material.dart';
import 'package:forecahst/pages/weather_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const WeatherPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
    );
  }
}
