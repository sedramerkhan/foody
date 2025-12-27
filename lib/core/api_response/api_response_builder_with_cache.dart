import 'package:flutter/widgets.dart';
import 'package:foody/shared/utils/session_expired_util.dart';

import 'api_response_state/api_response_state.dart';
import 'no_data/try_again_widget.dart';

class ApiResponseBuilderWithCache<T, R> extends StatelessWidget {
  const ApiResponseBuilderWithCache({
    super.key,
    required this.apiResponse,
    required this.dataViewer,
    required this.loading,
    required this.cachedData,
    this.onError,
    this.empty,
    this.emptyLoading,
    this.handleError = true, //in home handle error for currency only
    this.onTryAgain,
  });

  final ValueNotifier<ApiResponse<R>> apiResponse;
  final Widget Function(T) dataViewer;
  final Widget? empty;
  final Widget Function(String)? onError;
  final Widget loading;
  final Widget? emptyLoading;
  final ValueNotifier<T?> cachedData;
  final Function()? onTryAgain;

  /// This is to handle error for one api only in each screen
  final bool handleError;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: apiResponse,
      builder: (context, value, child) => Stack(
        children: [
          ///Data
          _buildCachedDataListenable((isCacheEmpty, cached) {
            if (isCacheEmpty) {
              // Don't show empty widget when loading or when error occurs (error will be shown separately)
              if (value is Loading || value is Failure) {
                return const SizedBox();
              }
              return empty ?? const SizedBox();
            } else {
              return dataViewer(cached!);
            }
          }),
          value.when(
            success: (data) {
              return const SizedBox();
            },
            loading: () => _buildCachedDataListenable((isCacheEmpty, cached) {
              return isCacheEmpty ? emptyLoading ?? loading : loading;
            }),
            failure: (code, message) {
              return _buildCachedDataListenable((isCacheEmpty, cached) {
                // Show error widget when cache is empty (first load error)
                // or when we have cached data but got an error
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (handleError) {
                    if (!SessionExpireUtils.checkSessionExpired(code) && !isCacheEmpty) {
                      // Show toast notification for non-session errors when cache exists
                      // TODO: Implement ToastUtil.showErrorToast(context, message);
                    }
                  }
                });

                if (handleError) {
                  return _onErrorWidget(message);
                }
                return const SizedBox.shrink();
              });
            },
            none: () => const SizedBox(),
          ),
        ],
      ),
    );
  }

  Widget _onErrorWidget(String message) {
    return onError != null
        ? onError!(message)
        : TryAgain(message: message, onTapButton: onTryAgain);
  }

  Widget _buildCachedDataListenable(Function(bool, T?) child) {
    return ValueListenableBuilder(
      valueListenable: cachedData,
      builder: (context, cached, _) {
        final isCacheEmpty =
            cached == null || (cached is List && (cached as List).isEmpty);
        return child(isCacheEmpty, cached);
      },
    );
  }
}
