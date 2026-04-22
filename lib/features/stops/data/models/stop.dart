import 'package:freezed_annotation/freezed_annotation.dart';

part 'stop.freezed.dart';
part 'stop.g.dart';

@freezed
sealed class Stop with _$Stop {
  const factory Stop({
    required int id,
    required String code,
    required String name,
    required double lat,
    required double lon,
    @JsonKey(name: 'zone_id') required String zoneId,
  }) = _Stop;

  factory Stop.fromJson(Map<String, dynamic> json) => 
      _$StopFromJson(json);
}