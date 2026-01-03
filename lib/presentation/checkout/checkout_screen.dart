import 'package:foody/common_imports.dart';
import 'package:foody/presentation/checkout/checkout_view_model.dart';
import 'package:foody/presentation/cart/cart_view_model.dart';
import 'package:foody/shared/widgets/app_bar/custom_app_bar.dart';
import 'package:foody/presentation/checkout/widgets/address_input_section.dart';
import 'package:foody/presentation/checkout/widgets/payment_method_section.dart';
import 'package:foody/presentation/checkout/widgets/delivery_time_section.dart';
import 'package:foody/shared/widgets/buttons/app_button.dart';
import 'package:foody/shared/widgets/buttons/app_button_config.dart';
import 'package:foody/shared/widgets/buttons/app_button_style.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = S.current;
    return ChangeNotifierProvider(
      create: (_) => CheckoutViewModel(),
      child: Scaffold(
        appBar: CustomAppBar(title: l10n.checkoutCheckout),
        body: Consumer<CheckoutViewModel>(
          builder: (context, checkoutViewModel, _) {
            final cartViewModel = Provider.of<CartViewModel>(context, listen: true);
            if (cartViewModel.isEmpty) {
              return Center(
                child: AppText(
                  l10n.checkoutYourCartIsEmpty,
                  typography: AppTypography.headingSmallBold,
                  color: AppColors.textPrimary,
                ),
              );
            }

            return SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Restaurant Info
                  if (cartViewModel.restaurant != null) ...[
                    Container(
                      padding: EdgeInsets.all(12.w),
                      decoration: BoxDecoration(
                        color: AppColors.bgSurfaceSecondary,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.restaurant,
                            size: 24.w,
                            color: AppColors.iconBrand,
                          ),
                          GapW(12.w),
                          Expanded(
                            child: AppText(
                              cartViewModel.restaurant!.name,
                              typography: AppTypography.bodyMediumSemiBold,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GapH(24.h),
                  ],
                  // Delivery Address
                  AddressInputSection(
                    address: checkoutViewModel.deliveryAddress,
                    onAddressChanged: checkoutViewModel.setDeliveryAddress,
                  ),
                  GapH(24.h),
                  // Payment Method
                  PaymentMethodSection(
                    selectedMethod: checkoutViewModel.paymentMethod,
                    onMethodChanged: checkoutViewModel.setPaymentMethod,
                  ),
                  GapH(24.h),
                  // Delivery Time
                  DeliveryTimeSection(
                    estimatedTime: checkoutViewModel.estimatedDeliveryTime,
                    onTimeChanged: checkoutViewModel.setEstimatedDeliveryTime,
                  ),
                  GapH(24.h),
                  // Order Summary
                  Container(
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: AppColors.bgSurfaceSecondary,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        AppText(
                          l10n.checkoutOrderSummary,
                          typography: AppTypography.headingSmallBold,
                          color: AppColors.textPrimary,
                        ),
                        GapH(12.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText(
                              l10n.checkoutItems(cartViewModel.itemCount),
                              typography: AppTypography.bodyMediumRegular,
                              color: AppColors.textSecondaryAlt,
                            ),
                            AppText(
                              '\$${cartViewModel.totalAmount.toStringAsFixed(2)}',
                              typography: AppTypography.bodyMediumRegular,
                              color: AppColors.textSecondaryAlt,
                            ),
                          ],
                        ),
                        GapH(8.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText(
                              l10n.checkoutDeliveryFee,
                              typography: AppTypography.bodyMediumRegular,
                              color: AppColors.textSecondaryAlt,
                            ),
                            AppText(
                              '\$2.50',
                              typography: AppTypography.bodyMediumRegular,
                              color: AppColors.textSecondaryAlt,
                            ),
                          ],
                        ),
                        GapH(12.h),
                        Divider(color: AppColors.borderPrimary),
                        GapH(12.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText(
                              l10n.checkoutTotal,
                              typography: AppTypography.headingMediumBold,
                              color: AppColors.textPrimary,
                            ),
                            AppText(
                              '\$${(cartViewModel.totalAmount + 2.50).toStringAsFixed(2)}',
                              typography: AppTypography.headingMediumBold,
                              color: AppColors.textBrand,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  GapH(32.h),
                  // Place Order Button
                  AppButton(
                    text: l10n.checkoutPlaceOrder,
                    config: AppButtonConfig(
                      onPressed: checkoutViewModel.canPlaceOrder
                          ? () {
                              // TODO: Place order
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(l10n.checkoutOrderPlacedSuccessfully),
                                ),
                              );
                            }
                          : null,
                    ),
                    style: AppButtonStyle.gradientPrimary(),
                    expandWidth: true,
                  ),
                  GapH(20.h),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

