import 'dart:convert';

import 'package:forecahst/model/weather_model.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  WeatherService({required this.kAPIKey});
  final String baseURL = 'http://api.weatherapi.com/v1';
  final String kAPIKey;
  //get location in longitude and latitude
  Future<String> getLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    //get city

    String? city = placemarks[0].locality;

    return city ?? 'City could not load';
  }

//getting  weather with city location
  Future getWeather(String city) async {
    http.Response response = await http
        .get(Uri.parse('$baseURL/current.json?key=$kAPIKey&q=$city&aqi=no'));

    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error Weather Data could not load');
    }
  }
}
