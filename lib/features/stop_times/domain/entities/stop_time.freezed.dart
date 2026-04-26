// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stop_time.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StopTime {

@JsonKey(name: 'trip_id') String get tripId;@JsonKey(name: 'arrival_time') String get arrivalTime;@JsonKey(name: 'departure_time') String get departureTime;@JsonKey(name: 'stop_id') int get stopId;@JsonKey(name: 'stop_sequence') int get stopSequence;@JsonKey(name: 'stop_headsign') String get stopHeadsign;@JsonKey(name: 'route_id') String get routeId;// Dodajemy pola opcjonalne, jeśli będziesz chciał obsługiwać typ wsiadania/wysiadania
@JsonKey(name: 'pickup_type') int? get pickupType;@JsonKey(name: 'drop_off_type') int? get dropOffType;
/// Create a copy of StopTime
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StopTimeCopyWith<StopTime> get copyWith => _$StopTimeCopyWithImpl<StopTime>(this as StopTime, _$identity);

  /// Serializes this StopTime to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StopTime&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.arrivalTime, arrivalTime) || other.arrivalTime == arrivalTime)&&(identical(other.departureTime, departureTime) || other.departureTime == departureTime)&&(identical(other.stopId, stopId) || other.stopId == stopId)&&(identical(other.stopSequence, stopSequence) || other.stopSequence == stopSequence)&&(identical(other.stopHeadsign, stopHeadsign) || other.stopHeadsign == stopHeadsign)&&(identical(other.routeId, routeId) || other.routeId == routeId)&&(identical(other.pickupType, pickupType) || other.pickupType == pickupType)&&(identical(other.dropOffType, dropOffType) || other.dropOffType == dropOffType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tripId,arrivalTime,departureTime,stopId,stopSequence,stopHeadsign,routeId,pickupType,dropOffType);

@override
String toString() {
  return 'StopTime(tripId: $tripId, arrivalTime: $arrivalTime, departureTime: $departureTime, stopId: $stopId, stopSequence: $stopSequence, stopHeadsign: $stopHeadsign, routeId: $routeId, pickupType: $pickupType, dropOffType: $dropOffType)';
}


}

