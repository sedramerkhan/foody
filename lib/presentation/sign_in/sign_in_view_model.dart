import 'package:flutter/foundation.dart';
import 'package:foody/core/base/view_model/base_view_model.dart';
import 'package:foody/core/api_response/api_response_state/api_response_state.dart';
import 'package:foody/data/repo/auth_repo.dart';

/// View model for sign-in screen
class SignInViewModel extends BaseViewModel {
  final AuthRepo _authRepo = AuthRepo();

  final ValueNotifier<ApiResponse<Map<String, dynamic>>> signInResponse =
      ValueNotifier(const ApiResponse.none());


  /// Sign in with username and password
  Future<ApiResponse> signIn({
    required String username,
    required String password,
  }) async {
    notifyListeners();

    signInResponse.value = const ApiResponse.loading();

    final response = await _authRepo.signIn(
      username: username,
      password: password,
    );

    signInResponse.value = ApiResponse.success({});
    return signInResponse.value;
  }

  @override
  void dispose() {
    signInResponse.dispose();
    super.dispose();
  }
}


