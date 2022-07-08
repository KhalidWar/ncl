import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ncl_assignment/application/cruise_ship/cruise_ship_state.dart';
import 'package:ncl_assignment/services/cruise_ship_services/cruise_ship_services.dart';

final cruiseShipStateNotifier =
    StateNotifierProvider<CruiseShipNotifier, CruiseShipState>((ref) {
  final shipServices = ref.read(shipServiceProvider);
  return CruiseShipNotifier(shipServices: shipServices);
});

class CruiseShipNotifier extends StateNotifier<CruiseShipState> {
  CruiseShipNotifier({
    required this.shipServices,
    CruiseShipState? initialState,
  }) : super(initialState ?? CruiseShipState.initialState());

  final CruiseShipServices shipServices;

  void _updateState(CruiseShipState newState) {
    if (mounted) state = newState;
  }

  Future<void> fetchCruiseShip(String shipName) async {
    try {
      _updateState(state.copyWith(status: CruiseShipStateStatus.loading));

      final cruiseShip = await shipServices.fetchCruiseShipData(shipName);
      _updateState(state.copyWith(
        status: CruiseShipStateStatus.loaded,
        cruiseShip: cruiseShip,
      ));
    } catch (error) {
      _updateState(state.copyWith(
        status: CruiseShipStateStatus.failed,
        errorMessage: error.toString(),
      ));
    }
  }
}
