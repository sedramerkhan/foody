import 'package:foody/common_imports.dart';
import 'package:foody/presentation/orders/orders_view_model.dart';
import 'package:foody/data/model/order/order.dart';
import 'package:foody/data/model/delivery/delivery.dart';
import 'package:intl/intl.dart';

class OrderCard extends StatelessWidget {
  final OrderWithDelivery orderWithDelivery;

  const OrderCard({
    super.key,
    required this.orderWithDelivery,
  });

  String _getOrderStatusText(OrderStatus status, BuildContext context) {
    final l10n = S.current;
    switch (status) {
      case OrderStatus.pending:
        return l10n.ordersOrderPlaced;
      case OrderStatus.confirmed:
        return l10n.ordersOrderConfirmed;
      case OrderStatus.delivered:
        return l10n.ordersOrderDelivered;
      case OrderStatus.canceled:
        return l10n.ordersOrderCanceled;
    }
  }

  String _getDeliveryStatusText(DeliveryStatus? status, BuildContext context) {
    final l10n = S.current;
    if (status == null) return '';
    switch (status) {
      case DeliveryStatus.assigned:
        return l10n.ordersDeliveryAssigned;
      case DeliveryStatus.onTheWay:
        return l10n.ordersDeliveryOnTheWay;
      case DeliveryStatus.delivered:
        return l10n.ordersDeliveryDelivered;
    }
  }

  Color _getStatusColor(OrderStatus status) {
    switch (status) {
      case OrderStatus.pending:
        return Colors.orange;
      case OrderStatus.confirmed:
        return Colors.blue;
      case OrderStatus.delivered:
        return Colors.green;
      case OrderStatus.canceled:
        return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = S.current;
    final order = orderWithDelivery.order;
    final delivery = orderWithDelivery.delivery;
    final dateFormat = DateFormat('MMM dd, yyyy • HH:mm');

    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
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
          // Order ID and Date
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: AppText(
                  '#${order.orderId.substring(order.orderId.length - 8)}',
                  typography: AppTypography.bodyMediumSemiBold,
                  color: AppColors.textPrimary,
                ),
              ),
              AppText(
                dateFormat.format(order.createdAt),
                typography: AppTypography.bodySmallRegular,
                color: AppColors.textSecondaryAlt,
              ),
            ],
          ),
          GapH(12.h),
          // Order Status
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: _getStatusColor(order.orderStatus).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: AppText(
                  _getOrderStatusText(order.orderStatus, context),
                  typography: AppTypography.bodySmallMedium,
                  color: _getStatusColor(order.orderStatus),
                ),
              ),
              if (delivery != null) ...[
                GapW(8.w),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: AppText(
                    _getDeliveryStatusText(delivery.deliveryStatus, context),
                    typography: AppTypography.bodySmallMedium,
                    color: Colors.blue,
                  ),
                ),
              ],
            ],
          ),
          GapH(12.h),
          Divider(color: AppColors.borderPrimary),
          GapH(12.h),
          // Total Amount
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                l10n.ordersTotal,
                typography: AppTypography.bodyMediumRegular,
                color: AppColors.textSecondaryAlt,
              ),
              AppText(
                '\$${order.totalAmount.toStringAsFixed(2)}',
                typography: AppTypography.bodyMediumSemiBold,
                color: AppColors.textBrand,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

