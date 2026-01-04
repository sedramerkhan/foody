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
        final matchingPayments = paymentsList
            .where((json) => json is Map<String, dynamic> && json['order_id'] == orderId)
            .toList();

        if (matchingPayments.isEmpty) {
          return ApiResponse.failure(message: 'Payment not found');
        }

        final paymentJson = matchingPayments.first as Map<String, dynamic>;
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

  /// Generate fake payments for testing
  static List<Payment> getFakePayments() {
    final now = DateTime.now();
    return [
      Payment(
        paymentId: 'payment_1',
        orderId: 'order_1',
        paymentMethod: PaymentMethod.card,
        paymentStatus: PaymentStatus.completed,
        transactionId: 'txn_123456789',
        amount: 25.99,
        paidAt: now.subtract(const Duration(days: 1)),
      ),
      Payment(
        paymentId: 'payment_2',
        orderId: 'order_2',
        paymentMethod: PaymentMethod.cash,
        paymentStatus: PaymentStatus.completed,
        transactionId: null,
        amount: 18.50,
        paidAt: now.subtract(const Duration(hours: 12)),
      ),
      Payment(
        paymentId: 'payment_3',
        orderId: 'order_3',
        paymentMethod: PaymentMethod.paypal,
        paymentStatus: PaymentStatus.completed,
        transactionId: 'pp_987654321',
        amount: 32.75,
        paidAt: now.subtract(const Duration(hours: 6)),
      ),
      Payment(
        paymentId: 'payment_4',
        orderId: 'order_4',
        paymentMethod: PaymentMethod.card,
        paymentStatus: PaymentStatus.pending,
        transactionId: 'txn_111222333',
        amount: 15.00,
        paidAt: null,
      ),
      Payment(
        paymentId: 'payment_5',
        orderId: 'order_5',
        paymentMethod: PaymentMethod.cash,
        paymentStatus: PaymentStatus.completed,
        transactionId: null,
        amount: 42.30,
        paidAt: now.subtract(const Duration(minutes: 30)),
      ),
    ];
  }
}