import 'package:flutter/material.dart';
import 'package:forecahst/model/weather_model.dart';
import 'package:forecahst/service/weather_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  WeatherService weatherService =
      WeatherService(kAPIKey: 'd0209ca37a87493aaa3134919222512');
  Weather? _weather;

  _fetchweather() async {
    String city = await weatherService.getLocation();
    try {
      final getweather = await weatherService.getWeather(city);
      setState(() {
        _weather = getweather;
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void initState() {
    _fetchweather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text(_weather?.city ?? 'loading city')],
      ),
    );
  }
}
