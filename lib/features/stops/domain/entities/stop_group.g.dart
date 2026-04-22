// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stop_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StopGroup _$StopGroupFromJson(Map<String, dynamic> json) => _StopGroup(
  groupCode: json['group_code'] as String,
  groupName: json['group_name'] as String,
  lat: (json['lat'] as num).toDouble(),
  lon: (json['lon'] as num).toDouble(),
);

Map<String, dynamic> _$StopGroupToJson(_StopGroup instance) =>
    <String, dynamic>{
      'group_code': instance.groupCode,
      'group_name': instance.groupName,
      'lat': instance.lat,
      'lon': instance.lon,
    };
