import 'package:ncl_assignment/models/cruise_ship/cruise_ship.dart';

enum CruiseShipStateStatus { initial, loading, loaded, failed }

class CruiseShipState {
  CruiseShipState({
    required this.status,
    required this.cruiseShip,
    required this.errorMessage,
  });
  final CruiseShipStateStatus status;
  final CruiseShip cruiseShip;
  final String errorMessage;

  static CruiseShipState initialState() {
    return CruiseShipState(
      status: CruiseShipStateStatus.initial,
      cruiseShip: CruiseShip.model(),
      errorMessage: '',
    );
  }

  CruiseShipState copyWith({
    CruiseShipStateStatus? status,
    CruiseShip? cruiseShip,
    String? errorMessage,
  }) {
    return CruiseShipState(
      status: status ?? this.status,
      cruiseShip: cruiseShip ?? this.cruiseShip,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  String toString() {
    return 'CruiseShipState{status: $status, cruiseShip: $cruiseShip, errorMessage: $errorMessage}';
  }
}
