import 'package:foody/common_imports.dart';
import 'package:foody/presentation/orders/widgets/orders_coming_soon.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = S.current;

    return Scaffold(
      appBar: AppBar(
        title: AppText(
          'Orders',
          typography: AppTypography.headingMediumBold,
          color: AppColors.textPrimary,
        ),
        backgroundColor: AppColors.bgSurface,
        elevation: 0,
      ),
      body: const SafeArea(
        child: OrdersComingSoon(),
      ),
    );
  }
}

