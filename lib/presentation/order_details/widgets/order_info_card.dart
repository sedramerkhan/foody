import 'package:foody/common_imports.dart';
import 'package:foody/presentation/order_details/order_details_view_model.dart';
import 'package:intl/intl.dart';

class OrderInfoCard extends StatelessWidget {
  final OrderDetails orderDetails;

  const OrderInfoCard({
    super.key,
    required this.orderDetails,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = S.current;
    final order = orderDetails.order;
    final restaurant = orderDetails.restaurant;
    final dateFormat = DateFormat('MMM dd, yyyy • HH:mm');

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: AppText(
                  l10n.ordersOrderNumber,
                  typography: AppTypography.bodySmallRegular,
                  color: AppColors.textSecondaryAlt,
                ),
              ),
              AppText(
                '#${order.orderId.substring(order.orderId.length - 8)}',
                typography: AppTypography.bodyMediumSemiBold,
                color: AppColors.textPrimary,
              ),
            ],
          ),
          GapH(12.h),
          if (restaurant != null) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: AppText(
                    l10n.ordersRestaurant,
                    typography: AppTypography.bodySmallRegular,
                    color: AppColors.textSecondaryAlt,
                  ),
                ),
                Expanded(
                  child: AppText(
                    restaurant.name,
                    typography: AppTypography.bodyMediumSemiBold,
                    color: AppColors.textPrimary,
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
            GapH(12.h),
          ],
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: AppText(
                  l10n.ordersDate,
                  typography: AppTypography.bodySmallRegular,
                  color: AppColors.textSecondaryAlt,
                ),
              ),
              AppText(
                dateFormat.format(order.createdAt),
                typography: AppTypography.bodyMediumRegular,
                color: AppColors.textPrimary,
              ),
            ],
          ),
          GapH(12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: AppText(
                  l10n.ordersTotal,
                  typography: AppTypography.bodySmallRegular,
                  color: AppColors.textSecondaryAlt,
                ),
              ),
              AppText(
                '\$${order.totalAmount.toStringAsFixed(2)}',
                typography: AppTypography.headingSmallBold,
                color: AppColors.textBrand,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

