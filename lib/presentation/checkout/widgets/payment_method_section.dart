import 'package:foody/common_imports.dart';
import 'package:foody/data/model/payment/payment.dart';

class PaymentMethodSection extends StatelessWidget {
  final PaymentMethod selectedMethod;
  final ValueChanged<PaymentMethod> onMethodChanged;

  const PaymentMethodSection({
    super.key,
    required this.selectedMethod,
    required this.onMethodChanged,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = S.current;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppText(
          l10n.checkoutPaymentMethod,
          typography: AppTypography.headingSmallBold,
          color: AppColors.textPrimary,
        ),
        GapH(12.h),
        _buildPaymentOption(
          PaymentMethod.card,
          l10n.checkoutCard,
          Icons.credit_card,
        ),
        GapH(8.h),
        _buildPaymentOption(
          PaymentMethod.paypal,
          l10n.checkoutPayPal,
          Icons.payment,
        ),
        GapH(8.h),
        _buildPaymentOption(
          PaymentMethod.cash,
          l10n.checkoutCashOnDelivery,
          Icons.money,
        ),
      ],
    );
  }

  Widget _buildPaymentOption(
    PaymentMethod method,
    String label,
    IconData icon,
  ) {
    final isSelected = selectedMethod == method;

    return AppClickableContainer(
      config: ClickableContainerConfig.enabled(
        onTap: () => onMethodChanged(method),
      ),
      style: ClickableContainerStyle(
        color: isSelected ? AppColors.bgFillBrandAlt : AppColors.bgSurface,
        borderRadius: BorderRadius.circular(12.r),
        border:Border.all(color:  isSelected ? AppColors.borderBrand : AppColors.borderPrimary),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Row(
          children: [
            Icon(
              icon,
              size: 24.w,
              color: isSelected ? AppColors.iconBrand : AppColors.iconPrimary,
            ),
            GapW(12.w),
            Expanded(
              child: AppText(
                label,
                typography: AppTypography.bodyMediumMedium,
                color: AppColors.textPrimary,
              ),
            ),
            if (isSelected)
              Icon(
                Icons.check_circle,
                size: 20.w,
                color: AppColors.iconBrand,
              ),
          ],
        ),
      ),
    );
  }
}

