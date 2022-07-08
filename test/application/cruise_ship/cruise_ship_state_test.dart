import 'package:flutter_test/flutter_test.dart';
import 'package:ncl_assignment/application/cruise_ship/cruise_ship_state.dart';
import 'package:ncl_assignment/models/cruise_ship/cruise_ship.dart';

void main() {
  test('CruiseShipState testing assignments', () {
    final state = CruiseShipState(
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
    );

    expect(state.status, CruiseShipStateStatus.loaded);
    expect(state.cruiseShip, isA<CruiseShip>());
    expect(state.cruiseShip.shipName, 'Test');
    expect(state.cruiseShip.shipFacts, isA<ShipFacts>());
    expect(state.cruiseShip.shipFacts.crew, '000');
    expect(state.cruiseShip.shipFacts.inauguralDate, 'yes');
    expect(state.errorMessage, isEmpty);
  });

  test('CruiseShipState testing initialState()', () {
    final state = CruiseShipState.initialState();

    expect(state.status, CruiseShipStateStatus.initial);
    expect(state.cruiseShip, isA<CruiseShip>());
    expect(state.cruiseShip.shipName, isEmpty);
    expect(state.cruiseShip.shipFacts, isA<ShipFacts>());
    expect(state.cruiseShip.shipFacts.crew, isEmpty);
    expect(state.cruiseShip.shipFacts.inauguralDate, isEmpty);
    expect(state.errorMessage, isEmpty);
  });

  test('CruiseShipState testing copyWith()', () {
    final state = CruiseShipState.initialState();
    final newState = state.copyWith(
      status: CruiseShipStateStatus.failed,
      errorMessage: 'Something went wrong',
      cruiseShip: CruiseShip.model(),
    );

    expect(state.status, CruiseShipStateStatus.initial);
    expect(newState.status, CruiseShipStateStatus.failed);
    expect(state.errorMessage, isEmpty);
    expect(newState.errorMessage, 'Something went wrong');
  });
}
