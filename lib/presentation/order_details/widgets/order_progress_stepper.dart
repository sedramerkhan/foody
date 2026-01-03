import 'package:foody/common_imports.dart';
import 'package:foody/presentation/order_details/order_details_view_model.dart';
import 'package:foody/shared/widgets/custom_stepper.dart';

class OrderProgressStepper extends StatelessWidget {
  final OrderDetails orderDetails;
  final OrderDetailsViewModel viewModel;

  const OrderProgressStepper({
    super.key,
    required this.orderDetails,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = S.current;
    final activeStep = viewModel.getActiveStep(orderDetails);

    // Define stepper steps using enum values
    final steps = [
      OrderStatus.pending.getMessage(),
      OrderStatus.confirmed.getMessage(),
      DeliveryStatus.assigned.getMessage(),
      DeliveryStatus.onTheWay.getMessage(),
      OrderStatus.delivered.getMessage(),
    ];

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.bgSurfaceSecondary,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: AppColors.borderPrimary,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            l10n.ordersOrderProgress,
            typography: AppTypography.headingSmallBold,
            color: AppColors.textPrimary,
          ),
          GapH(16.h),
          CustomStepper(
            activeStep: activeStep,
            steps: steps,
          ),
        ],
      ),
    );
  }
}

