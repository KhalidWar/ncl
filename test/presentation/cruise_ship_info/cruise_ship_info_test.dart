import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ncl_assignment/application/cruise_ship/cruise_ship_notifier.dart';
import 'package:ncl_assignment/application/cruise_ship/cruise_ship_state.dart';
import 'package:ncl_assignment/models/cruise_ship/cruise_ship.dart';
import 'package:ncl_assignment/presentation/cruise_ship_info/cruise_ship_info.dart';
import 'package:ncl_assignment/presentation/cruise_ship_info/cruise_ship_info_keys.dart';

import '../ui_mocks.dart';

void main() {
  Widget infoWidget(CruiseShipNotifier cruiseShipNotifier) {
    return ProviderScope(
      overrides: [
        cruiseShipStateNotifier.overrideWithValue(cruiseShipNotifier),
      ],
      child: const MaterialApp(
        home: CruiseShipInfo(),
      ),
    );
  }

  testWidgets('CruiseShipInfo testing initial state ',
      (WidgetTester tester) async {
    final notifier = CruiseShipNotifier(
      shipServices: MockCruiseShipServices(),
      initialState: CruiseShipState(
        status: CruiseShipStateStatus.initial,
        cruiseShip: CruiseShip.model(),
        errorMessage: '',
      ),
    );

    await tester.pumpWidget(infoWidget(notifier));
    await tester.pumpAndSettle();

    expect(find.byKey(CruiseShipInfoKeys.welcomeText), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(find.byKey(CruiseShipInfoKeys.loadedStateColumn), findsNothing);
    expect(find.byKey(CruiseShipInfoKeys.errorMessage), findsNothing);
  });

  testWidgets('CruiseShipInfo testing loading state ',
      (WidgetTester tester) async {
    final notifier = CruiseShipNotifier(
      shipServices: MockCruiseShipServices(),
      initialState: CruiseShipState(
        status: CruiseShipStateStatus.loading,
        cruiseShip: CruiseShip.model(),
        errorMessage: '',
      ),
    );

    await tester.pumpWidget(infoWidget(notifier));

    expect(find.byKey(CruiseShipInfoKeys.welcomeText), findsNothing);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.byKey(CruiseShipInfoKeys.loadedStateColumn), findsNothing);
    expect(find.byKey(CruiseShipInfoKeys.errorMessage), findsNothing);
  });

  testWidgets('CruiseShipInfo testing loaded state ',
      (WidgetTester tester) async {
    final notifier = CruiseShipNotifier(
      shipServices: MockCruiseShipServices(),
      initialState: CruiseShipState(
        status: CruiseShipStateStatus.loaded,
        cruiseShip: const CruiseShip(
          shipName: 'Test',
          shipFacts: ShipFacts(
            passengerCapacity: '123',
            crew: '000',
            inauguralDate: 'yes',
          ),
        ),
        errorMessage: '',
      ),
    );

    await tester.pumpWidget(infoWidget(notifier));
    await tester.pumpAndSettle();

    expect(find.byKey(CruiseShipInfoKeys.welcomeText), findsNothing);
    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(find.byKey(CruiseShipInfoKeys.loadedStateColumn), findsOneWidget);
    expect(find.byKey(CruiseShipInfoKeys.errorMessage), findsNothing);

    expect(find.text('Test'), findsOneWidget);
    expect(find.text('Crew: 000'), findsOneWidget);
    expect(find.text('Date: yes'), findsOneWidget);
  });

  testWidgets('CruiseShipInfo testing failed state ',
      (WidgetTester tester) async {
    final notifier = CruiseShipNotifier(
      shipServices: MockCruiseShipServices(),
      initialState: CruiseShipState(
        status: CruiseShipStateStatus.failed,
        cruiseShip: CruiseShip.model(),
        errorMessage: 'error',
      ),
    );

    await tester.pumpWidget(infoWidget(notifier));
    await tester.pumpAndSettle();

    expect(find.byKey(CruiseShipInfoKeys.welcomeText), findsNothing);
    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(find.byKey(CruiseShipInfoKeys.loadedStateColumn), findsNothing);
    expect(find.byKey(CruiseShipInfoKeys.errorMessage), findsOneWidget);
    expect(find.text('error'), findsOneWidget);
  });
}
