const serverErrorCodes = [400, 401, 403, 404];
const successCodes = [200, 201];
const unhandledCodes = [500, 429];

/// Enum representing different API response code categories
enum ApiResponseCode {
  /// Server error codes (400, 401, 403, 404)
  serverError(serverErrorCodes),

  /// Success codes (200, 201)
  success(successCodes),

  /// Unhandled error codes (500, 429)
  unhandled(unhandledCodes);

  const ApiResponseCode(this.codes);

  /// Creates an ApiResponseCode from an HTTP status code
  factory ApiResponseCode.fromCode(int code) {
    return values.firstWhere(
      (e) => e.codes.contains(code),
      orElse: () => ApiResponseCode.unhandled,
    );
  }

  /// List of HTTP status codes for this category
  final List<int> codes;
}
