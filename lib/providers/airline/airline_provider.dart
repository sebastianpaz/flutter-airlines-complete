import 'package:flutter_template/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/data/models/airline.dart';
import 'package:flutter_template/data/repositories/interfaces/i_airline_repository.dart';

final airlineProvider =
    StateNotifierProvider<AirlineNotifier, List<Airline>>((ref) {
  final IAirlineRepository airlineRepository = getIt<IAirlineRepository>();
  return AirlineNotifier(airlineRepository);
});

class AirlineNotifier extends StateNotifier<List<Airline>> {
  final IAirlineRepository _airlineRepository;
  AirlineNotifier(this._airlineRepository) : super([]);

  void getAirlines(String? name) async {
    if (name != null) {
      List<Airline> airlines = await _airlineRepository.get(name);
      state = airlines;
    }
  }
}
