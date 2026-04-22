import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kiedys_dojade/features/stops/data/models/stop.dart'; // Importujesz model Stopa, który robiliśmy wcześniej

part 'path_item.freezed.dart';
part 'path_item.g.dart';

typedef PathProposal = List<PathItem>;
typedef PathResponse = List<PathProposal>;

@freezed
sealed class PathItem with _$PathItem {
  const factory PathItem({
    required Stop stop,
    String? line, // Może być null lub "WALK"
    @JsonKey(name: 'departure_time') String? departureTime,
    @JsonKey(name: 'arrival_time') String? arrivalTime,
  }) = _PathItem;

  factory PathItem.fromJson(Map<String, dynamic> json) => 
      _$PathItemFromJson(json);
}