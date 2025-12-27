import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_response_state.freezed.dart';

@freezed
abstract class ApiResponse<T> with _$ApiResponse<T> {
  const factory ApiResponse.success(T? data) = Success;

  const factory ApiResponse.loading() = Loading;

  const factory ApiResponse.failure({
    @Default("") String code,
    @Default("unknown") String message,
  }) = Failure;

  const factory ApiResponse.none() = None;
}
