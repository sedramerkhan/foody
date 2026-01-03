import 'package:foody/common_imports.dart';

class CartEmptyState extends StatelessWidget {
  const CartEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = S.current;
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
                  l10n.cartYourCartIsEmpty,
                  typography: AppTypography.headingSmallBold,
                  color: AppColors.textPrimary,
                ),
                GapH(6.h),
                AppText(
                  l10n.cartAddItemsFromMenu,
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