/// @nodoc
abstract mixin class $StopTimeCopyWith<$Res>  {
  factory $StopTimeCopyWith(StopTime value, $Res Function(StopTime) _then) = _$StopTimeCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'trip_id') String tripId,@JsonKey(name: 'arrival_time') String arrivalTime,@JsonKey(name: 'departure_time') String departureTime,@JsonKey(name: 'stop_id') int stopId,@JsonKey(name: 'stop_sequence') int stopSequence,@JsonKey(name: 'stop_headsign') String stopHeadsign,@JsonKey(name: 'route_id') String routeId,@JsonKey(name: 'pickup_type') int? pickupType,@JsonKey(name: 'drop_off_type') int? dropOffType
});




}
/// @nodoc
class _$StopTimeCopyWithImpl<$Res>
    implements $StopTimeCopyWith<$Res> {
  _$StopTimeCopyWithImpl(this._self, this._then);

  final StopTime _self;
  final $Res Function(StopTime) _then;

/// Create a copy of StopTime
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tripId = null,Object? arrivalTime = null,Object? departureTime = null,Object? stopId = null,Object? stopSequence = null,Object? stopHeadsign = null,Object? routeId = null,Object? pickupType = freezed,Object? dropOffType = freezed,}) {
  return _then(_self.copyWith(
tripId: null == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as String,arrivalTime: null == arrivalTime ? _self.arrivalTime : arrivalTime // ignore: cast_nullable_to_non_nullable
as String,departureTime: null == departureTime ? _self.departureTime : departureTime // ignore: cast_nullable_to_non_nullable
as String,stopId: null == stopId ? _self.stopId : stopId // ignore: cast_nullable_to_non_nullable
as int,stopSequence: null == stopSequence ? _self.stopSequence : stopSequence // ignore: cast_nullable_to_non_nullable
as int,stopHeadsign: null == stopHeadsign ? _self.stopHeadsign : stopHeadsign // ignore: cast_nullable_to_non_nullable
as String,routeId: null == routeId ? _self.routeId : routeId // ignore: cast_nullable_to_non_nullable
as String,pickupType: freezed == pickupType ? _self.pickupType : pickupType // ignore: cast_nullable_to_non_nullable
as int?,dropOffType: freezed == dropOffType ? _self.dropOffType : dropOffType // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [StopTime].
extension StopTimePatterns on StopTime {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StopTime value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StopTime() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StopTime value)  $default,){
final _that = this;
switch (_that) {
case _StopTime():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StopTime value)?  $default,){
final _that = this;
switch (_that) {
case _StopTime() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'trip_id')  String tripId, @JsonKey(name: 'arrival_time')  String arrivalTime, @JsonKey(name: 'departure_time')  String departureTime, @JsonKey(name: 'stop_id')  int stopId, @JsonKey(name: 'stop_sequence')  int stopSequence, @JsonKey(name: 'stop_headsign')  String stopHeadsign, @JsonKey(name: 'route_id')  String routeId, @JsonKey(name: 'pickup_type')  int? pickupType, @JsonKey(name: 'drop_off_type')  int? dropOffType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StopTime() when $default != null:
return $default(_that.tripId,_that.arrivalTime,_that.departureTime,_that.stopId,_that.stopSequence,_that.stopHeadsign,_that.routeId,_that.pickupType,_that.dropOffType);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'trip_id')  String tripId, @JsonKey(name: 'arrival_time')  String arrivalTime, @JsonKey(name: 'departure_time')  String departureTime, @JsonKey(name: 'stop_id')  int stopId, @JsonKey(name: 'stop_sequence')  int stopSequence, @JsonKey(name: 'stop_headsign')  String stopHeadsign, @JsonKey(name: 'route_id')  String routeId, @JsonKey(name: 'pickup_type')  int? pickupType, @JsonKey(name: 'drop_off_type')  int? dropOffType)  $default,) {final _that = this;
switch (_that) {
case _StopTime():
return $default(_that.tripId,_that.arrivalTime,_that.departureTime,_that.stopId,_that.stopSequence,_that.stopHeadsign,_that.routeId,_that.pickupType,_that.dropOffType);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'trip_id')  String tripId, @JsonKey(name: 'arrival_time')  String arrivalTime, @JsonKey(name: 'departure_time')  String departureTime, @JsonKey(name: 'stop_id')  int stopId, @JsonKey(name: 'stop_sequence')  int stopSequence, @JsonKey(name: 'stop_headsign')  String stopHeadsign, @JsonKey(name: 'route_id')  String routeId, @JsonKey(name: 'pickup_type')  int? pickupType, @JsonKey(name: 'drop_off_type')  int? dropOffType)?  $default,) {final _that = this;
switch (_that) {
case _StopTime() when $default != null:
return $default(_that.tripId,_that.arrivalTime,_that.departureTime,_that.stopId,_that.stopSequence,_that.stopHeadsign,_that.routeId,_that.pickupType,_that.dropOffType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StopTime implements StopTime {
  const _StopTime({@JsonKey(name: 'trip_id') required this.tripId, @JsonKey(name: 'arrival_time') required this.arrivalTime, @JsonKey(name: 'departure_time') required this.departureTime, @JsonKey(name: 'stop_id') required this.stopId, @JsonKey(name: 'stop_sequence') required this.stopSequence, @JsonKey(name: 'stop_headsign') required this.stopHeadsign, @JsonKey(name: 'route_id') required this.routeId, @JsonKey(name: 'pickup_type') this.pickupType, @JsonKey(name: 'drop_off_type') this.dropOffType});
  factory _StopTime.fromJson(Map<String, dynamic> json) => _$StopTimeFromJson(json);

@override@JsonKey(name: 'trip_id') final  String tripId;
@override@JsonKey(name: 'arrival_time') final  String arrivalTime;
@override@JsonKey(name: 'departure_time') final  String departureTime;
@override@JsonKey(name: 'stop_id') final  int stopId;
@override@JsonKey(name: 'stop_sequence') final  int stopSequence;
@override@JsonKey(name: 'stop_headsign') final  String stopHeadsign;
@override@JsonKey(name: 'route_id') final  String routeId;
// Dodajemy pola opcjonalne, jeśli będziesz chciał obsługiwać typ wsiadania/wysiadania
@override@JsonKey(name: 'pickup_type') final  int? pickupType;
@override@JsonKey(name: 'drop_off_type') final  int? dropOffType;

/// Create a copy of StopTime
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StopTimeCopyWith<_StopTime> get copyWith => __$StopTimeCopyWithImpl<_StopTime>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StopTimeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StopTime&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.arrivalTime, arrivalTime) || other.arrivalTime == arrivalTime)&&(identical(other.departureTime, departureTime) || other.departureTime == departureTime)&&(identical(other.stopId, stopId) || other.stopId == stopId)&&(identical(other.stopSequence, stopSequence) || other.stopSequence == stopSequence)&&(identical(other.stopHeadsign, stopHeadsign) || other.stopHeadsign == stopHeadsign)&&(identical(other.routeId, routeId) || other.routeId == routeId)&&(identical(other.pickupType, pickupType) || other.pickupType == pickupType)&&(identical(other.dropOffType, dropOffType) || other.dropOffType == dropOffType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tripId,arrivalTime,departureTime,stopId,stopSequence,stopHeadsign,routeId,pickupType,dropOffType);

@override
String toString() {
  return 'StopTime(tripId: $tripId, arrivalTime: $arrivalTime, departureTime: $departureTime, stopId: $stopId, stopSequence: $stopSequence, stopHeadsign: $stopHeadsign, routeId: $routeId, pickupType: $pickupType, dropOffType: $dropOffType)';
}


}

/// @nodoc
abstract mixin class _$StopTimeCopyWith<$Res> implements $StopTimeCopyWith<$Res> {
  factory _$StopTimeCopyWith(_StopTime value, $Res Function(_StopTime) _then) = __$StopTimeCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'trip_id') String tripId,@JsonKey(name: 'arrival_time') String arrivalTime,@JsonKey(name: 'departure_time') String departureTime,@JsonKey(name: 'stop_id') int stopId,@JsonKey(name: 'stop_sequence') int stopSequence,@JsonKey(name: 'stop_headsign') String stopHeadsign,@JsonKey(name: 'route_id') String routeId,@JsonKey(name: 'pickup_type') int? pickupType,@JsonKey(name: 'drop_off_type') int? dropOffType
});




}
/// @nodoc
class __$StopTimeCopyWithImpl<$Res>
    implements _$StopTimeCopyWith<$Res> {
  __$StopTimeCopyWithImpl(this._self, this._then);

  final _StopTime _self;
  final $Res Function(_StopTime) _then;

/// Create a copy of StopTime
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tripId = null,Object? arrivalTime = null,Object? departureTime = null,Object? stopId = null,Object? stopSequence = null,Object? stopHeadsign = null,Object? routeId = null,Object? pickupType = freezed,Object? dropOffType = freezed,}) {
  return _then(_StopTime(
tripId: null == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as String,arrivalTime: null == arrivalTime ? _self.arrivalTime : arrivalTime // ignore: cast_nullable_to_non_nullable
as String,departureTime: null == departureTime ? _self.departureTime : departureTime // ignore: cast_nullable_to_non_nullable
as String,stopId: null == stopId ? _self.stopId : stopId // ignore: cast_nullable_to_non_nullable
as int,stopSequence: null == stopSequence ? _self.stopSequence : stopSequence // ignore: cast_nullable_to_non_nullable
as int,stopHeadsign: null == stopHeadsign ? _self.stopHeadsign : stopHeadsign // ignore: cast_nullable_to_non_nullable
as String,routeId: null == routeId ? _self.routeId : routeId // ignore: cast_nullable_to_non_nullable
as String,pickupType: freezed == pickupType ? _self.pickupType : pickupType // ignore: cast_nullable_to_non_nullable
as int?,dropOffType: freezed == dropOffType ? _self.dropOffType : dropOffType // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
