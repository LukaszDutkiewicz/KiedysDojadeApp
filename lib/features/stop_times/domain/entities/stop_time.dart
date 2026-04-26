import 'package:freezed_annotation/freezed_annotation.dart';

part 'stop_time.freezed.dart';
part 'stop_time.g.dart';

@freezed
class StopTime with _$StopTime {
  const factory StopTime({
    @JsonKey(name: 'trip_id') required String tripId,
    @JsonKey(name: 'arrival_time') required String arrivalTime,
    @JsonKey(name: 'departure_time') required String departureTime,
    @JsonKey(name: 'stop_id') required int stopId,
    @JsonKey(name: 'stop_sequence') required int stopSequence,
    @JsonKey(name: 'stop_headsign') required String stopHeadsign,
    @JsonKey(name: 'route_id') required String routeId,
    // Dodajemy pola opcjonalne, jeśli będziesz chciał obsługiwać typ wsiadania/wysiadania
    @JsonKey(name: 'pickup_type') int? pickupType,
    @JsonKey(name: 'drop_off_type') int? dropOffType,
  }) = _StopTime;

  factory StopTime.fromJson(Map<String, dynamic> json) => _$StopTimeFromJson(json);
}