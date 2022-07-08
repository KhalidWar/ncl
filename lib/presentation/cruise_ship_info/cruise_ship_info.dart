import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ncl_assignment/application/cruise_ship/cruise_ship_notifier.dart';
import 'package:ncl_assignment/application/cruise_ship/cruise_ship_state.dart';
import 'package:ncl_assignment/presentation/cruise_ship_info/cruise_ship_info_keys.dart';

class CruiseShipInfo extends ConsumerWidget {
  const CruiseShipInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cruiseShipState = ref.watch(cruiseShipStateNotifier);
    switch (cruiseShipState.status) {
      case CruiseShipStateStatus.initial:
        return Text(
          'Welcome to NCL!\nPlease select a ship!',
          key: CruiseShipInfoKeys.welcomeText,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline5,
        );

      case CruiseShipStateStatus.loading:
        return const CircularProgressIndicator();

      case CruiseShipStateStatus.loaded:
        final cruiseShip = cruiseShipState.cruiseShip;
        return Column(
          key: CruiseShipInfoKeys.loadedStateColumn,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cruiseShip.shipName,
              style: Theme.of(context).textTheme.headline5,
            ),
            Text('Crew: ${cruiseShip.shipFacts.crew}'),
            Text('Capacity: ${cruiseShip.shipFacts.passengerCapacity}'),
            Text('Date: ${cruiseShip.shipFacts.inauguralDate}'),
          ],
        );

      case CruiseShipStateStatus.failed:
        return Text(
          cruiseShipState.errorMessage,
          key: CruiseShipInfoKeys.errorMessage,
        );
    }
  }
}
