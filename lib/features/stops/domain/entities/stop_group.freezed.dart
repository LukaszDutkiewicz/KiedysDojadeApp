// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stop_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StopGroup {

@JsonKey(name: 'group_code') String get groupCode;@JsonKey(name: 'group_name') String get groupName; double get lat; double get lon;
/// Create a copy of StopGroup
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StopGroupCopyWith<StopGroup> get copyWith => _$StopGroupCopyWithImpl<StopGroup>(this as StopGroup, _$identity);

  /// Serializes this StopGroup to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StopGroup&&(identical(other.groupCode, groupCode) || other.groupCode == groupCode)&&(identical(other.groupName, groupName) || other.groupName == groupName)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lon, lon) || other.lon == lon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,groupCode,groupName,lat,lon);

@override
String toString() {
  return 'StopGroup(groupCode: $groupCode, groupName: $groupName, lat: $lat, lon: $lon)';
}


}

/// @nodoc
abstract mixin class $StopGroupCopyWith<$Res>  {
  factory $StopGroupCopyWith(StopGroup value, $Res Function(StopGroup) _then) = _$StopGroupCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'group_code') String groupCode,@JsonKey(name: 'group_name') String groupName, double lat, double lon
});




}
/// @nodoc
class _$StopGroupCopyWithImpl<$Res>
    implements $StopGroupCopyWith<$Res> {
  _$StopGroupCopyWithImpl(this._self, this._then);

  final StopGroup _self;
  final $Res Function(StopGroup) _then;

/// Create a copy of StopGroup
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? groupCode = null,Object? groupName = null,Object? lat = null,Object? lon = null,}) {
  return _then(_self.copyWith(
groupCode: null == groupCode ? _self.groupCode : groupCode // ignore: cast_nullable_to_non_nullable
as String,groupName: null == groupName ? _self.groupName : groupName // ignore: cast_nullable_to_non_nullable
as String,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lon: null == lon ? _self.lon : lon // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [StopGroup].
extension StopGroupPatterns on StopGroup {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StopGroup value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StopGroup() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StopGroup value)  $default,){
final _that = this;
switch (_that) {
case _StopGroup():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StopGroup value)?  $default,){
final _that = this;
switch (_that) {
case _StopGroup() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'group_code')  String groupCode, @JsonKey(name: 'group_name')  String groupName,  double lat,  double lon)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StopGroup() when $default != null:
return $default(_that.groupCode,_that.groupName,_that.lat,_that.lon);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'group_code')  String groupCode, @JsonKey(name: 'group_name')  String groupName,  double lat,  double lon)  $default,) {final _that = this;
switch (_that) {
case _StopGroup():
return $default(_that.groupCode,_that.groupName,_that.lat,_that.lon);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'group_code')  String groupCode, @JsonKey(name: 'group_name')  String groupName,  double lat,  double lon)?  $default,) {final _that = this;
switch (_that) {
case _StopGroup() when $default != null:
return $default(_that.groupCode,_that.groupName,_that.lat,_that.lon);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StopGroup implements StopGroup {
  const _StopGroup({@JsonKey(name: 'group_code') required this.groupCode, @JsonKey(name: 'group_name') required this.groupName, required this.lat, required this.lon});
  factory _StopGroup.fromJson(Map<String, dynamic> json) => _$StopGroupFromJson(json);

@override@JsonKey(name: 'group_code') final  String groupCode;
@override@JsonKey(name: 'group_name') final  String groupName;
@override final  double lat;
@override final  double lon;

/// Create a copy of StopGroup
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StopGroupCopyWith<_StopGroup> get copyWith => __$StopGroupCopyWithImpl<_StopGroup>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StopGroupToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StopGroup&&(identical(other.groupCode, groupCode) || other.groupCode == groupCode)&&(identical(other.groupName, groupName) || other.groupName == groupName)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lon, lon) || other.lon == lon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,groupCode,groupName,lat,lon);

@override
String toString() {
  return 'StopGroup(groupCode: $groupCode, groupName: $groupName, lat: $lat, lon: $lon)';
}


}

/// @nodoc
abstract mixin class _$StopGroupCopyWith<$Res> implements $StopGroupCopyWith<$Res> {
  factory _$StopGroupCopyWith(_StopGroup value, $Res Function(_StopGroup) _then) = __$StopGroupCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'group_code') String groupCode,@JsonKey(name: 'group_name') String groupName, double lat, double lon
});




}
/// @nodoc
class __$StopGroupCopyWithImpl<$Res>
    implements _$StopGroupCopyWith<$Res> {
  __$StopGroupCopyWithImpl(this._self, this._then);

  final _StopGroup _self;
  final $Res Function(_StopGroup) _then;

/// Create a copy of StopGroup
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? groupCode = null,Object? groupName = null,Object? lat = null,Object? lon = null,}) {
  return _then(_StopGroup(
groupCode: null == groupCode ? _self.groupCode : groupCode // ignore: cast_nullable_to_non_nullable
as String,groupName: null == groupName ? _self.groupName : groupName // ignore: cast_nullable_to_non_nullable
as String,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lon: null == lon ? _self.lon : lon // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
