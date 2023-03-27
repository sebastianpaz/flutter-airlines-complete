import 'dart:convert';

import 'package:flutter_template/data/models/airline.dart';

List<Airline> mapAirlines(String responseBody) {
  List<dynamic> parsedJson = jsonDecode(responseBody);
  List<Airline> items = List<Airline>.from(
      parsedJson.map<Airline>((dynamic i) => Airline.fromJson(i)));

  return items;
}
