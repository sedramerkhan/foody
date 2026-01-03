import 'package:foody/common_imports.dart';

class OrdersComingSoon extends StatelessWidget {
  const OrdersComingSoon({super.key});

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
              Icons.receipt_long_outlined,
              size: 56.w,
              color: AppColors.iconPrimaryAlt,
            ),
                GapH(12.h),
                AppText(
                  l10n.ordersComingSoon,
                  typography: AppTypography.headingMediumBold,
                  color: AppColors.textPrimary,
                ),
                GapH(6.h),
                AppText(
                  l10n.ordersOrderHistoryWillAppearHere,
                  typography: AppTypography.bodyMediumRegular,
                  color: AppColors.textSecondaryAlt,
                ),
          ],
        ),
      ),
    );
  }
}

