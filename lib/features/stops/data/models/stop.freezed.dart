// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stop.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Stop {

 int get id; String get code; String get name; double get lat; double get lon;@JsonKey(name: 'zone_id') String get zoneId;
/// Create a copy of Stop
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StopCopyWith<Stop> get copyWith => _$StopCopyWithImpl<Stop>(this as Stop, _$identity);

  /// Serializes this Stop to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Stop&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lon, lon) || other.lon == lon)&&(identical(other.zoneId, zoneId) || other.zoneId == zoneId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,code,name,lat,lon,zoneId);

@override
String toString() {
  return 'Stop(id: $id, code: $code, name: $name, lat: $lat, lon: $lon, zoneId: $zoneId)';
}


}

/// @nodoc
abstract mixin class $StopCopyWith<$Res>  {
  factory $StopCopyWith(Stop value, $Res Function(Stop) _then) = _$StopCopyWithImpl;
@useResult
$Res call({
 int id, String code, String name, double lat, double lon,@JsonKey(name: 'zone_id') String zoneId
});




}
/// @nodoc
class _$StopCopyWithImpl<$Res>
    implements $StopCopyWith<$Res> {
  _$StopCopyWithImpl(this._self, this._then);

  final Stop _self;
  final $Res Function(Stop) _then;

/// Create a copy of Stop
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? code = null,Object? name = null,Object? lat = null,Object? lon = null,Object? zoneId = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lon: null == lon ? _self.lon : lon // ignore: cast_nullable_to_non_nullable
as double,zoneId: null == zoneId ? _self.zoneId : zoneId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Stop].
extension StopPatterns on Stop {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Stop value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Stop() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Stop value)  $default,){
final _that = this;
switch (_that) {
case _Stop():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Stop value)?  $default,){
final _that = this;
switch (_that) {
case _Stop() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String code,  String name,  double lat,  double lon, @JsonKey(name: 'zone_id')  String zoneId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Stop() when $default != null:
return $default(_that.id,_that.code,_that.name,_that.lat,_that.lon,_that.zoneId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String code,  String name,  double lat,  double lon, @JsonKey(name: 'zone_id')  String zoneId)  $default,) {final _that = this;
switch (_that) {
case _Stop():
return $default(_that.id,_that.code,_that.name,_that.lat,_that.lon,_that.zoneId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String code,  String name,  double lat,  double lon, @JsonKey(name: 'zone_id')  String zoneId)?  $default,) {final _that = this;
switch (_that) {
case _Stop() when $default != null:
return $default(_that.id,_that.code,_that.name,_that.lat,_that.lon,_that.zoneId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Stop implements Stop {
  const _Stop({required this.id, required this.code, required this.name, required this.lat, required this.lon, @JsonKey(name: 'zone_id') required this.zoneId});
  factory _Stop.fromJson(Map<String, dynamic> json) => _$StopFromJson(json);

@override final  int id;
@override final  String code;
@override final  String name;
@override final  double lat;
@override final  double lon;
@override@JsonKey(name: 'zone_id') final  String zoneId;

/// Create a copy of Stop
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StopCopyWith<_Stop> get copyWith => __$StopCopyWithImpl<_Stop>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StopToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Stop&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lon, lon) || other.lon == lon)&&(identical(other.zoneId, zoneId) || other.zoneId == zoneId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,code,name,lat,lon,zoneId);

@override
String toString() {
  return 'Stop(id: $id, code: $code, name: $name, lat: $lat, lon: $lon, zoneId: $zoneId)';
}


}

/// @nodoc
abstract mixin class _$StopCopyWith<$Res> implements $StopCopyWith<$Res> {
  factory _$StopCopyWith(_Stop value, $Res Function(_Stop) _then) = __$StopCopyWithImpl;
@override @useResult
$Res call({
 int id, String code, String name, double lat, double lon,@JsonKey(name: 'zone_id') String zoneId
});




}
/// @nodoc
class __$StopCopyWithImpl<$Res>
    implements _$StopCopyWith<$Res> {
  __$StopCopyWithImpl(this._self, this._then);

  final _Stop _self;
  final $Res Function(_Stop) _then;

/// Create a copy of Stop
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? code = null,Object? name = null,Object? lat = null,Object? lon = null,Object? zoneId = null,}) {
  return _then(_Stop(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lon: null == lon ? _self.lon : lon // ignore: cast_nullable_to_non_nullable
as double,zoneId: null == zoneId ? _self.zoneId : zoneId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
