import 'package:foody/common_imports.dart';
import 'package:intl/intl.dart';

class PaymentSection extends StatelessWidget {
  final Payment payment;

  const PaymentSection({
    super.key,
    required this.payment,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = S.current;
    final dateFormat = DateFormat('MMM dd, yyyy • HH:mm');

    String getPaymentMethodText() {
      switch (payment.paymentMethod) {
        case PaymentMethod.card:
          return l10n.checkoutCard;
        case PaymentMethod.paypal:
          return l10n.checkoutPayPal;
        case PaymentMethod.cash:
          return l10n.checkoutCashOnDelivery;
      }
    }

    String getPaymentStatusText() {
      switch (payment.paymentStatus) {
        case PaymentStatus.pending:
          return l10n.ordersPaymentPending;
        case PaymentStatus.completed:
          return l10n.ordersPaymentCompleted;
        case PaymentStatus.failed:
          return l10n.ordersPaymentFailed;
        case PaymentStatus.refunded:
          return l10n.ordersPaymentRefunded;
      }
    }

    Color getPaymentStatusColor() {
      switch (payment.paymentStatus) {
        case PaymentStatus.pending:
          return Colors.orange;
        case PaymentStatus.completed:
          return Colors.green;
        case PaymentStatus.failed:
          return Colors.red;
        case PaymentStatus.refunded:
          return Colors.grey;
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
            l10n.ordersPaymentInfo,
            typography: AppTypography.headingSmallBold,
            color: AppColors.textPrimary,
          ),
          GapH(12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                l10n.ordersPaymentMethod,
                typography: AppTypography.bodySmallRegular,
                color: AppColors.textSecondaryAlt,
              ),
              AppText(
                getPaymentMethodText(),
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
                l10n.ordersPaymentStatus,
                typography: AppTypography.bodySmallRegular,
                color: AppColors.textSecondaryAlt,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: getPaymentStatusColor().withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: AppText(
                  getPaymentStatusText(),
                  typography: AppTypography.bodySmallMedium,
                  color: getPaymentStatusColor(),
                ),
              ),
            ],
          ),
          if (payment.paidAt != null) ...[
            GapH(12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  l10n.ordersPaidAt,
                  typography: AppTypography.bodySmallRegular,
                  color: AppColors.textSecondaryAlt,
                ),
                AppText(
                  dateFormat.format(payment.paidAt!),
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

