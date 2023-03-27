import 'package:flutter_template/data/models/airline.dart';

abstract class IAirlineRepository {
  Future<List<Airline>> get(String name);
}
