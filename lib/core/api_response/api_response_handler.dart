import 'package:flutter/material.dart';
import 'package:foody/core/theme/color/app_colors.dart';
import 'package:foody/shared/utils/session_expired_util.dart';
import 'package:foody/shared/widgets/text/app_text.dart';
import 'api_response_state/api_response_state.dart';

class ApiResponseHandler {
  static Future<void> handle<T>({
    required BuildContext context,
    required ApiResponse<T> result,
    required Function(T) onSuccess,
    Function()? onError,
  }) async {
    switch (result) {
      case Failure():
        onError?.call();
        if (!await SessionExpireUtils.handleByCode(result.code)) {
          if (context.mounted) {
            // TODO: Implement ToastUtil.showErrorToast(context, result.message);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: AppText(
                  result.message,
                  color: AppColors.textError,
                ),
                backgroundColor: AppColors.bgFillErrorAlt,
              ),
            );
          }
        }
      case Success():
        onSuccess(result.data as T);
      default:
        break;
    }
  }

  static Future<void> checkFailure({
    required BuildContext context,
    required ApiResponse result,
    Function()? onError,
  }) async {
    if (result is Failure) {
      if (!await SessionExpireUtils.handleByCode(result.code)) {
        onError?.call();
        if (!context.mounted) return;
        // TODO: Implement ToastUtil.showErrorToast(context, result.message);
      }
    }
  }
}
