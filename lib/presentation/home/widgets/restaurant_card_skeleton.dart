import 'package:foody/common_imports.dart';

class RestaurantCardSkeleton extends StatelessWidget {
  const RestaurantCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppClickableContainer(
      config: ClickableContainerConfig.disabled(),
      style: ClickableContainerStyle.withShadows(
        color: AppColors.bgSurface,
        borderRadius: BorderRadius.circular(12.r),
        padding: EdgeInsets.zero,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: SkeletonHelper.image(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SkeletonHelper.line(height: 14.h, maxLength: 120.w),
                  GapH(6.h),
                  SkeletonHelper.line(height: 11.h, maxLength: 80.w),
                  GapH(6.h),
                  SkeletonHelper.line(height: 11.h, maxLength: 60.w),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

