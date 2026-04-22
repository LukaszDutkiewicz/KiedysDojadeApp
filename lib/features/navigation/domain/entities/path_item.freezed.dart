// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'path_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PathItem {

 Stop get stop; String? get line;// Może być null lub "WALK"
@JsonKey(name: 'departure_time') String? get departureTime;@JsonKey(name: 'arrival_time') String? get arrivalTime;
/// Create a copy of PathItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PathItemCopyWith<PathItem> get copyWith => _$PathItemCopyWithImpl<PathItem>(this as PathItem, _$identity);

  /// Serializes this PathItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PathItem&&(identical(other.stop, stop) || other.stop == stop)&&(identical(other.line, line) || other.line == line)&&(identical(other.departureTime, departureTime) || other.departureTime == departureTime)&&(identical(other.arrivalTime, arrivalTime) || other.arrivalTime == arrivalTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stop,line,departureTime,arrivalTime);

@override
String toString() {
  return 'PathItem(stop: $stop, line: $line, departureTime: $departureTime, arrivalTime: $arrivalTime)';
}


}

/// @nodoc
abstract mixin class $PathItemCopyWith<$Res>  {
  factory $PathItemCopyWith(PathItem value, $Res Function(PathItem) _then) = _$PathItemCopyWithImpl;
@useResult
$Res call({
 Stop stop, String? line,@JsonKey(name: 'departure_time') String? departureTime,@JsonKey(name: 'arrival_time') String? arrivalTime
});


$StopCopyWith<$Res> get stop;

}
/// @nodoc
class _$PathItemCopyWithImpl<$Res>
    implements $PathItemCopyWith<$Res> {
  _$PathItemCopyWithImpl(this._self, this._then);

  final PathItem _self;
  final $Res Function(PathItem) _then;

/// Create a copy of PathItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stop = null,Object? line = freezed,Object? departureTime = freezed,Object? arrivalTime = freezed,}) {
  return _then(_self.copyWith(
stop: null == stop ? _self.stop : stop // ignore: cast_nullable_to_non_nullable
as Stop,line: freezed == line ? _self.line : line // ignore: cast_nullable_to_non_nullable
as String?,departureTime: freezed == departureTime ? _self.departureTime : departureTime // ignore: cast_nullable_to_non_nullable
as String?,arrivalTime: freezed == arrivalTime ? _self.arrivalTime : arrivalTime // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of PathItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StopCopyWith<$Res> get stop {
  
  return $StopCopyWith<$Res>(_self.stop, (value) {
    return _then(_self.copyWith(stop: value));
  });
}
}


/// Adds pattern-matching-related methods to [PathItem].
extension PathItemPatterns on PathItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PathItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PathItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PathItem value)  $default,){
final _that = this;
switch (_that) {
case _PathItem():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PathItem value)?  $default,){
final _that = this;
switch (_that) {
case _PathItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Stop stop,  String? line, @JsonKey(name: 'departure_time')  String? departureTime, @JsonKey(name: 'arrival_time')  String? arrivalTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PathItem() when $default != null:
return $default(_that.stop,_that.line,_that.departureTime,_that.arrivalTime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Stop stop,  String? line, @JsonKey(name: 'departure_time')  String? departureTime, @JsonKey(name: 'arrival_time')  String? arrivalTime)  $default,) {final _that = this;
switch (_that) {
case _PathItem():
return $default(_that.stop,_that.line,_that.departureTime,_that.arrivalTime);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Stop stop,  String? line, @JsonKey(name: 'departure_time')  String? departureTime, @JsonKey(name: 'arrival_time')  String? arrivalTime)?  $default,) {final _that = this;
switch (_that) {
case _PathItem() when $default != null:
return $default(_that.stop,_that.line,_that.departureTime,_that.arrivalTime);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PathItem implements PathItem {
  const _PathItem({required this.stop, this.line, @JsonKey(name: 'departure_time') this.departureTime, @JsonKey(name: 'arrival_time') this.arrivalTime});
  factory _PathItem.fromJson(Map<String, dynamic> json) => _$PathItemFromJson(json);

@override final  Stop stop;
@override final  String? line;
// Może być null lub "WALK"
@override@JsonKey(name: 'departure_time') final  String? departureTime;
@override@JsonKey(name: 'arrival_time') final  String? arrivalTime;

/// Create a copy of PathItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PathItemCopyWith<_PathItem> get copyWith => __$PathItemCopyWithImpl<_PathItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PathItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PathItem&&(identical(other.stop, stop) || other.stop == stop)&&(identical(other.line, line) || other.line == line)&&(identical(other.departureTime, departureTime) || other.departureTime == departureTime)&&(identical(other.arrivalTime, arrivalTime) || other.arrivalTime == arrivalTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stop,line,departureTime,arrivalTime);

@override
String toString() {
  return 'PathItem(stop: $stop, line: $line, departureTime: $departureTime, arrivalTime: $arrivalTime)';
}


}

/// @nodoc
abstract mixin class _$PathItemCopyWith<$Res> implements $PathItemCopyWith<$Res> {
  factory _$PathItemCopyWith(_PathItem value, $Res Function(_PathItem) _then) = __$PathItemCopyWithImpl;
@override @useResult
$Res call({
 Stop stop, String? line,@JsonKey(name: 'departure_time') String? departureTime,@JsonKey(name: 'arrival_time') String? arrivalTime
});


@override $StopCopyWith<$Res> get stop;

}
/// @nodoc
class __$PathItemCopyWithImpl<$Res>
    implements _$PathItemCopyWith<$Res> {
  __$PathItemCopyWithImpl(this._self, this._then);

  final _PathItem _self;
  final $Res Function(_PathItem) _then;

/// Create a copy of PathItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stop = null,Object? line = freezed,Object? departureTime = freezed,Object? arrivalTime = freezed,}) {
  return _then(_PathItem(
stop: null == stop ? _self.stop : stop // ignore: cast_nullable_to_non_nullable
as Stop,line: freezed == line ? _self.line : line // ignore: cast_nullable_to_non_nullable
as String?,departureTime: freezed == departureTime ? _self.departureTime : departureTime // ignore: cast_nullable_to_non_nullable
as String?,arrivalTime: freezed == arrivalTime ? _self.arrivalTime : arrivalTime // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of PathItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StopCopyWith<$Res> get stop {
  
  return $StopCopyWith<$Res>(_self.stop, (value) {
    return _then(_self.copyWith(stop: value));
  });
}
}

// dart format on
