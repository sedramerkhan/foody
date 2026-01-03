import 'package:foody/core/api_response/api_response_state/api_response_state.dart';

/// Extension methods for ApiResponse to simplify usage and reduce boilerplate
extension ApiResponseExtensions<T> on ApiResponse<T> {
  /// Extract data from success response, or return null
  T? getDataOrNull() {
    return when(
      success: (data) => data,
      failure: (_, __) => null,
      loading: () => null,
      none: () => null,
    );
  }

  /// Check if response is success
  bool get isSuccess => this is Success<T>;

  /// Check if response is failure
  bool get isFailure => this is Failure;

  /// Check if response is loading
  bool get isLoading => this is Loading;

  /// Check if response is none
  bool get isNone => this is None;

  /// Transform success data to a new type
  ApiResponse<R> mapData<R>(R Function(T?) mapper) {
    return when(
      success: (data) => ApiResponse.success(mapper(data)),
      failure: (code, message) => ApiResponse.failure(code: code, message: message),
      loading: () => const ApiResponse.loading(),
      none: () => const ApiResponse.none(),
    );
  }

  /// Functional fold operation - transform ApiResponse to any type R
  R fold<R>({
    required R Function(T?) onSuccess,
    required R Function(String, String) onFailure,
    R Function()? onLoading,
    R Function()? onNone,
  }) {
    return when(
      success: onSuccess,
      failure: onFailure,
      loading: onLoading ?? () => onFailure('', 'Loading'),
      none: onNone ?? () => onFailure('', 'None'),
    );
  }

  /// Get data or throw exception if not success
  T getOrThrow() {
    return when(
      success: (data) {
        if (data == null) {
          throw Exception('ApiResponse success but data is null');
        }
        return data;
      },
      failure: (code, message) => throw Exception('ApiResponse failure: $code - $message'),
      loading: () => throw Exception('ApiResponse is loading'),
      none: () => throw Exception('ApiResponse is none'),
    );
  }

  /// Get data or return default value
  T getOrDefault(T defaultValue) {
    return getDataOrNull() ?? defaultValue;
  }

  /// Execute callback if success
  ApiResponse<T> onSuccess(void Function(T?) callback) {
    if (isSuccess) {
      callback(getDataOrNull());
    }
    return this;
  }

  /// Execute callback if failure
  ApiResponse<T> onFailure(void Function(String, String) callback) {
    if (isFailure) {
      final failure = this as Failure;
      callback(failure.code, failure.message);
    }
    return this;
  }
}
