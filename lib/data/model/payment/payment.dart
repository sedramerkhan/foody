import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment.freezed.dart';
part 'payment.g.dart';

enum PaymentMethod {
  @JsonValue('card')
  card,
  @JsonValue('paypal')
  paypal,
  @JsonValue('cash')
  cash,
}

enum PaymentStatus {
  @JsonValue('pending')
  pending,
  @JsonValue('completed')
  completed,
  @JsonValue('failed')
  failed,
  @JsonValue('refunded')
  refunded,
}

@freezed
abstract class Payment with _$Payment {
  const Payment._();

  factory Payment({
    @JsonKey(name: 'payment_id') required String paymentId,
    @JsonKey(name: 'order_id') required String orderId,
    @JsonKey(name: 'payment_method') required PaymentMethod paymentMethod,
    @JsonKey(name: 'payment_status') required PaymentStatus paymentStatus,
    @JsonKey(name: 'transaction_id') String? transactionId,
    required double amount,
    @JsonKey(name: 'paid_at') DateTime? paidAt,
  }) = _Payment;

  factory Payment.fromJson(Map<String, dynamic> json) =>
      _$PaymentFromJson(json);
}

