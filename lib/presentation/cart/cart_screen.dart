import 'package:foody/common_imports.dart';
import 'package:foody/presentation/cart/cart_view_model.dart';
import 'package:foody/shared/widgets/app_bar/custom_app_bar.dart';
import 'package:foody/presentation/cart/widgets/cart_item_card.dart';
import 'package:foody/presentation/cart/widgets/cart_empty_state.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = S.current;
    return Scaffold(
      appBar: CustomAppBar(title: l10n.cartCart),
      body: Consumer<CartViewModel>(
        builder: (context, viewModel, _) {
          if (viewModel.isEmpty) {
            return const CartEmptyState();
          }

          return Column(
            children: [
              // Cart Items List
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(12.w),
                  itemCount: viewModel.items.length,
                  itemBuilder: (context, index) {
                    final item = viewModel.items[index];
                    return CartItemCard(
                      cartItem: item,
                      onRemove: () => viewModel.removeItem(item.menuItem.menuId),
                      onQuantityChanged: (quantity) =>
                          viewModel.updateQuantity(item.menuItem.menuId, quantity),
                    );
                  },
                ),
              ),
              // Bottom Summary
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: AppColors.bgSurface,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 10,
                      offset: Offset(0, -2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          l10n.cartTotal,
                          typography: AppTypography.headingMediumBold,
                          color: AppColors.textPrimary,
                        ),
                        AppText(
                          '\$${viewModel.totalAmount.toStringAsFixed(2)}',
                          typography: AppTypography.headingMediumBold,
                          color: AppColors.textBrand,
                        ),
                      ],
                    ),
                    GapH(16.h),
                    AppButton(
                      text: l10n.cartProceedToCheckout,
                      config: AppButtonConfig(
                        onPressed: () {
                          NavigationUtils.pushNamed(context, Routes.checkout);
                        },
                      ),
                      style: AppButtonStyle.gradientPrimary(),
                      expandWidth: true,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
