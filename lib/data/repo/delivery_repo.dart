import 'package:foody/core/base/repository/base_repo.dart';
import 'package:foody/core/api_response/api_response_state/api_response_state.dart';
import 'package:foody/core/api_response/api_response_extensions.dart';
import 'package:foody/core/data/remote/firebase/firebase_database_service.dart';
import 'package:foody/core/di/di.dart';
import 'package:foody/data/model/delivery/delivery.dart';

/// Repository for delivery operations
class DeliveryRepo extends BaseRepository {
  final FirebaseDatabaseService _databaseService = getIt<FirebaseDatabaseService>();

  /// Create a delivery in Firebase
  Future<ApiResponse<String>> createDelivery(Delivery delivery) async {
    final deliveryData = delivery.toJson();
    final path = 'deliveries/${delivery.deliveryId}';

    final response = await _databaseService.write(path, deliveryData);

    if (response.isFailure) {
      return response.mapData((_) => '');
    }

    return ApiResponse.success(delivery.deliveryId);
  }

  /// Get delivery by order ID
  Future<ApiResponse<Delivery>> getDeliveryByOrderId(String orderId) async {
    try {
      // Read all deliveries and filter by order_id
      final response = await _databaseService.readList('deliveries');

      if (response.isFailure) {
        return response.mapData((_) => throw Exception('Delivery not found'));
      }

      final deliveriesList = response.getDataOrNull() ?? [];

      try {
        final matchingDeliveries = deliveriesList.where(
          (json) => json['order_id'] == orderId,
        ).toList();

        if (matchingDeliveries.isEmpty) {
          return ApiResponse.failure(message: 'Delivery not found');
        }

        final deliveryJson = matchingDeliveries.first;
        final delivery = Delivery.fromJson(deliveryJson);
        return ApiResponse.success(delivery);
      } catch (e) {
        return ApiResponse.failure(
          message: 'Failed to parse delivery: ${e.toString()}',
        );
      }
    } catch (e) {
      return ApiResponse.failure(
        message: 'Failed to fetch delivery: ${e.toString()}',
      );
    }
  }

  /// Update delivery status
  Future<ApiResponse<void>> updateDeliveryStatus(String deliveryId, DeliveryStatus status) async {
    final path = 'deliveries/$deliveryId';
    final updateData = {
      'delivery_status': status.name,
      if (status == DeliveryStatus.delivered) 'actual_time': DateTime.now().toIso8601String(),
    };

    final response = await _databaseService.update(path, updateData);

    if (response.isFailure) {
      return response;
    }

    return const ApiResponse.success(null);
  }

  /// Assign driver to delivery
  Future<ApiResponse<void>> assignDriver(String deliveryId, String driverId) async {
    final path = 'deliveries/$deliveryId';
    final updateData = {
      'driver_id': driverId,
    };

    final response = await _databaseService.update(path, updateData);

    if (response.isFailure) {
      return response;
    }

    return const ApiResponse.success(null);
  }
}

