import 'package:freezed_annotation/freezed_annotation.dart';

part 'trip_history.freezed.dart';

@freezed
sealed class TripHistory with _$TripHistory {
  const factory TripHistory({
    required int id,
    required String sourceCode,
    required String sourceName,
    required String destCode,
    required String destName,
    required String departureTime,
    required DateTime searchedAt,
  }) = _TripHistory;
}
