// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'path_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PathItem _$PathItemFromJson(Map<String, dynamic> json) => _PathItem(
  stop: StopModel.fromJson(json['stop'] as Map<String, dynamic>),
  line: json['line'] as String?,
  departureTime: json['departure_time'] as String?,
  arrivalTime: json['arrival_time'] as String?,
);

Map<String, dynamic> _$PathItemToJson(_PathItem instance) => <String, dynamic>{
  'stop': instance.stop,
  'line': instance.line,
  'departure_time': instance.departureTime,
  'arrival_time': instance.arrivalTime,
};
