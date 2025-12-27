import 'package:freezed_annotation/freezed_annotation.dart';

part 'server_error.g.dart';
part 'server_error.freezed.dart';

@freezed
abstract class ServerError with _$ServerError {
  const ServerError._();

  factory ServerError({
    String? code,
    String? message,
  }) = _ServerError;

  factory ServerError.fromJson(Map<String, dynamic> json) =>
      _$ServerErrorFromJson(json);
}

