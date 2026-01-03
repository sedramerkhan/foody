import 'package:foody/common_imports.dart';
import 'package:foody/presentation/orders/orders_view_model.dart';
import 'package:foody/presentation/orders/widgets/order_card.dart';
import 'package:foody/presentation/orders/widgets/orders_empty_state.dart';
import 'package:foody/shared/widgets/app_bar/custom_app_bar.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    
    // Load orders when screen is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final viewModel = Provider.of<OrdersViewModel>(context, listen: false);
      viewModel.loadOrders();
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  /// Build order list widget for a given list of orders
  Widget _buildOrderList(
    List<OrderWithDelivery> orders,
    String emptyMessage,
  ) {
    if (orders.isEmpty) {
      return SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: OrdersEmptyState(
          message: emptyMessage,
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
    OrdersViewModel viewModel,
    List<OrderWithDelivery> Function() getOrders,
    String emptyMessage,
  ) {
    return ApiResponseBuilder<List<OrderWithDelivery>>(
      apiResponse: viewModel.ordersResponse,
      loading: const Center(
        child: CircularProgressIndicator(),
      ),
      onSuccess: (allOrders) {
        final filteredOrders = getOrders();
        return _buildOrderList(filteredOrders, emptyMessage);
      },
      onError: (message) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
              message,
              typography: AppTypography.bodyMediumRegular,
              color: AppColors.textError,
              textAlign: TextAlign.center,
            ),
            GapH(16.h),
            PrimaryButton(
              onPressed: () => viewModel.loadOrders(),
              child: AppText(
                S.current.commonTryAgain,
                typography: AppTypography.bodyMediumMedium,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      empty: Center(
        child: OrdersEmptyState(
          message: emptyMessage,
        ),
      ),
      onTryAgain: () => viewModel.loadOrders(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = S.current;
    final viewModel = Provider.of<OrdersViewModel>(context);

    return Scaffold(
      appBar: CustomAppBar(
        title: l10n.ordersOrders,
      ),
      body: SafeArea(
        child: Column(
          children: [
            TabBar(
              controller: _tabController,
              tabs: [
                Tab(text: l10n.ordersUpcoming),
                Tab(text: l10n.ordersHistory),
              ],
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  await viewModel.refreshOrders();
                },
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    // Upcoming Tab
                    _buildOrdersTab(
                      viewModel,
                      () => viewModel.getUpcomingOrders(),
                      l10n.ordersNoUpcomingOrders,
                    ),
                    // History Tab
                    _buildOrdersTab(
                      viewModel,
                      () => viewModel.getHistoryOrders(),
                      l10n.ordersNoHistoryOrders,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

