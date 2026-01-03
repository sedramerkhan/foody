// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'driver.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Driver {

@JsonKey(name: 'driver_id') String get driverId; String get name; String get phone;@JsonKey(name: 'vehicle_type') String get vehicleType;@JsonKey(name: 'availability_status') bool get availabilityStatus;
/// Create a copy of Driver
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DriverCopyWith<Driver> get copyWith => _$DriverCopyWithImpl<Driver>(this as Driver, _$identity);

  /// Serializes this Driver to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Driver&&(identical(other.driverId, driverId) || other.driverId == driverId)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.vehicleType, vehicleType) || other.vehicleType == vehicleType)&&(identical(other.availabilityStatus, availabilityStatus) || other.availabilityStatus == availabilityStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,driverId,name,phone,vehicleType,availabilityStatus);

@override
String toString() {
  return 'Driver(driverId: $driverId, name: $name, phone: $phone, vehicleType: $vehicleType, availabilityStatus: $availabilityStatus)';
}


}

/// @nodoc
abstract mixin class $DriverCopyWith<$Res>  {
  factory $DriverCopyWith(Driver value, $Res Function(Driver) _then) = _$DriverCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'driver_id') String driverId, String name, String phone,@JsonKey(name: 'vehicle_type') String vehicleType,@JsonKey(name: 'availability_status') bool availabilityStatus
});




}
/// @nodoc
class _$DriverCopyWithImpl<$Res>
    implements $DriverCopyWith<$Res> {
  _$DriverCopyWithImpl(this._self, this._then);

  final Driver _self;
  final $Res Function(Driver) _then;

/// Create a copy of Driver
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? driverId = null,Object? name = null,Object? phone = null,Object? vehicleType = null,Object? availabilityStatus = null,}) {
  return _then(_self.copyWith(
driverId: null == driverId ? _self.driverId : driverId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,vehicleType: null == vehicleType ? _self.vehicleType : vehicleType // ignore: cast_nullable_to_non_nullable
as String,availabilityStatus: null == availabilityStatus ? _self.availabilityStatus : availabilityStatus // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Driver].
extension DriverPatterns on Driver {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Driver value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Driver() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Driver value)  $default,){
final _that = this;
switch (_that) {
case _Driver():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Driver value)?  $default,){
final _that = this;
switch (_that) {
case _Driver() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'driver_id')  String driverId,  String name,  String phone, @JsonKey(name: 'vehicle_type')  String vehicleType, @JsonKey(name: 'availability_status')  bool availabilityStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Driver() when $default != null:
return $default(_that.driverId,_that.name,_that.phone,_that.vehicleType,_that.availabilityStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'driver_id')  String driverId,  String name,  String phone, @JsonKey(name: 'vehicle_type')  String vehicleType, @JsonKey(name: 'availability_status')  bool availabilityStatus)  $default,) {final _that = this;
switch (_that) {
case _Driver():
return $default(_that.driverId,_that.name,_that.phone,_that.vehicleType,_that.availabilityStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'driver_id')  String driverId,  String name,  String phone, @JsonKey(name: 'vehicle_type')  String vehicleType, @JsonKey(name: 'availability_status')  bool availabilityStatus)?  $default,) {final _that = this;
switch (_that) {
case _Driver() when $default != null:
return $default(_that.driverId,_that.name,_that.phone,_that.vehicleType,_that.availabilityStatus);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Driver extends Driver {
   _Driver({@JsonKey(name: 'driver_id') required this.driverId, required this.name, required this.phone, @JsonKey(name: 'vehicle_type') required this.vehicleType, @JsonKey(name: 'availability_status') this.availabilityStatus = true}): super._();
  factory _Driver.fromJson(Map<String, dynamic> json) => _$DriverFromJson(json);

@override@JsonKey(name: 'driver_id') final  String driverId;
@override final  String name;
@override final  String phone;
@override@JsonKey(name: 'vehicle_type') final  String vehicleType;
@override@JsonKey(name: 'availability_status') final  bool availabilityStatus;

/// Create a copy of Driver
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DriverCopyWith<_Driver> get copyWith => __$DriverCopyWithImpl<_Driver>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DriverToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Driver&&(identical(other.driverId, driverId) || other.driverId == driverId)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.vehicleType, vehicleType) || other.vehicleType == vehicleType)&&(identical(other.availabilityStatus, availabilityStatus) || other.availabilityStatus == availabilityStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,driverId,name,phone,vehicleType,availabilityStatus);

@override
String toString() {
  return 'Driver(driverId: $driverId, name: $name, phone: $phone, vehicleType: $vehicleType, availabilityStatus: $availabilityStatus)';
}


}

/// @nodoc
abstract mixin class _$DriverCopyWith<$Res> implements $DriverCopyWith<$Res> {
  factory _$DriverCopyWith(_Driver value, $Res Function(_Driver) _then) = __$DriverCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'driver_id') String driverId, String name, String phone,@JsonKey(name: 'vehicle_type') String vehicleType,@JsonKey(name: 'availability_status') bool availabilityStatus
});




}
/// @nodoc
class __$DriverCopyWithImpl<$Res>
    implements _$DriverCopyWith<$Res> {
  __$DriverCopyWithImpl(this._self, this._then);

  final _Driver _self;
  final $Res Function(_Driver) _then;

/// Create a copy of Driver
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? driverId = null,Object? name = null,Object? phone = null,Object? vehicleType = null,Object? availabilityStatus = null,}) {
  return _then(_Driver(
driverId: null == driverId ? _self.driverId : driverId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,vehicleType: null == vehicleType ? _self.vehicleType : vehicleType // ignore: cast_nullable_to_non_nullable
as String,availabilityStatus: null == availabilityStatus ? _self.availabilityStatus : availabilityStatus // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
