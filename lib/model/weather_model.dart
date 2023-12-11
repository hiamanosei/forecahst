class Weather {
  const Weather(
      {required this.city,
      required this.country,
      required this.condition,
      required this.temperature});

  final String city;
  final String country;
  final String temperature;
  final String condition;
  //d0209ca37a87493aaa3134919222512
  //http://api.weatherapi.com/v1/current.json?key=d0209ca37a87493aaa3134919222512&q=London&aqi=no
  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        city: json['location']['name'],
        country: json['location']['country'],
        condition: json['current']['condition']['text'],
        temperature: json['current']['condition']['temp_c']);
  }
}
