import 'package:foody/common_imports.dart';

class DeliveryTimeSection extends StatelessWidget {
  final int estimatedTime;
  final ValueChanged<int> onTimeChanged;

  const DeliveryTimeSection({
    super.key,
    required this.estimatedTime,
    required this.onTimeChanged,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = S.current;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppText(
          l10n.checkoutEstimatedDeliveryTime,
          typography: AppTypography.headingSmallBold,
          color: AppColors.textPrimary,
        ),
        GapH(12.h),
        Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: AppColors.bgSurfaceSecondary,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
            children: [
              Icon(
                Icons.access_time,
                size: 24.w,
                color: AppColors.iconBrand,
              ),
              GapW(12.w),
              Expanded(
                child: AppText(
                  l10n.checkoutMinutes(estimatedTime),
                  typography: AppTypography.bodyMediumSemiBold,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

