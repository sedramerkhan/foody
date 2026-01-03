import 'package:foody/core/base/repository/base_repo.dart';
import 'package:foody/core/api_response/api_response_state/api_response_state.dart';
import 'package:foody/core/api_response/api_response_extensions.dart';
import 'package:foody/core/data/remote/firebase/firebase_database_service.dart';
import 'package:foody/core/di/di.dart';
import 'package:foody/data/model/payment/payment.dart';

/// Repository for payment operations
class PaymentRepo extends BaseRepository {
  final FirebaseDatabaseService _databaseService = getIt<
      FirebaseDatabaseService>();

  /// Create a payment in Firebase
  Future<ApiResponse<String>> createPayment(Payment payment) async {
    final paymentData = payment.toJson();
    final path = 'payments/${payment.paymentId}';

    final response = await _databaseService.write(path, paymentData);

    if (response.isFailure) {
      return response.mapData((_) => '');
    }

    return ApiResponse.success(payment.paymentId);
  }

  /// Get payment by order ID
  Future<ApiResponse<Payment>> getPaymentByOrderId(String orderId) async {
    try {
      // Read all payments and filter by order_id
      final response = await _databaseService.readList('payments');

      if (response.isFailure) {
        return response.mapData((_) => throw Exception('Payment not found'));
      }

      final paymentsList = response.getDataOrNull() ?? [];

      try {
        final matchingPayments = paymentsList.where(
              (json) => json['order_id'] == orderId,
        ).toList();

        if (matchingPayments.isEmpty) {
          return ApiResponse.failure(message: 'Payment not found');
        }

        final paymentJson = matchingPayments.first;
        final payment = Payment.fromJson(paymentJson);
        return ApiResponse.success(payment);
      } catch (e) {
        return ApiResponse.failure(
          message: 'Failed to parse payment: ${e.toString()}',
        );
      }
    } catch (e) {
      return ApiResponse.failure(
        message: 'Failed to fetch payment: ${e.toString()}',
      );
    }
  }

  /// Update payment status
  Future<ApiResponse<void>> updatePaymentStatus(String paymentId,
      PaymentStatus status) async {
    final path = 'payments/$paymentId';
    final updateData = {
      'payment_status': status.name,
      if (status == PaymentStatus.completed) 'paid_at': DateTime
          .now()
          .toIso8601String(),
    };

    final response = await _databaseService.update(path, updateData);

    if (response.isFailure) {
      return response;
    }

    return const ApiResponse.success(null);
  }

  /// Add multiple payments to Firebase (for fake data)
  Future<ApiResponse<void>> addPayments(List<Payment> payments) async {
    try {
      for (final payment in payments) {
        final response = await createPayment(payment);
        if (response.isFailure) {
          final failure = response as Failure;
          return ApiResponse.failure(
            message: 'Failed to add payment ${payment.paymentId}: ${failure
                .message}',
          );
        }
      }
      return const ApiResponse.success(null);
    } catch (e) {
      return ApiResponse.failure(
        message: 'Failed to add payments: ${e.toString()}',
      );
    }
  }
}