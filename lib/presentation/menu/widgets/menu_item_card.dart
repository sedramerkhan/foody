import 'package:foody/common_imports.dart';
import 'package:foody/data/model/menu/menu.dart';

class MenuItemCard extends StatelessWidget {
  final Menu menuItem;
  final VoidCallback onTap;
  final VoidCallback? onAddToCart;

  const MenuItemCard({
    super.key,
    required this.menuItem,
    required this.onTap,
    this.onAddToCart,
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Menu Item Image
          ClipRRect(
            borderRadius: BorderRadius.horizontal(left: Radius.circular(12.r)),
            child: AppNetworkImage(
              config: AppImageConfig.square(
                imageUrl: menuItem.imageUrl,
                size: 100.w,
              ),
            ),
          ),
          // Menu Item Info
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: AppText(
                          menuItem.itemName,
                          typography: AppTypography.bodyMediumSemiBold,
                          color: AppColors.textPrimary,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (!menuItem.availabilityStatus)
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 6.w,
                            vertical: 3.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.bgFillErrorAlt,
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          child: AppText(
                            'Unavailable',
                            typography: AppTypography.bodyXSmallSemiBold,
                            color: AppColors.textError,
                          ),
                        ),
                    ],
                  ),
                  GapH(3.h),
                  AppText(
                    menuItem.description,
                    typography: AppTypography.bodySmallRegular,
                    color: AppColors.textSecondaryAlt,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  GapH(6.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        '\$${menuItem.price.toStringAsFixed(2)}',
                        typography: AppTypography.bodyMediumSemiBold,
                        color: AppColors.textBrand,
                      ),
                      if (menuItem.availabilityStatus)
                        IconButton(
                          icon: Icon(
                            Icons.add_circle_outline,
                            color: AppColors.iconBrand,
                            size: 22.w,
                          ),
                          onPressed: onAddToCart,
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
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
                      SkeletonHelper.line(height: 22.h, maxLength: 25.w),
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
