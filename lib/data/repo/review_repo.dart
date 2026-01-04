import 'package:foody/core/base/repository/base_repo.dart';
import 'package:foody/core/api_response/api_response_state/api_response_state.dart';
import 'package:foody/core/api_response/api_response_extensions.dart';
import 'package:foody/core/data/remote/firebase/firebase_database_service.dart';
import 'package:foody/core/di/di.dart';
import 'package:foody/data/model/review/review.dart';

/// Repository for review operations
class ReviewRepo extends BaseRepository {
  final FirebaseDatabaseService _databaseService = getIt<FirebaseDatabaseService>();

  /// Create a review in Firebase
  Future<ApiResponse<String>> createReview(Review review) async {
    try {
      final reviewData = review.toJson();
      final path = 'reviews/${review.reviewId}';
      
      final response = await _databaseService.write(path, reviewData);
      
      if (response.isFailure) {
        return response.mapData((_) => '');
      }
      
      return ApiResponse.success(review.reviewId);
    } catch (e) {
      return ApiResponse.failure(
        message: 'Failed to create review: ${e.toString()}',
      );
    }
  }

  /// Get review by order ID (to check if review already exists)
  Future<ApiResponse<Review?>> getReviewByOrderId(String orderId) async {
    try {
      final response = await _databaseService.readList('reviews');
      
      if (response.isFailure) {
        return response.mapData((_) => null);
      }

      final reviewsList = response.getDataOrNull() ?? [];
      
      try {
        final matchingReviews = reviewsList
            .where((json) => json is Map<String, dynamic> && json['order_id'] == orderId)
            .toList();

        if (matchingReviews.isEmpty) {
          return ApiResponse.success(null);
        }

        final reviewJson = matchingReviews.first as Map<String, dynamic>;
        
        // Normalize data types before parsing
        final normalizedJson = Map<String, dynamic>.from(reviewJson);
        
        // Handle rating - convert string to double if needed
        if (normalizedJson['rating'] is String) {
          normalizedJson['rating'] = double.tryParse(normalizedJson['rating'] as String) ?? 0.0;
        } else if (normalizedJson['rating'] is int) {
          normalizedJson['rating'] = (normalizedJson['rating'] as int).toDouble();
        }
        
        // Handle created_at - ensure it's a string
        if (normalizedJson['created_at'] != null && normalizedJson['created_at'] is! String) {
          if (normalizedJson['created_at'] is DateTime) {
            normalizedJson['created_at'] = (normalizedJson['created_at'] as DateTime).toIso8601String();
          } else {
            normalizedJson['created_at'] = normalizedJson['created_at'].toString();
          }
        }
        
        final review = Review.fromJson(normalizedJson);
        return ApiResponse.success(review);
      } catch (e) {
        return ApiResponse.failure(
          message: 'Failed to parse review: ${e.toString()}',
        );
      }
    } catch (e) {
      return ApiResponse.failure(
        message: 'Failed to fetch review: ${e.toString()}',
      );
    }
  }

  /// Get all reviews for a restaurant
  Future<ApiResponse<List<Review>>> getRestaurantReviews(String restaurantId) async {
    try {
      final response = await _databaseService.readList('reviews');
      
      if (response.isFailure) {
        return response.mapData((_) => <Review>[]);
      }

      final reviewsList = response.getDataOrNull() ?? [];
      
      try {
        final reviews = reviewsList
            .where((json) => json is Map<String, dynamic> && json['restaurant_id'] == restaurantId)
            .map((json) {
              final reviewJson = json as Map<String, dynamic>;
              
              // Normalize data types
              final normalizedJson = Map<String, dynamic>.from(reviewJson);
              
              // Handle rating
              if (normalizedJson['rating'] is String) {
                normalizedJson['rating'] = double.tryParse(normalizedJson['rating'] as String) ?? 0.0;
              } else if (normalizedJson['rating'] is int) {
                normalizedJson['rating'] = (normalizedJson['rating'] as int).toDouble();
              }
              
              // Handle created_at
              if (normalizedJson['created_at'] != null && normalizedJson['created_at'] is! String) {
                if (normalizedJson['created_at'] is DateTime) {
                  normalizedJson['created_at'] = (normalizedJson['created_at'] as DateTime).toIso8601String();
                } else {
                  normalizedJson['created_at'] = normalizedJson['created_at'].toString();
                }
              }
              
              return Review.fromJson(normalizedJson);
            })
            .toList();
        
        // Sort by created_at descending (newest first)
        reviews.sort((a, b) => b.createdAt.compareTo(a.createdAt));
        
        return ApiResponse.success(reviews);
      } catch (e) {
        return ApiResponse.failure(
          message: 'Failed to parse reviews: ${e.toString()}',
        );
      }
    } catch (e) {
      return ApiResponse.failure(
        message: 'Failed to fetch reviews: ${e.toString()}',
      );
    }
  }
}

