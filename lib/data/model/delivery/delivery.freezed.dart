// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delivery.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Delivery {

@JsonKey(name: 'delivery_id') String get deliveryId;@JsonKey(name: 'order_id') String get orderId;@JsonKey(name: 'driver_id') String? get driverId;@JsonKey(name: 'delivery_status') DeliveryStatus get deliveryStatus;@JsonKey(name: 'estimated_time') int? get estimatedTime;// in minutes
@JsonKey(name: 'actual_time') DateTime? get actualTime;
/// Create a copy of Delivery
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeliveryCopyWith<Delivery> get copyWith => _$DeliveryCopyWithImpl<Delivery>(this as Delivery, _$identity);

  /// Serializes this Delivery to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Delivery&&(identical(other.deliveryId, deliveryId) || other.deliveryId == deliveryId)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.driverId, driverId) || other.driverId == driverId)&&(identical(other.deliveryStatus, deliveryStatus) || other.deliveryStatus == deliveryStatus)&&(identical(other.estimatedTime, estimatedTime) || other.estimatedTime == estimatedTime)&&(identical(other.actualTime, actualTime) || other.actualTime == actualTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,deliveryId,orderId,driverId,deliveryStatus,estimatedTime,actualTime);

@override
String toString() {
  return 'Delivery(deliveryId: $deliveryId, orderId: $orderId, driverId: $driverId, deliveryStatus: $deliveryStatus, estimatedTime: $estimatedTime, actualTime: $actualTime)';
}


}

/// @nodoc
abstract mixin class $DeliveryCopyWith<$Res>  {
  factory $DeliveryCopyWith(Delivery value, $Res Function(Delivery) _then) = _$DeliveryCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'delivery_id') String deliveryId,@JsonKey(name: 'order_id') String orderId,@JsonKey(name: 'driver_id') String? driverId,@JsonKey(name: 'delivery_status') DeliveryStatus deliveryStatus,@JsonKey(name: 'estimated_time') int? estimatedTime,@JsonKey(name: 'actual_time') DateTime? actualTime
});




}
/// @nodoc
class _$DeliveryCopyWithImpl<$Res>
    implements $DeliveryCopyWith<$Res> {
  _$DeliveryCopyWithImpl(this._self, this._then);

  final Delivery _self;
  final $Res Function(Delivery) _then;

/// Create a copy of Delivery
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? deliveryId = null,Object? orderId = null,Object? driverId = freezed,Object? deliveryStatus = null,Object? estimatedTime = freezed,Object? actualTime = freezed,}) {
  return _then(_self.copyWith(
deliveryId: null == deliveryId ? _self.deliveryId : deliveryId // ignore: cast_nullable_to_non_nullable
as String,orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,driverId: freezed == driverId ? _self.driverId : driverId // ignore: cast_nullable_to_non_nullable
as String?,deliveryStatus: null == deliveryStatus ? _self.deliveryStatus : deliveryStatus // ignore: cast_nullable_to_non_nullable
as DeliveryStatus,estimatedTime: freezed == estimatedTime ? _self.estimatedTime : estimatedTime // ignore: cast_nullable_to_non_nullable
as int?,actualTime: freezed == actualTime ? _self.actualTime : actualTime // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Delivery].
extension DeliveryPatterns on Delivery {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Delivery value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Delivery() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Delivery value)  $default,){
final _that = this;
switch (_that) {
case _Delivery():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Delivery value)?  $default,){
final _that = this;
switch (_that) {
case _Delivery() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'delivery_id')  String deliveryId, @JsonKey(name: 'order_id')  String orderId, @JsonKey(name: 'driver_id')  String? driverId, @JsonKey(name: 'delivery_status')  DeliveryStatus deliveryStatus, @JsonKey(name: 'estimated_time')  int? estimatedTime, @JsonKey(name: 'actual_time')  DateTime? actualTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Delivery() when $default != null:
return $default(_that.deliveryId,_that.orderId,_that.driverId,_that.deliveryStatus,_that.estimatedTime,_that.actualTime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'delivery_id')  String deliveryId, @JsonKey(name: 'order_id')  String orderId, @JsonKey(name: 'driver_id')  String? driverId, @JsonKey(name: 'delivery_status')  DeliveryStatus deliveryStatus, @JsonKey(name: 'estimated_time')  int? estimatedTime, @JsonKey(name: 'actual_time')  DateTime? actualTime)  $default,) {final _that = this;
switch (_that) {
case _Delivery():
return $default(_that.deliveryId,_that.orderId,_that.driverId,_that.deliveryStatus,_that.estimatedTime,_that.actualTime);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'delivery_id')  String deliveryId, @JsonKey(name: 'order_id')  String orderId, @JsonKey(name: 'driver_id')  String? driverId, @JsonKey(name: 'delivery_status')  DeliveryStatus deliveryStatus, @JsonKey(name: 'estimated_time')  int? estimatedTime, @JsonKey(name: 'actual_time')  DateTime? actualTime)?  $default,) {final _that = this;
switch (_that) {
case _Delivery() when $default != null:
return $default(_that.deliveryId,_that.orderId,_that.driverId,_that.deliveryStatus,_that.estimatedTime,_that.actualTime);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Delivery extends Delivery {
   _Delivery({@JsonKey(name: 'delivery_id') required this.deliveryId, @JsonKey(name: 'order_id') required this.orderId, @JsonKey(name: 'driver_id') this.driverId, @JsonKey(name: 'delivery_status') required this.deliveryStatus, @JsonKey(name: 'estimated_time') this.estimatedTime, @JsonKey(name: 'actual_time') this.actualTime}): super._();
  factory _Delivery.fromJson(Map<String, dynamic> json) => _$DeliveryFromJson(json);

@override@JsonKey(name: 'delivery_id') final  String deliveryId;
@override@JsonKey(name: 'order_id') final  String orderId;
@override@JsonKey(name: 'driver_id') final  String? driverId;
@override@JsonKey(name: 'delivery_status') final  DeliveryStatus deliveryStatus;
@override@JsonKey(name: 'estimated_time') final  int? estimatedTime;
// in minutes
@override@JsonKey(name: 'actual_time') final  DateTime? actualTime;

/// Create a copy of Delivery
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeliveryCopyWith<_Delivery> get copyWith => __$DeliveryCopyWithImpl<_Delivery>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeliveryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Delivery&&(identical(other.deliveryId, deliveryId) || other.deliveryId == deliveryId)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.driverId, driverId) || other.driverId == driverId)&&(identical(other.deliveryStatus, deliveryStatus) || other.deliveryStatus == deliveryStatus)&&(identical(other.estimatedTime, estimatedTime) || other.estimatedTime == estimatedTime)&&(identical(other.actualTime, actualTime) || other.actualTime == actualTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,deliveryId,orderId,driverId,deliveryStatus,estimatedTime,actualTime);

@override
String toString() {
  return 'Delivery(deliveryId: $deliveryId, orderId: $orderId, driverId: $driverId, deliveryStatus: $deliveryStatus, estimatedTime: $estimatedTime, actualTime: $actualTime)';
}


}

