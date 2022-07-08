import 'package:json_annotation/json_annotation.dart';

part 'cruise_ship.g.dart';

@JsonSerializable()
class CruiseShip {
  const CruiseShip({
    required this.shipName,
    required this.shipFacts,
  });

  final String shipName;
  final ShipFacts shipFacts;

  factory CruiseShip.fromJson(Map<String, dynamic> json) =>
      _$CruiseShipFromJson(json);

  Map<String, dynamic> toJson() => _$CruiseShipToJson(this);

  static CruiseShip model() {
    return CruiseShip(
      shipName: '',
      shipFacts: ShipFacts.model(),
    );
  }

  @override
  String toString() {
    return 'CruiseShip{shipName: $shipName, shipFacts: $shipFacts}';
  }
}

@JsonSerializable()
class ShipFacts {
  const ShipFacts({
    required this.passengerCapacity,
    required this.crew,
    required this.inauguralDate,
  });

  final String passengerCapacity;
  final String crew;
  final String inauguralDate;

  factory ShipFacts.fromJson(Map<String, dynamic> json) =>
      _$ShipFactsFromJson(json);

  Map<String, dynamic> toJson() => _$ShipFactsToJson(this);

  static ShipFacts model() {
    return const ShipFacts(
      passengerCapacity: '',
      crew: '',
      inauguralDate: '',
    );
  }

  @override
  String toString() {
    return 'ShipFacts{passengerCapacity: $passengerCapacity, crew: $crew, inauguralDate: $inauguralDate}';
  }
}
