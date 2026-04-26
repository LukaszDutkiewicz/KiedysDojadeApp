// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stop_time.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StopTime _$StopTimeFromJson(Map<String, dynamic> json) => _StopTime(
  tripId: json['trip_id'] as String,
  arrivalTime: json['arrival_time'] as String,
  departureTime: json['departure_time'] as String,
  stopId: (json['stop_id'] as num).toInt(),
  stopSequence: (json['stop_sequence'] as num).toInt(),
  stopHeadsign: json['stop_headsign'] as String,
  routeId: json['route_id'] as String,
  pickupType: (json['pickup_type'] as num?)?.toInt(),
  dropOffType: (json['drop_off_type'] as num?)?.toInt(),
);

Map<String, dynamic> _$StopTimeToJson(_StopTime instance) => <String, dynamic>{
  'trip_id': instance.tripId,
  'arrival_time': instance.arrivalTime,
  'departure_time': instance.departureTime,
  'stop_id': instance.stopId,
  'stop_sequence': instance.stopSequence,
  'stop_headsign': instance.stopHeadsign,
  'route_id': instance.routeId,
  'pickup_type': instance.pickupType,
  'drop_off_type': instance.dropOffType,
};
