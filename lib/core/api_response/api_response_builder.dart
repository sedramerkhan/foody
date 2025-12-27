import 'package:flutter/material.dart';
import 'package:foody/shared/utils/session_expired_util.dart';

import 'api_response_state/api_response_state.dart';
import 'no_data/try_again_widget.dart';

class ApiResponseBuilder<T> extends StatelessWidget {
  const ApiResponseBuilder({
    super.key,
    required this.apiResponse,
    required this.onSuccess,
    required this.loading,
    this.onError,
    this.empty,
    this.onTryAgain,
  });

  final ValueNotifier<ApiResponse<T>> apiResponse;
  final Widget Function(T) onSuccess;
  final Widget? empty;
  final Widget Function(String)? onError;
  final Function()? onTryAgain;
  final Widget loading;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: apiResponse,
        builder: (context, value, child) {
          return value.when(
            success: (data) {
              // Check if data is null or empty list
              if (data == null || (data is List && data.isEmpty)) {
                return empty ?? const SizedBox();
              }
              return onSuccess(data);
            },
            loading: () => loading,
            failure: (code, message) {
              SessionExpireUtils.handleByCode(code);
              return _onErrorWidget(message);
            },
            none: () => const SizedBox(),
          );
        });
  }

  Widget _onErrorWidget(String message) {
    return onError != null
        ? onError!(message)
        : TryAgain(
            message: message,
            onTapButton: onTryAgain,
          );
  }
}
