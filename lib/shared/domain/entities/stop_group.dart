import 'package:freezed_annotation/freezed_annotation.dart';

part 'stop_group.freezed.dart';
part 'stop_group.g.dart';

@freezed
sealed class StopGroup with _$StopGroup {
  const factory StopGroup({
    @JsonKey(name: 'group_code') required String groupCode,
    @JsonKey(name: 'group_name') required String groupName,
    required double lat,
    required double lon,
  }) = _StopGroup;

  factory StopGroup.fromJson(Map<String, dynamic> json) => _$StopGroupFromJson(json);
}