import 'package:foody/common_imports.dart';
import 'package:foody/data/model/restaurant/restaurant.dart';

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;
  final VoidCallback onTap;

  const RestaurantCard({
    super.key,
    required this.restaurant,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppClickableContainer(
      config: ClickableContainerConfig.enabled(onTap: onTap),
      style: ClickableContainerStyle.withShadows(
        color: AppColors.bgSurface,
        borderRadius: BorderRadius.circular(12.r),
        padding: EdgeInsets.zero,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Restaurant Image
          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
              child: AppNetworkImage(
                config: AppImageConfig.fullWidth(
                  imageUrl: restaurant.imageUrl,
                  height: double.infinity,
                ),
              ),
            ),
          ),
          // Restaurant Info
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                    restaurant.name,
                    typography: AppTypography.bodyMediumSemiBold,
                    color: AppColors.textPrimary,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  GapH(3.h),
                  AppText(
                    restaurant.cuisineType,
                    typography: AppTypography.bodySmallRegular,
                    color: AppColors.textSecondaryAlt,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  GapH(3.h),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 12.w,
                        color: AppColors.star,
                      ),
                      GapW(3.w),
                      AppText(
                        restaurant.rating.toStringAsFixed(1),
                        typography: AppTypography.bodySmallMedium,
                        color: AppColors.textPrimary,
                      ),
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
