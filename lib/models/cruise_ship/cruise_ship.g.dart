// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cruise_ship.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CruiseShip _$CruiseShipFromJson(Map<String, dynamic> json) => CruiseShip(
      shipName: json['shipName'] as String,
      shipFacts: ShipFacts.fromJson(json['shipFacts'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CruiseShipToJson(CruiseShip instance) =>
    <String, dynamic>{
      'shipName': instance.shipName,
      'shipFacts': instance.shipFacts,
    };

ShipFacts _$ShipFactsFromJson(Map<String, dynamic> json) => ShipFacts(
      passengerCapacity: json['passengerCapacity'] as String,
      crew: json['crew'] as String,
      inauguralDate: json['inauguralDate'] as String,
    );

Map<String, dynamic> _$ShipFactsToJson(ShipFacts instance) => <String, dynamic>{
      'passengerCapacity': instance.passengerCapacity,
      'crew': instance.crew,
      'inauguralDate': instance.inauguralDate,
    };
