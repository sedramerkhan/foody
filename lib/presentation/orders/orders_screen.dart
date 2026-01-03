import 'package:foody/common_imports.dart';
import 'package:foody/presentation/orders/widgets/orders_coming_soon.dart';
import 'package:foody/shared/widgets/app_bar/custom_app_bar.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = S.current;

    return Scaffold(
      appBar: CustomAppBar(
        title: l10n.ordersOrders,
      ),
      body: const SafeArea(
        child: OrdersComingSoon(),
      ),
    );
  }
}

