import 'package:flutter_test/flutter_test.dart';
import 'package:ncl_assignment/models/cruise_ship/cruise_ship.dart';

void main() {
  test('CruiseShip model test', () {
    const cruiseShip = CruiseShip(
      shipName: 'Sky',
      shipFacts: ShipFacts(
        passengerCapacity: '2000',
        crew: '15',
        inauguralDate: '2022',
      ),
    );

    expect(cruiseShip, isNotNull);
    expect(cruiseShip.shipName, 'Sky');
    expect(cruiseShip.shipFacts, isNotNull);
    expect(cruiseShip.shipFacts.passengerCapacity, '2000');
    expect(cruiseShip.shipFacts.inauguralDate, '2022');
  });

  test('CruiseShip model testing static .model()', () {
    final cruiseShip = CruiseShip.model();

    expect(cruiseShip, isNotNull);
    expect(cruiseShip.shipName, isEmpty);
    expect(cruiseShip.shipFacts, isNotNull);
    expect(cruiseShip.shipFacts.passengerCapacity, isEmpty);
    expect(cruiseShip.shipFacts.inauguralDate, isEmpty);
  });

  test('ShipFacts model test', () {
    const shipFacts = ShipFacts(
      passengerCapacity: '1998',
      crew: 'yes',
      inauguralDate: '1r',
    );

    expect(shipFacts, isNotNull);
    expect(shipFacts.passengerCapacity, '1998');
    expect(shipFacts.inauguralDate, '1r');
  });

  test('ShipFacts model testing static .model()', () {
    final shipFacts = ShipFacts.model();

    expect(shipFacts, isNotNull);
    expect(shipFacts.passengerCapacity, isEmpty);
    expect(shipFacts.crew, isEmpty);
    expect(shipFacts.inauguralDate, isEmpty);
  });
}
