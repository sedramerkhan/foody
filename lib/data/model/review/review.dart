import 'package:freezed_annotation/freezed_annotation.dart';

part 'review.freezed.dart';
part 'review.g.dart';

@freezed
abstract class Review with _$Review {
  const Review._();

  factory Review({
    @JsonKey(name: 'review_id') required String reviewId,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'restaurant_id') required String restaurantId,
    @JsonKey(name: 'order_id') required String orderId,
    required double rating,
    String? comment,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _Review;

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
}

