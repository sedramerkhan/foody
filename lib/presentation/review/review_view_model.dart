import 'package:flutter/material.dart';
import 'package:foody/core/api_response/api_response_extensions.dart';
import 'package:foody/core/base/view_model/base_view_model.dart';
import 'package:foody/core/api_response/api_response_state/api_response_state.dart';
import 'package:foody/core/di/di.dart';
import 'package:foody/data/repo/review_repo.dart';
import 'package:foody/data/repo/order_repo.dart';
import 'package:foody/data/local/app_local_data.dart';
import 'package:foody/data/model/review/review.dart';
import 'package:foody/data/model/order/order.dart';

/// View model for review screen
class ReviewViewModel extends BaseViewModel {
  final ReviewRepo _reviewRepo = getIt<ReviewRepo>();
  final OrderRepo _orderRepo = getIt<OrderRepo>();
  final AppLocalData _appLocalData = AppLocalData();

  final String orderId;
  final ValueNotifier<bool> isLoading = ValueNotifier(false);
  final ValueNotifier<double> rating = ValueNotifier(0.0);
  final TextEditingController commentController = TextEditingController();

  ReviewViewModel(this.orderId);

  /// Set rating value
  void setRating(double value) {
    rating.value = value;
  }

  /// Submit review
  Future<ApiResponse<void>> submitReview() async {
    if (rating.value == 0.0) {
      return ApiResponse.failure(
        message: 'Please provide a rating',
      );
    }

    isLoading.value = true;
    notifyListeners();

    try {
      // Get current user
      final user = await _appLocalData.user.getData();
      if (user == null) {
        isLoading.value = false;
        return ApiResponse.failure(
          message: 'User not authenticated. Please sign in again.',
        );
      }

      // Get order to verify it's completed and get restaurant_id
      final orderResponse = await _orderRepo.getOrder(orderId);
      if (orderResponse.isFailure) {
        isLoading.value = false;
        return orderResponse.mapData((_) => throw Exception('Order not found'));
      }

      final order = orderResponse.getDataOrNull();
      if (order == null) {
        isLoading.value = false;
        return ApiResponse.failure(message: 'Order not found');
      }

      // Check if order is completed
      if (order.orderStatus != OrderStatus.delivered) {
        isLoading.value = false;
        return ApiResponse.failure(
          message: 'You can only review completed orders',
        );
      }

      // Check if review already exists
      final existingReviewResponse = await _reviewRepo.getReviewByOrderId(orderId);
      if (existingReviewResponse.isFailure) {
        isLoading.value = false;
        return existingReviewResponse.mapData((_) => throw Exception('Failed to check existing review'));
      }

      final existingReview = existingReviewResponse.getDataOrNull();
      if (existingReview != null) {
        isLoading.value = false;
        return ApiResponse.failure(
          message: 'You have already reviewed this order',
        );
      }

      // Create review
      final review = Review(
        reviewId: DateTime.now().millisecondsSinceEpoch.toString(),
        userId: user.uid,
        restaurantId: order.restaurantId,
        orderId: orderId,
        rating: rating.value,
        comment: commentController.text.trim().isEmpty ? null : commentController.text.trim(),
        createdAt: DateTime.now(),
      );

      final response = await _reviewRepo.createReview(review);
      isLoading.value = false;

      if (response.isFailure) {
        return response.mapData((_) => throw Exception('Failed to create review'));
      }

      return const ApiResponse.success(null);
    } catch (e) {
      isLoading.value = false;
      return ApiResponse.failure(
        message: 'Failed to submit review: ${e.toString()}',
      );
    }
  }

  @override
  void dispose() {
    isLoading.dispose();
    rating.dispose();
    commentController.dispose();
    super.dispose();
  }
}

