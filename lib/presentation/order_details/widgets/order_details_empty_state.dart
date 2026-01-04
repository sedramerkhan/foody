import 'package:foody/common_imports.dart';

class OrderDetailsEmptyState extends StatelessWidget {
  const OrderDetailsEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = S.current;
    return Center(
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_bag_outlined,
              size: 64.w,
              color: AppColors.textSecondaryAlt,
            ),
            GapH(16.h),
            AppText(
              l10n.ordersOrderNotFound,
              typography: AppTypography.bodyMediumRegular,
              color: AppColors.textPrimary,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

