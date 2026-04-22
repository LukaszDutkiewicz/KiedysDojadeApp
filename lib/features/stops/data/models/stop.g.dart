// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Stop _$StopFromJson(Map<String, dynamic> json) => _Stop(
  id: (json['id'] as num).toInt(),
  code: json['code'] as String,
  name: json['name'] as String,
  lat: (json['lat'] as num).toDouble(),
  lon: (json['lon'] as num).toDouble(),
  zoneId: json['zone_id'] as String,
);

Map<String, dynamic> _$StopToJson(_Stop instance) => <String, dynamic>{
  'id': instance.id,
  'code': instance.code,
  'name': instance.name,
  'lat': instance.lat,
  'lon': instance.lon,
  'zone_id': instance.zoneId,
};
