import 'package:foody/common_imports.dart';

class OrdersEmptyState extends StatelessWidget {
  final String message;

  const OrdersEmptyState({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(32.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.receipt_long_outlined,
              size: 64.w,
              color: AppColors.iconBrand,
            ),
            GapH(16.h),
            AppText(
              message,
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

