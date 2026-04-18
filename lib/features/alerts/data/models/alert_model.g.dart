// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alert_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AlertModel _$AlertModelFromJson(Map<String, dynamic> json) => _AlertModel(
  id: (json['id'] as num).toInt(),
  lat: (json['lat'] as num).toDouble(),
  lon: (json['lon'] as num).toDouble(),
  line: json['line'] as String?,
  category: json['category'] as String,
  score: (json['score'] as num?)?.toInt() ?? 0,
  since: DateTime.parse(json['since'] as String),
);

Map<String, dynamic> _$AlertModelToJson(_AlertModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lat': instance.lat,
      'lon': instance.lon,
      'line': instance.line,
      'category': instance.category,
      'score': instance.score,
      'since': instance.since.toIso8601String(),
    };
