import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/data/models/airline.dart';
import 'package:flutter_template/providers/airline/airline_provider.dart';
import 'package:flutter_template/ui/components/airline_item.dart';

class HomeWidget extends ConsumerStatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends ConsumerState<HomeWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final inputController = TextEditingController();
    // Return data from provider

    void getAirlines() {
      ref.read(airlineProvider.notifier).getAirlines(inputController.text);
    }

    List<Airline> airlines = ref.watch(airlineProvider);

    return Scaffold(
        appBar: AppBar(title: Text(locale.home)),
        body: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(children: [
              const Text(
                "Búsqueda de aerolineas",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              const Divider(),
              SizedBox(
                height: 50,
                child: TextField(
                  controller: inputController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Buscar por nombre de aerolínea',
                  ),
                ),
              ),
              if (airlines.isEmpty)
                const Spacer()
              else
                Expanded(
                  child: ListView.builder(
                    itemCount: airlines.length,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    itemBuilder: (context, index) {
                      final item = airlines[index];
                      return AirlineItem(airline: item);
                    },
                  ),
                ),
              MaterialButton(
                  onPressed: () => getAirlines(), child: const Text("Buscar")),
            ])));
  }
}
