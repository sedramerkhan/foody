import 'package:foody/common_imports.dart';

class MenuNoRestaurantState extends StatelessWidget {
  const MenuNoRestaurantState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.restaurant_menu_outlined,
              size: 56.w,
              color: AppColors.iconPrimaryAlt,
            ),
            GapH(12.h),
            AppText(
              'No restaurant selected',
              typography: AppTypography.headingSmallBold,
              color: AppColors.textPrimary,
            ),
            GapH(6.h),
            AppText(
              'Please select a restaurant to view menu',
              typography: AppTypography.bodyMediumRegular,
              color: AppColors.textSecondaryAlt,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

