// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Review _$ReviewFromJson(Map<String, dynamic> json) => _Review(
  reviewId: json['review_id'] as String,
  userId: json['user_id'] as String,
  restaurantId: json['restaurant_id'] as String,
  orderId: json['order_id'] as String,
  rating: (json['rating'] as num).toDouble(),
  comment: json['comment'] as String?,
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$ReviewToJson(_Review instance) => <String, dynamic>{
  'review_id': instance.reviewId,
  'user_id': instance.userId,
  'restaurant_id': instance.restaurantId,
  'order_id': instance.orderId,
  'rating': instance.rating,
  'comment': instance.comment,
  'created_at': instance.createdAt.toIso8601String(),
};
