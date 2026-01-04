import 'package:foody/common_imports.dart';
import 'package:foody/presentation/order_details/order_details_view_model.dart';
import 'package:foody/presentation/order_details/widgets/delivery_section.dart';
import 'package:foody/presentation/order_details/widgets/order_canceled_message.dart';
import 'package:foody/presentation/order_details/widgets/order_details_empty_state.dart';
import 'package:foody/presentation/order_details/widgets/order_details_error_state.dart';
import 'package:foody/presentation/order_details/widgets/order_info_card.dart';
import 'package:foody/presentation/order_details/widgets/order_items_section.dart';
import 'package:foody/presentation/order_details/widgets/order_progress_stepper.dart';
import 'package:foody/presentation/order_details/widgets/payment_section.dart';
import 'package:foody/presentation/order_details/widgets/review_section.dart';
import 'package:foody/shared/widgets/app_bar/custom_app_bar.dart';

class OrderDetailsScreen extends StatelessWidget {
  final String orderId;

  const OrderDetailsScreen({
    super.key,
    required this.orderId,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = S.current;
    return ChangeNotifierProvider(
      create: (_) => OrderDetailsViewModel()..loadOrderDetails(orderId),
      child: Scaffold(
        appBar: CustomAppBar(
          title: l10n.ordersOrderDetails,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: AppColors.textPrimary),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Consumer<OrderDetailsViewModel>(
          builder: (context, viewModel, _) {
            return ApiResponseBuilder<OrderDetails>(
              apiResponse: viewModel.orderDetailsResponse,
              onSuccess: (orderDetails) => _buildOrderDetails(context, orderDetails, viewModel),
              onError: (message) => OrderDetailsErrorState(
                message: message,
                orderId: orderId,
              ),
              loading: Center(
                child: CircularProgressIndicator(
                  color: AppColors.iconBrand,
                ),
              ),
              empty: const OrderDetailsEmptyState(),
            );
          },
        ),
      ),
    );
  }

  Widget _buildOrderDetails(BuildContext context, OrderDetails orderDetails, OrderDetailsViewModel viewModel) {
    final l10n = S.current;
    final order = orderDetails.order;
    final isCanceled = order.orderStatus == OrderStatus.canceled;

    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Order Info Card
          OrderInfoCard(orderDetails: orderDetails),
          GapH(24.h),

          // Order Progress Stepper (only show if not canceled)
          if (!isCanceled) ...[
            OrderProgressStepper(
              orderDetails: orderDetails,
              viewModel: viewModel,
            ),
            GapH(24.h),
          ] else ...[
            const OrderCanceledMessage(),
            GapH(24.h),
          ],

          // Order Items
          OrderItemsSection(orderDetails: orderDetails),
          GapH(24.h),

          // Payment Info
          if (orderDetails.payment != null)
            PaymentSection(payment: orderDetails.payment!),
          if (orderDetails.payment != null) GapH(24.h),

          // Delivery Info
          if (orderDetails.delivery != null)
            DeliverySection(orderDetails: orderDetails),
          if (orderDetails.delivery != null) GapH(24.h),

          // Review Section (only for delivered orders)
          if (orderDetails.order.orderStatus == OrderStatus.delivered)
            ReviewSection(
              orderDetails: orderDetails,
              viewModel: viewModel,
            ),

          GapH(30.h)
        ],
      ),
    );
  }
}
