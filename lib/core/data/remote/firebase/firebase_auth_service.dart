import 'package:firebase_auth/firebase_auth.dart';
import 'package:foody/core/api_response/api_response_state/api_response_state.dart';
import 'package:foody/core/data/remote/firebase/firebase_database_service.dart';
import 'package:foody/core/di/di.dart';

/// Service for Firebase Authentication operations
/// 
/// This service provides authentication methods like sign in, sign up,
/// sign out, password reset, and user state management.
/// 
/// Note: Firebase Auth requires email, so usernames are mapped to email format
/// (username@foody.app) and stored in Firebase Database.
class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseDatabaseService _databaseService = getIt<FirebaseDatabaseService>();
  
  // Domain used for username-to-email mapping
  static const String _emailDomain = '@foody.app';
  
  /// Convert username to email format for Firebase Auth
  String _usernameToEmail(String username) {
    return '${username.trim().toLowerCase()}$_emailDomain';
  }

  /// Get the current user
  User? get currentUser => _auth.currentUser;

  /// Get a stream of authentication state changes
  Stream<User?> get authStateChanges => _auth.authStateChanges();


  /// Sign in with email and password
  /// 
  /// Returns the user data on success, or an error on failure.
  /// 
  /// Example:
  /// ```dart
  /// final response = await service.signInWithEmail(
  ///   email: 'user@example.com',
  ///   password: 'password123',
  /// );
  /// ```
  Future<ApiResponse<User>> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );

      if (userCredential.user != null) {
        return ApiResponse.success(userCredential.user!);
      } else {
        return const ApiResponse.failure(
          message: 'Sign in failed. Please try again.',
        );
      }
    } on FirebaseAuthException catch (e) {
      return ApiResponse.failure(
        code: e.code,
        message: _getErrorMessage(e.code),
      );
    } catch (e) {
      return ApiResponse.failure(
        message: 'An unexpected error occurred: ${e.toString()}',
      );
    }
  }



  /// Sign up with username, email and password
  /// 
  /// Creates a new user account and stores all user data in Firebase Database.
  /// Returns the user data on success.
  /// 
  /// Example:
  /// ```dart
  /// final response = await service.signUpWithEmail(
  ///   username: 'johndoe',
  ///   email: 'user@example.com',
  ///   password: 'password123',
  ///   phone: '+1234567890',
  ///   address: '123 Main St',
  /// );
  /// ```
  Future<ApiResponse<User>> signUpWithEmail({
    required String username,
    required String email,
    required String password,
    String? phone,
    String? address,
  }) async {
    print('[FIREBASE_AUTH] signUpWithEmail started');
    print('[FIREBASE_AUTH] Username: $username');
    print('[FIREBASE_AUTH] Email: $email');
    
    try {
      final normalizedUsername = username.trim().toLowerCase();
      final normalizedEmail = email.trim().toLowerCase();
      print('[FIREBASE_AUTH] Normalized username: $normalizedUsername');
      print('[FIREBASE_AUTH] Normalized email: $normalizedEmail');
      
      // Check if username already exists
      print('[FIREBASE_AUTH] Checking if username exists in database...');
      final usernameCheck = await _databaseService.read('usernames/$normalizedUsername');
      print('[FIREBASE_AUTH] Username check response: ${usernameCheck.runtimeType}');
      
      final usernameExists = usernameCheck.when(
        success: (data) {
          print('[FIREBASE_AUTH] Username check success, data: $data');
          return data != null;
        },
        failure: (code, message) {
          print('[FIREBASE_AUTH] Username check failed: $code - $message');
          return false;
        },
        loading: () {
          print('[FIREBASE_AUTH] Username check loading...');
          return false;
        },
        none: () {
          print('[FIREBASE_AUTH] Username check none state');
          return false;
        },
      );
      
      if (usernameExists) {
        print('[FIREBASE_AUTH] Username already exists, returning failure');
        return const ApiResponse.failure(
          code: 'username-exists',
          message: 'This username is already taken. Please choose another one.',
        );
      }
      
      // Create user in Firebase Auth
      print('[FIREBASE_AUTH] Creating user in Firebase Auth...');
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: normalizedEmail,
        password: password,
      );
      print('[FIREBASE_AUTH] User credential received: ${userCredential.user?.uid}');

      if (userCredential.user != null) {
        final user = userCredential.user!;
        final now = DateTime.now().toIso8601String();
        print('[FIREBASE_AUTH] User created successfully, UID: ${user.uid}');
        
        // Store username mapping in Firebase Database
        print('[FIREBASE_AUTH] Writing username mapping to database...');
        final usernameWriteResult = await _databaseService.write('usernames/$normalizedUsername', {
          'uid': user.uid,
          'email': normalizedEmail,
          'created_at': now,
        });
        print('[FIREBASE_AUTH] Username write result: ${usernameWriteResult.runtimeType}');
        usernameWriteResult.when(
          success: (_) => print('[FIREBASE_AUTH] Username mapping written successfully'),
          failure: (code, message) => print('[FIREBASE_AUTH] Username mapping write failed: $code - $message'),
          loading: () => print('[FIREBASE_AUTH] Username mapping write loading...'),
          none: () => print('[FIREBASE_AUTH] Username mapping write none state'),
        );
        
        // Store complete user data in Firebase Database
        print('[FIREBASE_AUTH] Writing user data to database...');
        final userData = {
          'username': normalizedUsername,
          'email': normalizedEmail,
          'phone': phone?.trim().isNotEmpty == true ? phone!.trim() : null,
          'address': address?.trim().isNotEmpty == true ? address!.trim() : null,
          'created_at': now,
          'updated_at': now,
        };
        print('[FIREBASE_AUTH] User data to write: $userData');
        
        final userWriteResult = await _databaseService.write('users/${user.uid}', userData);
        print('[FIREBASE_AUTH] User write result: ${userWriteResult.runtimeType}');
        userWriteResult.when(
          success: (_) => print('[FIREBASE_AUTH] User data written successfully'),
          failure: (code, message) => print('[FIREBASE_AUTH] User data write failed: $code - $message'),
          loading: () => print('[FIREBASE_AUTH] User data write loading...'),
          none: () => print('[FIREBASE_AUTH] User data write none state'),
        );
        
        // Update Firebase Auth display name with username
        print('[FIREBASE_AUTH] Updating display name...');
        try {
          await user.updateDisplayName(normalizedUsername);
          await user.reload();
          print('[FIREBASE_AUTH] Display name updated successfully');
        } catch (e) {
          print('[FIREBASE_AUTH] Display name update failed (non-critical): $e');
        }
        
        print('[FIREBASE_AUTH] Sign-up completed successfully');
        return ApiResponse.success(user);
      } else {
        print('[FIREBASE_AUTH] User credential is null');
        return const ApiResponse.failure(
          message: 'Sign up failed. Please try again.',
        );
      }
    } on FirebaseAuthException catch (e) {
      print('[FIREBASE_AUTH] FirebaseAuthException: ${e.code} - ${e.message}');
      print('[FIREBASE_AUTH] Stack trace: ${e.stackTrace}');
      return ApiResponse.failure(
        code: e.code,
        message: _getErrorMessage(e.code),
      );
    } catch (e, stackTrace) {
      print('[FIREBASE_AUTH] Unexpected error: $e');
      print('[FIREBASE_AUTH] Stack trace: $stackTrace');
      return ApiResponse.failure(
        message: 'An unexpected error occurred: ${e.toString()}',
      );
    }
  }
  
  /// Get username for current user from database
  Future<ApiResponse<String?>> getUsernameForUser(String uid) async {
    try {
      final userData = await _databaseService.read('users/$uid');
      return userData.when(
        success: (data) {
          if (data != null) {
            return ApiResponse.success(data['username'] as String?);
          }
          return const ApiResponse.success(null);
        },
        failure: (code, message) => ApiResponse.failure(
          code: code,
          message: message,
        ),
        loading: () => const ApiResponse.loading(),
        none: () => const ApiResponse.none(),
      );
    } catch (e) {
      return ApiResponse.failure(
        message: 'Failed to get username: ${e.toString()}',
      );
    }
  }

  /// Sign out the current user
  /// 
  /// Example:
  /// ```dart
  /// await service.signOut();
  /// ```
  Future<ApiResponse<void>> signOut() async {
    try {
      await _auth.signOut();
      return const ApiResponse.success(null);
    } catch (e) {
      return ApiResponse.failure(
        message: 'Failed to sign out: ${e.toString()}',
      );
    }
  }

  /// Send password reset email
  /// 
  /// Sends a password reset email to the specified email address.
  /// 
  /// Example:
  /// ```dart
  /// await service.sendPasswordResetEmail('user@example.com');
  /// ```
  Future<ApiResponse<void>> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email.trim());
      return const ApiResponse.success(null);
    } on FirebaseAuthException catch (e) {
      return ApiResponse.failure(
        code: e.code,
        message: _getErrorMessage(e.code),
      );
    } catch (e) {
      return ApiResponse.failure(
        message: 'Failed to send password reset email: ${e.toString()}',
      );
    }
  }

  /// Update user password
  /// 
  /// Updates the password for the current user.
  /// 
  /// Example:
  /// ```dart
  /// await service.updatePassword('newPassword123');
  /// ```
  Future<ApiResponse<void>> updatePassword(String newPassword) async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        return const ApiResponse.failure(
          message: 'No user is currently signed in.',
        );
      }

      await user.updatePassword(newPassword);
      return const ApiResponse.success(null);
    } on FirebaseAuthException catch (e) {
      return ApiResponse.failure(
        code: e.code,
        message: _getErrorMessage(e.code),
      );
    } catch (e) {
      return ApiResponse.failure(
        message: 'Failed to update password: ${e.toString()}',
      );
    }
  }

  /// Update user email
  /// 
  /// Updates the email for the current user.
  /// Note: This requires the user to be recently authenticated.
  /// 
  /// Example:
  /// ```dart
  /// await service.updateEmail('newemail@example.com');
  /// ```
  Future<ApiResponse<void>> updateEmail(String newEmail) async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        return const ApiResponse.failure(
          message: 'No user is currently signed in.',
        );
      }

      // Reload user to get latest data
      await user.reload();
      final updatedUser = _auth.currentUser;
      if (updatedUser != null) {
        // Note: updateEmail requires recent authentication
        // This is a placeholder - implement based on your needs
        return const ApiResponse.failure(
          message: 'Email update requires recent authentication. Please sign in again.',
        );
      }
      return const ApiResponse.failure(
        message: 'Failed to update email.',
      );
    } on FirebaseAuthException catch (e) {
      return ApiResponse.failure(
        code: e.code,
        message: _getErrorMessage(e.code),
      );
    } catch (e) {
      return ApiResponse.failure(
        message: 'Failed to update email: ${e.toString()}',
      );
    }
  }

  /// Delete the current user account
  /// 
  /// Permanently deletes the current user account.
  /// 
  /// Example:
  /// ```dart
  /// await service.deleteAccount();
  /// ```
  Future<ApiResponse<void>> deleteAccount() async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        return const ApiResponse.failure(
          message: 'No user is currently signed in.',
        );
      }

      await user.delete();
      return const ApiResponse.success(null);
    } on FirebaseAuthException catch (e) {
      return ApiResponse.failure(
        code: e.code,
        message: _getErrorMessage(e.code),
      );
    } catch (e) {
      return ApiResponse.failure(
        message: 'Failed to delete account: ${e.toString()}',
      );
    }
  }

  /// Re-authenticate user (required for sensitive operations)
  /// 
  /// Re-authenticates the user with their current credentials.
  /// 
  /// Example:
  /// ```dart
  /// await service.reauthenticate(
  ///   email: 'user@example.com',
  ///   password: 'password123',
  /// );
  /// ```
  Future<ApiResponse<void>> reauthenticate({
    required String email,
    required String password,
  }) async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        return const ApiResponse.failure(
          message: 'No user is currently signed in.',
        );
      }

      final credential = EmailAuthProvider.credential(
        email: email.trim(),
        password: password,
      );

      await user.reauthenticateWithCredential(credential);
      return const ApiResponse.success(null);
    } on FirebaseAuthException catch (e) {
      return ApiResponse.failure(
        code: e.code,
        message: _getErrorMessage(e.code),
      );
    } catch (e) {
      return ApiResponse.failure(
        message: 'Failed to re-authenticate: ${e.toString()}',
      );
    }
  }

  /// Get user-friendly error message from Firebase error code
  String _getErrorMessage(String code) {
    switch (code) {
      case 'user-not-found':
        return 'No user found with this username.';
      case 'wrong-password':
        return 'Incorrect password. Please try again.';
      case 'email-already-in-use':
      case 'username-exists':
        return 'This username is already taken. Please choose another one.';
      case 'weak-password':
        return 'The password is too weak. Please use a stronger password.';
      case 'invalid-email':
        return 'The username is invalid.';
      case 'user-disabled':
        return 'This account has been disabled.';
      case 'too-many-requests':
        return 'Too many requests. Please try again later.';
      case 'operation-not-allowed':
        return 'This operation is not allowed.';
      case 'requires-recent-login':
        return 'Please sign in again to complete this action.';
      case 'network-request-failed':
        return 'Network error. Please check your internet connection.';
      default:
        return 'An error occurred: $code';
    }
  }
}

