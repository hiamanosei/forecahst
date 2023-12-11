import 'package:flutter/material.dart';
import 'package:forecahst/model/weather_model.dart';
import 'package:forecahst/service/weather_service.dart';
import 'package:lottie/lottie.dart';

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
      backgroundColor: Colors.black54,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Column(
              children: [
                Text(
                  _weather?.city ?? 'loading city',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          Text(_weather?.condition ?? 'loading condition'),
          Lottie.asset('lib/images/clear sky.json'),
          Text(
            "${_weather?.temperature} °C",
            style: const TextStyle(
                fontSize: 35, fontWeight: FontWeight.w500, wordSpacing: 10),
          )
        ],
      ),
    );
  }
}
