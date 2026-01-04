import 'package:foody/common_imports.dart';
import 'package:foody/presentation/review/review_view_model.dart';
import 'package:foody/presentation/review/widgets/review_pager_view.dart';
import 'package:foody/shared/utils/auto_layout/screen_size.dart';

/// Show review bottom sheet
Future<bool?> showReviewBottomSheet(BuildContext context, String orderId) async {
  return await showModalBottomSheet<bool>(
    context: context,
    constraints: BoxConstraints(minWidth: ScreenSize.getWidth(context)),
    useRootNavigator: true,
    backgroundColor: AppColors.bgSurface,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
    ),
    isScrollControlled: true,
    isDismissible: false,
    builder: (BuildContext context) {
      return ChangeNotifierProvider(
        create: (_) => ReviewViewModel(orderId),
        child: SafeArea(
          child: Padding(
            padding: MediaQuery.of(context).viewInsets, // for keyboard
            child: Container(
              height: 450.h,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: const ReviewPagerView(),
            ),
          ),
        ),
      );
    },
  );
}

