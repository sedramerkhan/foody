import 'package:foody/common_imports.dart';
import 'package:foody/presentation/order_details/order_details_view_model.dart';

class OrderItemRow extends StatelessWidget {
  final OrderItemWithMenu itemWithMenu;

  const OrderItemRow({
    super.key,
    required this.itemWithMenu,
  });

  @override
  Widget build(BuildContext context) {
    final item = itemWithMenu.orderItem;
    final menu = itemWithMenu.menu;

    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  menu?.itemName ?? 'Item ${item.menuId}',
                  typography: AppTypography.bodyMediumSemiBold,
                  color: AppColors.textPrimary,
                ),
                if (menu != null) ...[
                  GapH(4.h),
                  AppText(
                    '${item.quantity}x \$${item.price.toStringAsFixed(2)}',
                    typography: AppTypography.bodySmallRegular,
                    color: AppColors.textSecondaryAlt,
                  ),
                ],
              ],
            ),
          ),
          AppText(
            '\$${item.totalPrice.toStringAsFixed(2)}',
            typography: AppTypography.bodyMediumSemiBold,
            color: AppColors.textPrimary,
          ),
        ],
      ),
    );
  }
}

