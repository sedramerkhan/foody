import 'package:foody/common_imports.dart';

class CartEmptyState extends StatelessWidget {
  const CartEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_cart_outlined,
              size: 56.w,
              color: AppColors.iconPrimaryAlt,
            ),
            GapH(12.h),
            AppText(
              'Your cart is empty',
              typography: AppTypography.headingSmallBold,
              color: AppColors.textPrimary,
            ),
            GapH(6.h),
            AppText(
              'Add items from the menu to get started',
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

