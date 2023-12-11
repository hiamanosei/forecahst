class Weather {
  const Weather(
      {required this.city,
      required this.country,
      required this.condition,
      required this.temperature});

  final String city;
  final String country;
  final double temperature;
  final String condition;

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      city: json['location']['name'],
      country: json['location']['country'],
      condition: json['current']['condition']['text'],
      temperature: json['current']['temp_c'],
    );
  }
}
