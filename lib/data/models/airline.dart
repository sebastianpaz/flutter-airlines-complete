import 'package:flutter_template/constants/assets.dart';

class Airline {
  String name;
  String logoUrl;
  String icao;
  String iata;

  Airline({
    required this.name,
    required this.logoUrl,
    required this.icao,
    required this.iata,
  });

  // See sample response from the API to understand how the JSON is
  // converted to an Airline model. https://api-ninjas.com/api/airlines
  factory Airline.fromJson(Map<String, dynamic> json) {
    return Airline(
        name: json['name'],
        logoUrl: json['logo_url'] ?? placeholderImage,
        icao: json['icao'],
        iata: json['iata']);
  }
}
