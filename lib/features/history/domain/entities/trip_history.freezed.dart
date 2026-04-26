// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trip_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TripHistory {

 int get id; String get sourceCode; String get sourceName; String get destCode; String get destName; String get departureTime; DateTime get searchedAt;
/// Create a copy of TripHistory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TripHistoryCopyWith<TripHistory> get copyWith => _$TripHistoryCopyWithImpl<TripHistory>(this as TripHistory, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TripHistory&&(identical(other.id, id) || other.id == id)&&(identical(other.sourceCode, sourceCode) || other.sourceCode == sourceCode)&&(identical(other.sourceName, sourceName) || other.sourceName == sourceName)&&(identical(other.destCode, destCode) || other.destCode == destCode)&&(identical(other.destName, destName) || other.destName == destName)&&(identical(other.departureTime, departureTime) || other.departureTime == departureTime)&&(identical(other.searchedAt, searchedAt) || other.searchedAt == searchedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,sourceCode,sourceName,destCode,destName,departureTime,searchedAt);

@override
String toString() {
  return 'TripHistory(id: $id, sourceCode: $sourceCode, sourceName: $sourceName, destCode: $destCode, destName: $destName, departureTime: $departureTime, searchedAt: $searchedAt)';
}


}

/// @nodoc
abstract mixin class $TripHistoryCopyWith<$Res>  {
  factory $TripHistoryCopyWith(TripHistory value, $Res Function(TripHistory) _then) = _$TripHistoryCopyWithImpl;
@useResult
$Res call({
 int id, String sourceCode, String sourceName, String destCode, String destName, String departureTime, DateTime searchedAt
});




}
/// @nodoc
class _$TripHistoryCopyWithImpl<$Res>
    implements $TripHistoryCopyWith<$Res> {
  _$TripHistoryCopyWithImpl(this._self, this._then);

  final TripHistory _self;
  final $Res Function(TripHistory) _then;

/// Create a copy of TripHistory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? sourceCode = null,Object? sourceName = null,Object? destCode = null,Object? destName = null,Object? departureTime = null,Object? searchedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,sourceCode: null == sourceCode ? _self.sourceCode : sourceCode // ignore: cast_nullable_to_non_nullable
as String,sourceName: null == sourceName ? _self.sourceName : sourceName // ignore: cast_nullable_to_non_nullable
as String,destCode: null == destCode ? _self.destCode : destCode // ignore: cast_nullable_to_non_nullable
as String,destName: null == destName ? _self.destName : destName // ignore: cast_nullable_to_non_nullable
as String,departureTime: null == departureTime ? _self.departureTime : departureTime // ignore: cast_nullable_to_non_nullable
as String,searchedAt: null == searchedAt ? _self.searchedAt : searchedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [TripHistory].
extension TripHistoryPatterns on TripHistory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TripHistory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TripHistory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TripHistory value)  $default,){
final _that = this;
switch (_that) {
case _TripHistory():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TripHistory value)?  $default,){
final _that = this;
switch (_that) {
case _TripHistory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String sourceCode,  String sourceName,  String destCode,  String destName,  String departureTime,  DateTime searchedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TripHistory() when $default != null:
return $default(_that.id,_that.sourceCode,_that.sourceName,_that.destCode,_that.destName,_that.departureTime,_that.searchedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String sourceCode,  String sourceName,  String destCode,  String destName,  String departureTime,  DateTime searchedAt)  $default,) {final _that = this;
switch (_that) {
case _TripHistory():
return $default(_that.id,_that.sourceCode,_that.sourceName,_that.destCode,_that.destName,_that.departureTime,_that.searchedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String sourceCode,  String sourceName,  String destCode,  String destName,  String departureTime,  DateTime searchedAt)?  $default,) {final _that = this;
switch (_that) {
case _TripHistory() when $default != null:
return $default(_that.id,_that.sourceCode,_that.sourceName,_that.destCode,_that.destName,_that.departureTime,_that.searchedAt);case _:
  return null;

}
}

}

/// @nodoc


class _TripHistory implements TripHistory {
  const _TripHistory({required this.id, required this.sourceCode, required this.sourceName, required this.destCode, required this.destName, required this.departureTime, required this.searchedAt});
  

@override final  int id;
@override final  String sourceCode;
@override final  String sourceName;
@override final  String destCode;
@override final  String destName;
@override final  String departureTime;
@override final  DateTime searchedAt;

/// Create a copy of TripHistory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TripHistoryCopyWith<_TripHistory> get copyWith => __$TripHistoryCopyWithImpl<_TripHistory>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TripHistory&&(identical(other.id, id) || other.id == id)&&(identical(other.sourceCode, sourceCode) || other.sourceCode == sourceCode)&&(identical(other.sourceName, sourceName) || other.sourceName == sourceName)&&(identical(other.destCode, destCode) || other.destCode == destCode)&&(identical(other.destName, destName) || other.destName == destName)&&(identical(other.departureTime, departureTime) || other.departureTime == departureTime)&&(identical(other.searchedAt, searchedAt) || other.searchedAt == searchedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,sourceCode,sourceName,destCode,destName,departureTime,searchedAt);

@override
String toString() {
  return 'TripHistory(id: $id, sourceCode: $sourceCode, sourceName: $sourceName, destCode: $destCode, destName: $destName, departureTime: $departureTime, searchedAt: $searchedAt)';
}


}

/// @nodoc
abstract mixin class _$TripHistoryCopyWith<$Res> implements $TripHistoryCopyWith<$Res> {
  factory _$TripHistoryCopyWith(_TripHistory value, $Res Function(_TripHistory) _then) = __$TripHistoryCopyWithImpl;
@override @useResult
$Res call({
 int id, String sourceCode, String sourceName, String destCode, String destName, String departureTime, DateTime searchedAt
});




}
/// @nodoc
class __$TripHistoryCopyWithImpl<$Res>
    implements _$TripHistoryCopyWith<$Res> {
  __$TripHistoryCopyWithImpl(this._self, this._then);

  final _TripHistory _self;
  final $Res Function(_TripHistory) _then;

/// Create a copy of TripHistory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? sourceCode = null,Object? sourceName = null,Object? destCode = null,Object? destName = null,Object? departureTime = null,Object? searchedAt = null,}) {
  return _then(_TripHistory(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,sourceCode: null == sourceCode ? _self.sourceCode : sourceCode // ignore: cast_nullable_to_non_nullable
as String,sourceName: null == sourceName ? _self.sourceName : sourceName // ignore: cast_nullable_to_non_nullable
as String,destCode: null == destCode ? _self.destCode : destCode // ignore: cast_nullable_to_non_nullable
as String,destName: null == destName ? _self.destName : destName // ignore: cast_nullable_to_non_nullable
as String,departureTime: null == departureTime ? _self.departureTime : departureTime // ignore: cast_nullable_to_non_nullable
as String,searchedAt: null == searchedAt ? _self.searchedAt : searchedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
