import 'package:foody/core/api_response/api_response_extensions.dart';
import 'package:foody/core/base/repository/base_repo.dart';
import 'package:foody/core/api_response/api_response_state/api_response_state.dart';
import 'package:foody/core/data/remote/firebase/firebase_auth_service.dart';
import 'package:foody/data/local/app_local_data.dart';
import 'package:foody/data/model/user/user.dart';
import 'package:foody/core/data/remote/firebase/firebase_database_service.dart';
import 'package:foody/core/di/di.dart';

/// Repository for authentication operations
class AuthRepo extends BaseRepository {
  final FirebaseAuthService _authService = getIt<FirebaseAuthService>();
  final FirebaseDatabaseService _databaseService = getIt<FirebaseDatabaseService>();

  /// Sign in with email and password using Firebase
  Future<ApiResponse<Map<String, dynamic>>> signIn({
    required String email,
    required String password,
  }) async {
    final response = await _authService.signInWithEmail(
      email: email,
      password: password,
    );

    if (response.isFailure) {
      final failure = response as Failure;
      return ApiResponse.failure(code: failure.code, message: failure.message);
    }

    final user = response.getDataOrNull();
    if (user == null) {
      return const ApiResponse.failure(
        message: 'Sign in failed. Please try again.',
      );
    }

    // Get complete user data from database
    final userDataResponse = await _databaseService.read('users/${user.uid}');
    final userData = userDataResponse.getDataOrNull();
    
    // Prepare user data
    final userModel = User(
      uid: user.uid,
      username: userData?['username'] ?? user.displayName ?? '',
      email: user.email ?? email,
      phone: userData?['phone'] ?? '',
      address: userData?['address'] ?? '',
      createdAt: userData?['created_at'] != null
          ? DateTime.tryParse(userData!['created_at'] as String)
          : null,
    );
    
    // Store user data locally for quick access
    await getIt<AppLocalData>().user.storeData(userModel);
    
    return ApiResponse.success(userModel.toMap());
  }

  /// Sign up with username, email, password, and user information using Firebase
  Future<ApiResponse<Map<String, dynamic>>> signUp({
    required String username,
    required String email,
    required String password,
    String? phone,
    String? address,
  }) async {
    final response = await _authService.signUpWithEmail(
      username: username,
      email: email,
      password: password,
      phone: phone,
      address: address,
    );

    if (response.isFailure) {
      final failure = response as Failure;
      return ApiResponse.failure(code: failure.code, message: failure.message);
    }

    final user = response.getDataOrNull();
    if (user == null) {
      return const ApiResponse.failure(
        message: 'Sign up failed. Please try again.',
      );
    }

    // Prepare user data
    final userModel = User(
      uid: user.uid,
      username: username,
      email: email,
      phone: phone,
      address: address,
      createdAt: DateTime.now(),
    );
    
    // Store user data locally for quick access
    await getIt<AppLocalData>().user.storeData(userModel);
    
    return ApiResponse.success(userModel.toMap());
  }

  /// Sign out the current user
  Future<ApiResponse<void>> signOut() async {
    final response = await _authService.signOut();
    
    // Clear stored user data on successful sign out
    if (response.isSuccess) {
      await getIt<AppLocalData>().clearUserData();
    }
    
    return response;
  }

}