/// @nodoc
abstract mixin class _$DeliveryCopyWith<$Res> implements $DeliveryCopyWith<$Res> {
  factory _$DeliveryCopyWith(_Delivery value, $Res Function(_Delivery) _then) = __$DeliveryCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'delivery_id') String deliveryId,@JsonKey(name: 'order_id') String orderId,@JsonKey(name: 'driver_id') String? driverId,@JsonKey(name: 'delivery_status') DeliveryStatus deliveryStatus,@JsonKey(name: 'estimated_time') int? estimatedTime,@JsonKey(name: 'actual_time') DateTime? actualTime
});




}
/// @nodoc
class __$DeliveryCopyWithImpl<$Res>
    implements _$DeliveryCopyWith<$Res> {
  __$DeliveryCopyWithImpl(this._self, this._then);

  final _Delivery _self;
  final $Res Function(_Delivery) _then;

/// Create a copy of Delivery
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? deliveryId = null,Object? orderId = null,Object? driverId = freezed,Object? deliveryStatus = null,Object? estimatedTime = freezed,Object? actualTime = freezed,}) {
  return _then(_Delivery(
deliveryId: null == deliveryId ? _self.deliveryId : deliveryId // ignore: cast_nullable_to_non_nullable
as String,orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,driverId: freezed == driverId ? _self.driverId : driverId // ignore: cast_nullable_to_non_nullable
as String?,deliveryStatus: null == deliveryStatus ? _self.deliveryStatus : deliveryStatus // ignore: cast_nullable_to_non_nullable
as DeliveryStatus,estimatedTime: freezed == estimatedTime ? _self.estimatedTime : estimatedTime // ignore: cast_nullable_to_non_nullable
as int?,actualTime: freezed == actualTime ? _self.actualTime : actualTime // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
