import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ncl_assignment/application/cruise_ship/cruise_ship_notifier.dart';
import 'package:ncl_assignment/presentation/cruise_ship_info/cruise_ship_info.dart';
import 'package:ncl_assignment/presentation/home_screen_keys.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      key: HomeScreenKeys.scaffold,
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('NCL Assignment')),
      body: Column(
        key: HomeScreenKeys.bodyColumn,
        children: [
          const Expanded(child: Center(child: CruiseShipInfo())),
          Row(
            key: HomeScreenKeys.buttonsRow,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                child: const Text('SKY'),
                onPressed: () {
                  ref
                      .read(cruiseShipStateNotifier.notifier)
                      .fetchCruiseShip('SKY');
                },
              ),
              TextButton(
                child: const Text('BLISS'),
                onPressed: () {
                  ref
                      .read(cruiseShipStateNotifier.notifier)
                      .fetchCruiseShip('BLISS');
                },
              ),
              TextButton(
                child: const Text('ESCAPE'),
                onPressed: () {
                  ref
                      .read(cruiseShipStateNotifier.notifier)
                      .fetchCruiseShip('ESCAPE');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
