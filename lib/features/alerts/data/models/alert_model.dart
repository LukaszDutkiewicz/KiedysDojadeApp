import 'package:freezed_annotation/freezed_annotation.dart';

part 'alert_model.freezed.dart';
part 'alert_model.g.dart';

@freezed
sealed class AlertModel with _$AlertModel {
  const factory AlertModel({
    required int id,
    required double lat,
    required double lon,
    String? line, // Może być null wg. Twojego API
    required String category,
    @Default(0) int score, // Domyślna wartość
    required DateTime since,
  }) = _AlertModel;

  factory AlertModel.fromJson(Map<String, dynamic> json) => _$AlertModelFromJson(json);
}