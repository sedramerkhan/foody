import 'package:foody/common_imports.dart';
import 'package:foody/core/api_response/no_data/try_again_widget.dart';
import 'package:foody/presentation/orders/orders_view_model.dart';
import 'package:foody/presentation/orders/widgets/order_card.dart';
import 'package:foody/presentation/orders/widgets/orders_empty_state.dart';

/// Widget for displaying orders tab content with refresh functionality
class OrdersTabContent extends StatelessWidget {
  final OrdersViewModel viewModel;
  final List<OrderWithDelivery> Function() getOrders;
  final String emptyMessage;

  const OrdersTabContent({
    super.key,
    required this.viewModel,
    required this.getOrders,
    required this.emptyMessage,
  });

  @override
  Widget build(BuildContext context) {
    return _buildOrdersTab(context, viewModel, getOrders, emptyMessage);
  }

  /// Build order list widget for a given list of orders
  Widget _buildOrderList(
    BuildContext context,
    List<OrderWithDelivery> orders,
    String emptyMessage,
  ) {
    if (orders.isEmpty) {
      return SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height - 200,
          child: Center(
            child: OrdersEmptyState(
              message: emptyMessage,
            ),
          ),
        ),
      );
    }

    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.all(16.w),
      itemCount: orders.length,
      itemBuilder: (context, index) {
        return OrderCard(
          orderWithDelivery: orders[index],
        );
      },
    );
  }

  /// Build orders tab content using ApiResponseBuilder
  Widget _buildOrdersTab(
    BuildContext context,
    OrdersViewModel viewModel,
    List<OrderWithDelivery> Function() getOrders,
    String emptyMessage,
  ) {
    return RefreshIndicator(
      onRefresh: () async {
        await viewModel.refreshOrders();
      },
      child: ApiResponseBuilder<List<OrderWithDelivery>>(
        apiResponse: viewModel.ordersResponse,
        loading: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 200,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
        onSuccess: (allOrders) {
          final filteredOrders = getOrders();
          return _buildOrderList(context, filteredOrders, emptyMessage);
        },
        onError: (message) => SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 200,
            child: TryAgain(
              message: message,
              icon: Icon(
                Icons.error_outline,
                size: 64.w,
                color: AppColors.textError,
              ),
              onTapButton: () => viewModel.loadOrders(),
            ),
          ),
        ),
        empty: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 200,
            child: Center(
              child: OrdersEmptyState(
                message: emptyMessage,
              ),
            ),
          ),
        ),
        onTryAgain: () => viewModel.loadOrders(),
      ),
    );
  }
}

