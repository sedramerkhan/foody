import 'package:foody/common_imports.dart';
import 'package:foody/data/model/cart/cart_item.dart';

class CartItemCard extends StatelessWidget {
  final CartItem cartItem;
  final VoidCallback onRemove;
  final ValueChanged<int> onQuantityChanged;

  const CartItemCard({
    super.key,
    required this.cartItem,
    required this.onRemove,
    required this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: AppColors.bgSurface,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Item Image
          ClipRRect(
            borderRadius: BorderRadius.horizontal(left: Radius.circular(12.r)),
            child: AppNetworkImage(
              config: AppImageConfig.square(
                imageUrl: cartItem.menuItem.imageUrl,
                size: 80.w,
              ),
            ),
          ),
          // Item Info
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    cartItem.menuItem.itemName,
                    typography: AppTypography.bodyMediumSemiBold,
                    color: AppColors.textPrimary,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  GapH(4.h),
                  AppText(
                    '\$${cartItem.menuItem.price.toStringAsFixed(2)}',
                    typography: AppTypography.bodySmallMedium,
                    color: AppColors.textBrand,
                  ),
                  GapH(8.h),
                  // Quantity controls
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove_circle_outline, size: 20.w),
                            onPressed: cartItem.quantity > 1
                                ? () => onQuantityChanged(cartItem.quantity - 1)
                                : null,
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                          ),
                          GapW(8.w),
                          AppText(
                            '${cartItem.quantity}',
                            typography: AppTypography.bodyMediumSemiBold,
                            color: AppColors.textPrimary,
                          ),
                          GapW(8.w),
                          IconButton(
                            icon: Icon(Icons.add_circle_outline, size: 20.w),
                            onPressed: () => onQuantityChanged(cartItem.quantity + 1),
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                          ),
                        ],
                      ),
                      IconButton(
                        icon: Icon(Icons.delete_outline, size: 20.w, color: AppColors.textError),
                        onPressed: onRemove,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

