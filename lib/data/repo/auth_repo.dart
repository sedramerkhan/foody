import 'package:foody/core/base/repository/base_repo.dart';
import 'package:foody/core/api_response/api_response_state/api_response_state.dart';
import 'package:foody/data/api_end_point.dart';

/// Repository for authentication operations
class AuthRepo extends BaseRepository {
  /// Sign in with username and password
  Future<ApiResponse<Map<String, dynamic>>> signIn({
    required String username,
    required String password,
  }) async {
    return await postData<Map<String, dynamic>>(
      path: ApiEndPoint.signIn,
      body: {
        'username': username,
        'password': password,
      },
      deserializer: (json) => json,
      callBack: (data) {
        print("data is $data");
        ///save token to local storage
      },
    );
  }
}

