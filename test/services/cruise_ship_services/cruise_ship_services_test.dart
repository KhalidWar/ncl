import 'package:flutter_test/flutter_test.dart';
import 'package:ncl_assignment/models/cruise_ship/cruise_ship.dart';
import 'package:ncl_assignment/services/cruise_ship_services/cruise_ship_services.dart';

import '../services_mocks.dart';

void main() {
  late MockDio mockDio;
  late CruiseShipServices cruiseShipServices;

  setUp(() {
    mockDio = MockDio();
    cruiseShipServices = CruiseShipServices(dio: mockDio);
  });

  test('CruiseShipService.fetchCruiseShipData success case', () async {
    final cruiseShip = cruiseShipServices.fetchCruiseShipData('ship');

    expect(cruiseShip, completes);
    expect(await cruiseShip, isA<CruiseShip>());
    expect((await cruiseShip).shipName, 'Test');
    expect((await cruiseShip).shipFacts.crew, '899');
  });

  test('CruiseShipService.fetchCruiseShipData failure case', () async {
    final cruiseShip = cruiseShipServices.fetchCruiseShipData('error');

    /// On failure, it throws an error message which is of type String
    expect(cruiseShip, throwsA(isA<String>()));
  });
}
