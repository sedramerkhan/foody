import 'package:foody/core/base/repository/base_repo.dart';
import 'package:foody/core/api_response/api_response_state/api_response_state.dart';
import 'package:foody/core/data/remote/firebase/firebase_auth_service.dart';
import 'package:foody/core/di/di.dart';

/// Repository for authentication operations
class AuthRepo extends BaseRepository {
  final FirebaseAuthService _authService = getIt<FirebaseAuthService>();

  /// Sign in with email and password using Firebase
  Future<ApiResponse<Map<String, dynamic>>> signIn({
    required String email,
    required String password,
  }) async {
    final response = await _authService.signInWithEmail(
      email: email,
      password: password,
    );

    return await response.when(
      success: (user) async {
        if (user == null) {
          return const ApiResponse.failure(
            message: 'Sign in failed. Please try again.',
          );
        }
        // Get username from database if available
        final usernameResponse = await _authService.getUsernameForUser(user.uid);
        final dbUsername = usernameResponse.when(
          success: (u) => u,
          failure: (_, _) => null,
          loading: () => null,
          none: () => null,
        );
        
        return ApiResponse.success({
          'uid': user.uid,
          'username': dbUsername,
          'email': user.email ?? email,
          'displayName': user.displayName ?? '',
        });
      },
      failure: (code, message) {
        return ApiResponse.failure(code: code, message: message);
      },
      loading: () => const ApiResponse.loading(),
      none: () => const ApiResponse.none(),
    );
  }

  /// Sign up with username, email, password, and user information using Firebase
  Future<ApiResponse<Map<String, dynamic>>> signUp({
    required String username,
    required String email,
    required String password,
    String? phone,
    String? address,
  }) async {
    print('[AUTH_REPO] Sign-up called');
    print('[AUTH_REPO] Calling FirebaseAuthService.signUpWithEmail');
    
    final response = await _authService.signUpWithEmail(
      username: username,
      email: email,
      password: password,
      phone: phone,
      address: address,
    );

    print('[AUTH_REPO] Response received from FirebaseAuthService: ${response.runtimeType}');
    
    return response.when(
      success: (user) {
        print('[AUTH_REPO] Success branch - user: ${user?.uid}');
        if (user == null) {
          print('[AUTH_REPO] User is null, returning failure');
          return const ApiResponse.failure(
            message: 'Sign up failed. Please try again.',
          );
        }
        print('[AUTH_REPO] Creating success response with user data');
        return ApiResponse.success({
          'uid': user.uid,
          'username': username,
          'email': email,
          'phone': phone ?? '',
          'address': address ?? '',
          'displayName': user.displayName ?? '',
        });
      },
      failure: (code, message) {
        print('[AUTH_REPO] Failure: $code - $message');
        return ApiResponse.failure(code: code, message: message);
      },
      loading: () {
        print('[AUTH_REPO] Still loading...');
        return const ApiResponse.loading();
      },
      none: () {
        print('[AUTH_REPO] None state');
        return const ApiResponse.none();
      },
    );
  }

  /// Sign out the current user
  Future<ApiResponse<void>> signOut() async {
    return await _authService.signOut();
  }

  /// Send password reset email (for username-based accounts)
  Future<ApiResponse<void>> sendPasswordResetEmail(String username) async {
    // Convert username to email format
    final email = '${username.trim().toLowerCase()}@foody.app';
    return await _authService.sendPasswordResetEmail(email);
  }
}

