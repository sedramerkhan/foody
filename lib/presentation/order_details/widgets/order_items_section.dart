import 'package:foody/common_imports.dart';
import 'package:foody/presentation/order_details/order_details_view_model.dart';
import 'package:foody/presentation/order_details/widgets/order_item_row.dart';

class OrderItemsSection extends StatelessWidget {
  final OrderDetails orderDetails;

  const OrderItemsSection({
    super.key,
    required this.orderDetails,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = S.current;
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
            l10n.ordersItems,
            typography: AppTypography.headingSmallBold,
            color: AppColors.textPrimary,
          ),
          GapH(16.h),
          ...orderDetails.items.map(
            (itemWithMenu) => OrderItemRow(itemWithMenu: itemWithMenu),
          ),
        ],
      ),
    );
  }
}

