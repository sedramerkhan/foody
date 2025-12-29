import 'package:foody/common_imports.dart';

class MenuItemCardSkeleton extends StatelessWidget {
  const MenuItemCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppClickableContainer(
      config: ClickableContainerConfig.disabled(),
      style: ClickableContainerStyle.withShadows(
        color: AppColors.bgSurface,
        borderRadius: BorderRadius.circular(12.r),
        padding: EdgeInsets.zero,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SkeletonHelper.image(
            width: 100.w,
            height: 100.w,
            borderRadius: BorderRadius.horizontal(left: Radius.circular(12.r)),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SkeletonHelper.line(height: 14.h, maxLength: 150.w),
                  GapH(6.h),
                  SkeletonHelper.line(height: 11.h, maxLength: 200.w),
                  GapH(6.h),
                  SkeletonHelper.line(height: 11.h, maxLength: 100.w),
                  GapH(6.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SkeletonHelper.line(height: 14.h, maxLength: 60.w),
                      SkeletonHelper.line(height: 22.h, maxLength: 22.w),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

