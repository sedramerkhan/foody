// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Payment {

@JsonKey(name: 'payment_id') String get paymentId;@JsonKey(name: 'order_id') String get orderId;@JsonKey(name: 'payment_method') PaymentMethod get paymentMethod;@JsonKey(name: 'payment_status') PaymentStatus get paymentStatus;@JsonKey(name: 'transaction_id') String? get transactionId; double get amount;@JsonKey(name: 'paid_at') DateTime? get paidAt;
/// Create a copy of Payment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentCopyWith<Payment> get copyWith => _$PaymentCopyWithImpl<Payment>(this as Payment, _$identity);

  /// Serializes this Payment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Payment&&(identical(other.paymentId, paymentId) || other.paymentId == paymentId)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.transactionId, transactionId) || other.transactionId == transactionId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.paidAt, paidAt) || other.paidAt == paidAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,paymentId,orderId,paymentMethod,paymentStatus,transactionId,amount,paidAt);

@override
String toString() {
  return 'Payment(paymentId: $paymentId, orderId: $orderId, paymentMethod: $paymentMethod, paymentStatus: $paymentStatus, transactionId: $transactionId, amount: $amount, paidAt: $paidAt)';
}


}

/// @nodoc
abstract mixin class $PaymentCopyWith<$Res>  {
  factory $PaymentCopyWith(Payment value, $Res Function(Payment) _then) = _$PaymentCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'payment_id') String paymentId,@JsonKey(name: 'order_id') String orderId,@JsonKey(name: 'payment_method') PaymentMethod paymentMethod,@JsonKey(name: 'payment_status') PaymentStatus paymentStatus,@JsonKey(name: 'transaction_id') String? transactionId, double amount,@JsonKey(name: 'paid_at') DateTime? paidAt
});




}
/// @nodoc
class _$PaymentCopyWithImpl<$Res>
    implements $PaymentCopyWith<$Res> {
  _$PaymentCopyWithImpl(this._self, this._then);

  final Payment _self;
  final $Res Function(Payment) _then;

/// Create a copy of Payment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? paymentId = null,Object? orderId = null,Object? paymentMethod = null,Object? paymentStatus = null,Object? transactionId = freezed,Object? amount = null,Object? paidAt = freezed,}) {
  return _then(_self.copyWith(
paymentId: null == paymentId ? _self.paymentId : paymentId // ignore: cast_nullable_to_non_nullable
as String,orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as PaymentMethod,paymentStatus: null == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as PaymentStatus,transactionId: freezed == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as String?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,paidAt: freezed == paidAt ? _self.paidAt : paidAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Payment].
extension PaymentPatterns on Payment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Payment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Payment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Payment value)  $default,){
final _that = this;
switch (_that) {
case _Payment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Payment value)?  $default,){
final _that = this;
switch (_that) {
case _Payment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'payment_id')  String paymentId, @JsonKey(name: 'order_id')  String orderId, @JsonKey(name: 'payment_method')  PaymentMethod paymentMethod, @JsonKey(name: 'payment_status')  PaymentStatus paymentStatus, @JsonKey(name: 'transaction_id')  String? transactionId,  double amount, @JsonKey(name: 'paid_at')  DateTime? paidAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Payment() when $default != null:
return $default(_that.paymentId,_that.orderId,_that.paymentMethod,_that.paymentStatus,_that.transactionId,_that.amount,_that.paidAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'payment_id')  String paymentId, @JsonKey(name: 'order_id')  String orderId, @JsonKey(name: 'payment_method')  PaymentMethod paymentMethod, @JsonKey(name: 'payment_status')  PaymentStatus paymentStatus, @JsonKey(name: 'transaction_id')  String? transactionId,  double amount, @JsonKey(name: 'paid_at')  DateTime? paidAt)  $default,) {final _that = this;
switch (_that) {
case _Payment():
return $default(_that.paymentId,_that.orderId,_that.paymentMethod,_that.paymentStatus,_that.transactionId,_that.amount,_that.paidAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'payment_id')  String paymentId, @JsonKey(name: 'order_id')  String orderId, @JsonKey(name: 'payment_method')  PaymentMethod paymentMethod, @JsonKey(name: 'payment_status')  PaymentStatus paymentStatus, @JsonKey(name: 'transaction_id')  String? transactionId,  double amount, @JsonKey(name: 'paid_at')  DateTime? paidAt)?  $default,) {final _that = this;
switch (_that) {
case _Payment() when $default != null:
return $default(_that.paymentId,_that.orderId,_that.paymentMethod,_that.paymentStatus,_that.transactionId,_that.amount,_that.paidAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Payment extends Payment {
   _Payment({@JsonKey(name: 'payment_id') required this.paymentId, @JsonKey(name: 'order_id') required this.orderId, @JsonKey(name: 'payment_method') required this.paymentMethod, @JsonKey(name: 'payment_status') required this.paymentStatus, @JsonKey(name: 'transaction_id') this.transactionId, required this.amount, @JsonKey(name: 'paid_at') this.paidAt}): super._();
  factory _Payment.fromJson(Map<String, dynamic> json) => _$PaymentFromJson(json);

@override@JsonKey(name: 'payment_id') final  String paymentId;
@override@JsonKey(name: 'order_id') final  String orderId;
@override@JsonKey(name: 'payment_method') final  PaymentMethod paymentMethod;
@override@JsonKey(name: 'payment_status') final  PaymentStatus paymentStatus;
@override@JsonKey(name: 'transaction_id') final  String? transactionId;
@override final  double amount;
@override@JsonKey(name: 'paid_at') final  DateTime? paidAt;

/// Create a copy of Payment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentCopyWith<_Payment> get copyWith => __$PaymentCopyWithImpl<_Payment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Payment&&(identical(other.paymentId, paymentId) || other.paymentId == paymentId)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.transactionId, transactionId) || other.transactionId == transactionId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.paidAt, paidAt) || other.paidAt == paidAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,paymentId,orderId,paymentMethod,paymentStatus,transactionId,amount,paidAt);

@override
String toString() {
  return 'Payment(paymentId: $paymentId, orderId: $orderId, paymentMethod: $paymentMethod, paymentStatus: $paymentStatus, transactionId: $transactionId, amount: $amount, paidAt: $paidAt)';
}


}

/// @nodoc
abstract mixin class _$PaymentCopyWith<$Res> implements $PaymentCopyWith<$Res> {
  factory _$PaymentCopyWith(_Payment value, $Res Function(_Payment) _then) = __$PaymentCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'payment_id') String paymentId,@JsonKey(name: 'order_id') String orderId,@JsonKey(name: 'payment_method') PaymentMethod paymentMethod,@JsonKey(name: 'payment_status') PaymentStatus paymentStatus,@JsonKey(name: 'transaction_id') String? transactionId, double amount,@JsonKey(name: 'paid_at') DateTime? paidAt
});




}
/// @nodoc
class __$PaymentCopyWithImpl<$Res>
    implements _$PaymentCopyWith<$Res> {
  __$PaymentCopyWithImpl(this._self, this._then);

  final _Payment _self;
  final $Res Function(_Payment) _then;

/// Create a copy of Payment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? paymentId = null,Object? orderId = null,Object? paymentMethod = null,Object? paymentStatus = null,Object? transactionId = freezed,Object? amount = null,Object? paidAt = freezed,}) {
  return _then(_Payment(
paymentId: null == paymentId ? _self.paymentId : paymentId // ignore: cast_nullable_to_non_nullable
as String,orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as PaymentMethod,paymentStatus: null == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as PaymentStatus,transactionId: freezed == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as String?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,paidAt: freezed == paidAt ? _self.paidAt : paidAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
