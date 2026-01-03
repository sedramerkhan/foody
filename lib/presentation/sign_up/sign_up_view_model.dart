import 'package:flutter/foundation.dart';
import 'package:foody/core/base/view_model/base_view_model.dart';
import 'package:foody/core/api_response/api_response_state/api_response_state.dart';
import 'package:foody/data/repo/auth_repo.dart';

/// View model for sign-up screen
class SignUpViewModel extends BaseViewModel {
  final AuthRepo _authRepo = AuthRepo();

  final ValueNotifier<ApiResponse<Map<String, dynamic>>> signUpResponse =
      ValueNotifier(const ApiResponse.none());

  /// Sign up with username, email, password, and user information
  Future<ApiResponse> signUp({
    required String username,
    required String email,
    required String password,
    String? phone,
    String? address,
  }) async {
    print('[SIGN_UP_VIEW_MODEL] Sign-up started');
    print('[SIGN_UP_VIEW_MODEL] Username: $username');
    print('[SIGN_UP_VIEW_MODEL] Email: $email');
    print('[SIGN_UP_VIEW_MODEL] Phone: $phone');
    print('[SIGN_UP_VIEW_MODEL] Address: $address');
    
    notifyListeners();

    print('[SIGN_UP_VIEW_MODEL] Setting response to loading');
    signUpResponse.value = const ApiResponse.loading();

    print('[SIGN_UP_VIEW_MODEL] Calling authRepo.signUp');
    final response = await _authRepo.signUp(
      username: username,
      email: email,
      password: password,
      phone: phone,
      address: address,
    );

    print('[SIGN_UP_VIEW_MODEL] Response received: ${response.runtimeType}');
    response.when(
      success: (data) => print('[SIGN_UP_VIEW_MODEL] Success: $data'),
      failure: (code, message) => print('[SIGN_UP_VIEW_MODEL] Failure: $code - $message'),
      loading: () => print('[SIGN_UP_VIEW_MODEL] Still loading...'),
      none: () => print('[SIGN_UP_VIEW_MODEL] None state'),
    );

    print('[SIGN_UP_VIEW_MODEL] Setting signUpResponse.value');
    signUpResponse.value = response;
    print('[SIGN_UP_VIEW_MODEL] Sign-up completed');
    return response;
  }

  @override
  void dispose() {
    signUpResponse.dispose();
    super.dispose();
  }
}

