import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive.dart';

part 'user.freezed.dart';
part 'user.g.dart';

/// User model for local storage
/// 
/// Stores authenticated user information locally using Freezed
@HiveType(typeId: 0)
@freezed
abstract class User with _$User {
  const User._();

  factory User({
    @HiveField(0) required String uid,
    @HiveField(1) required String username,
    @HiveField(2) required String email,
    @HiveField(3) @Default(null) String? phone,
    @HiveField(4) @Default(null) String? address,
    @HiveField(6) @Default(null) DateTime? createdAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// Create User from Map (for backward compatibility with Firebase data)
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      uid: map['uid'] as String,
      username: (map['username'] as String?) ?? '',
      email: map['email'] as String,
      phone: map['phone'] as String?,
      address: map['address'] as String?,
      createdAt: map['created_at'] != null 
          ? DateTime.tryParse(map['created_at'] as String)
          : null,
    );
  }

  /// Convert User to Map (for backward compatibility)
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'username': username,
      'email': email,
      'phone': phone,
      'address': address,
      'created_at': createdAt?.toIso8601String(),
    };
  }
}
