// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'alert_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AlertModel {

 int get id; double get lat; double get lon; String? get line;// Może być null wg. Twojego API
 String get category; int get score;// Domyślna wartość
 DateTime get since;
/// Create a copy of AlertModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlertModelCopyWith<AlertModel> get copyWith => _$AlertModelCopyWithImpl<AlertModel>(this as AlertModel, _$identity);

  /// Serializes this AlertModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlertModel&&(identical(other.id, id) || other.id == id)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lon, lon) || other.lon == lon)&&(identical(other.line, line) || other.line == line)&&(identical(other.category, category) || other.category == category)&&(identical(other.score, score) || other.score == score)&&(identical(other.since, since) || other.since == since));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,lat,lon,line,category,score,since);

@override
String toString() {
  return 'AlertModel(id: $id, lat: $lat, lon: $lon, line: $line, category: $category, score: $score, since: $since)';
}


}

/// @nodoc
abstract mixin class $AlertModelCopyWith<$Res>  {
  factory $AlertModelCopyWith(AlertModel value, $Res Function(AlertModel) _then) = _$AlertModelCopyWithImpl;
@useResult
$Res call({
 int id, double lat, double lon, String? line, String category, int score, DateTime since
});




}
/// @nodoc
class _$AlertModelCopyWithImpl<$Res>
    implements $AlertModelCopyWith<$Res> {
  _$AlertModelCopyWithImpl(this._self, this._then);

  final AlertModel _self;
  final $Res Function(AlertModel) _then;

/// Create a copy of AlertModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? lat = null,Object? lon = null,Object? line = freezed,Object? category = null,Object? score = null,Object? since = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lon: null == lon ? _self.lon : lon // ignore: cast_nullable_to_non_nullable
as double,line: freezed == line ? _self.line : line // ignore: cast_nullable_to_non_nullable
as String?,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,since: null == since ? _self.since : since // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [AlertModel].
extension AlertModelPatterns on AlertModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AlertModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AlertModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AlertModel value)  $default,){
final _that = this;
switch (_that) {
case _AlertModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AlertModel value)?  $default,){
final _that = this;
switch (_that) {
case _AlertModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  double lat,  double lon,  String? line,  String category,  int score,  DateTime since)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AlertModel() when $default != null:
return $default(_that.id,_that.lat,_that.lon,_that.line,_that.category,_that.score,_that.since);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  double lat,  double lon,  String? line,  String category,  int score,  DateTime since)  $default,) {final _that = this;
switch (_that) {
case _AlertModel():
return $default(_that.id,_that.lat,_that.lon,_that.line,_that.category,_that.score,_that.since);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  double lat,  double lon,  String? line,  String category,  int score,  DateTime since)?  $default,) {final _that = this;
switch (_that) {
case _AlertModel() when $default != null:
return $default(_that.id,_that.lat,_that.lon,_that.line,_that.category,_that.score,_that.since);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AlertModel implements AlertModel {
  const _AlertModel({required this.id, required this.lat, required this.lon, this.line, required this.category, this.score = 0, required this.since});
  factory _AlertModel.fromJson(Map<String, dynamic> json) => _$AlertModelFromJson(json);

@override final  int id;
@override final  double lat;
@override final  double lon;
@override final  String? line;
// Może być null wg. Twojego API
@override final  String category;
@override@JsonKey() final  int score;
// Domyślna wartość
@override final  DateTime since;

/// Create a copy of AlertModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AlertModelCopyWith<_AlertModel> get copyWith => __$AlertModelCopyWithImpl<_AlertModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AlertModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AlertModel&&(identical(other.id, id) || other.id == id)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lon, lon) || other.lon == lon)&&(identical(other.line, line) || other.line == line)&&(identical(other.category, category) || other.category == category)&&(identical(other.score, score) || other.score == score)&&(identical(other.since, since) || other.since == since));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,lat,lon,line,category,score,since);

@override
String toString() {
  return 'AlertModel(id: $id, lat: $lat, lon: $lon, line: $line, category: $category, score: $score, since: $since)';
}


}

/// @nodoc
abstract mixin class _$AlertModelCopyWith<$Res> implements $AlertModelCopyWith<$Res> {
  factory _$AlertModelCopyWith(_AlertModel value, $Res Function(_AlertModel) _then) = __$AlertModelCopyWithImpl;
@override @useResult
$Res call({
 int id, double lat, double lon, String? line, String category, int score, DateTime since
});




}
/// @nodoc
class __$AlertModelCopyWithImpl<$Res>
    implements _$AlertModelCopyWith<$Res> {
  __$AlertModelCopyWithImpl(this._self, this._then);

  final _AlertModel _self;
  final $Res Function(_AlertModel) _then;

/// Create a copy of AlertModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? lat = null,Object? lon = null,Object? line = freezed,Object? category = null,Object? score = null,Object? since = null,}) {
  return _then(_AlertModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lon: null == lon ? _self.lon : lon // ignore: cast_nullable_to_non_nullable
as double,line: freezed == line ? _self.line : line // ignore: cast_nullable_to_non_nullable
as String?,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,since: null == since ? _self.since : since // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
