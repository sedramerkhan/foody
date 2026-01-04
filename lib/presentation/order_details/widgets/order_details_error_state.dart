import 'package:foody/common_imports.dart';
import 'package:foody/presentation/order_details/order_details_view_model.dart';

class OrderDetailsErrorState extends StatelessWidget {
  final String message;
  final String orderId;

  const OrderDetailsErrorState({
    super.key,
    required this.message,
    required this.orderId,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = S.current;
    return Center(
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64.w,
              color: AppColors.textSecondaryAlt,
            ),
            GapH(16.h),
            AppText(
              message,
              typography: AppTypography.bodyMediumRegular,
              color: AppColors.textPrimary,
              textAlign: TextAlign.center,
            ),
            GapH(16.h),
            PrimaryButton(
              onPressed: () {
                final viewModel = Provider.of<OrderDetailsViewModel>(context, listen: false);
                viewModel.loadOrderDetails(orderId);
              },
              text: l10n.commonTryAgain,
            ),
          ],
        ),
      ),
    );
  }
}

