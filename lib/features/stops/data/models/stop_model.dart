import 'package:freezed_annotation/freezed_annotation.dart';

part 'stop_model.freezed.dart';
part 'stop_model.g.dart';

@freezed
sealed class StopModel with _$StopModel {
  const factory StopModel({
    required int id,
    required String code,
    required String name,
    required double lat,
    required double lon,
    @JsonKey(name: 'zone_id') required String zoneId,
  }) = _StopModel;

  factory StopModel.fromJson(Map<String, dynamic> json) => 
      _$StopModelFromJson(json);
}