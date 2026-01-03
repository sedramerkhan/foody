// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Payment _$PaymentFromJson(Map<String, dynamic> json) => _Payment(
  paymentId: json['payment_id'] as String,
  orderId: json['order_id'] as String,
  paymentMethod: $enumDecode(_$PaymentMethodEnumMap, json['payment_method']),
  paymentStatus: $enumDecode(_$PaymentStatusEnumMap, json['payment_status']),
  transactionId: json['transaction_id'] as String?,
  amount: (json['amount'] as num).toDouble(),
  paidAt: json['paid_at'] == null
      ? null
      : DateTime.parse(json['paid_at'] as String),
);

Map<String, dynamic> _$PaymentToJson(_Payment instance) => <String, dynamic>{
  'payment_id': instance.paymentId,
  'order_id': instance.orderId,
  'payment_method': _$PaymentMethodEnumMap[instance.paymentMethod]!,
  'payment_status': _$PaymentStatusEnumMap[instance.paymentStatus]!,
  'transaction_id': instance.transactionId,
  'amount': instance.amount,
  'paid_at': instance.paidAt?.toIso8601String(),
};

const _$PaymentMethodEnumMap = {
  PaymentMethod.card: 'card',
  PaymentMethod.paypal: 'paypal',
  PaymentMethod.cash: 'cash',
};

const _$PaymentStatusEnumMap = {
  PaymentStatus.pending: 'pending',
  PaymentStatus.completed: 'completed',
  PaymentStatus.failed: 'failed',
  PaymentStatus.refunded: 'refunded',
};
