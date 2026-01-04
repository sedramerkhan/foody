import 'package:foody/common_imports.dart';
import 'package:foody/presentation/order_details/order_details_view_model.dart';

class DeliverySection extends StatelessWidget {
  final OrderDetails orderDetails;

  const DeliverySection({
    super.key,
    required this.orderDetails,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = S.current;
    final delivery = orderDetails.delivery!;
    final driver = orderDetails.driver;

    String getDeliveryStatusText() {
      switch (delivery.deliveryStatus) {
        case DeliveryStatus.assigned:
          return l10n.ordersDeliveryAssigned;
        case DeliveryStatus.onTheWay:
          return l10n.ordersDeliveryOnTheWay;
        case DeliveryStatus.delivered:
          return l10n.ordersDeliveryDelivered;
      }
    }

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.bgSurfaceSecondary,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: AppColors.borderPrimary,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            l10n.ordersDeliveryInfo,
            typography: AppTypography.headingSmallBold,
            color: AppColors.textPrimary,
          ),
          GapH(12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                l10n.ordersDeliveryStatus,
                typography: AppTypography.bodySmallRegular,
                color: AppColors.textSecondaryAlt,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: AppText(
                  getDeliveryStatusText(),
                  typography: AppTypography.bodySmallMedium,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          if (driver != null) ...[
            GapH(12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  l10n.ordersDriver,
                  typography: AppTypography.bodySmallRegular,
                  color: AppColors.textSecondaryAlt,
                ),
                AppText(
                  driver.name,
                  typography: AppTypography.bodyMediumSemiBold,
                  color: AppColors.textPrimary,
                ),
              ],
            ),
            GapH(12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  l10n.ordersDriverPhone,
                  typography: AppTypography.bodySmallRegular,
                  color: AppColors.textSecondaryAlt,
                ),
                AppText(
                  driver.phone,
                  typography: AppTypography.bodyMediumRegular,
                  color: AppColors.textPrimary,
                ),
              ],
            ),
          ],
          if (delivery.estimatedTime != null) ...[
            GapH(12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  l10n.ordersEstimatedTime,
                  typography: AppTypography.bodySmallRegular,
                  color: AppColors.textSecondaryAlt,
                ),
                AppText(
                  '${delivery.estimatedTime} ${l10n.ordersMinutes}',
                  typography: AppTypography.bodyMediumRegular,
                  color: AppColors.textPrimary,
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

