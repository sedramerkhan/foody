import 'package:foody/common_imports.dart';
import 'package:foody/presentation/orders/orders_view_model.dart';
import 'package:foody/presentation/orders/widgets/orders_tab_bar.dart';
import 'package:foody/presentation/orders/widgets/orders_tab_content.dart';
import 'package:foody/shared/widgets/app_bar/custom_app_bar.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();

    // Load orders when screen is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final viewModel = Provider.of<OrdersViewModel>(context, listen: false);
      viewModel.loadOrders();
    });
  }


  @override
  Widget build(BuildContext context) {
    final l10n = S.current;
    final viewModel = Provider.of<OrdersViewModel>(context);


    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: CustomAppBar(
          title: l10n.ordersOrders,
        ),
        body: SafeArea(
          child: Column(
            children: [
              OrdersTabBar(
                tabs: [
                  l10n.ordersUpcoming,
                  l10n.ordersHistory,
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    // Upcoming Tab
                    OrdersTabContent(
                      viewModel: viewModel,
                      getOrders: () => viewModel.getUpcomingOrders(),
                      emptyMessage: l10n.ordersNoUpcomingOrders,
                    ),
                    // History Tab
                    OrdersTabContent(
                      viewModel: viewModel,
                      getOrders: () => viewModel.getHistoryOrders(),
                      emptyMessage: l10n.ordersNoHistoryOrders,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

