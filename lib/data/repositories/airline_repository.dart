import 'package:flutter_template/data/mappers/airline_mapper.dart';
import 'package:flutter_template/data/models/airline.dart';
import 'package:flutter_template/data/network/http_client.dart';
import 'package:flutter_template/data/repositories/interfaces/i_airline_repository.dart';
import 'package:flutter_template/main.dart';

class AirlineRepository implements IAirlineRepository {
  final _httpClient = getIt<HttpClient>();

  @override
  Future<List<Airline>> get(String name) async {
    Map<String, String> queryParameters = {'name': name};
    final response = await _httpClient.get('v1/airlines', queryParameters);
    return mapAirlines(response);
  }
}
