import 'package:foody/common_imports.dart';

/// Cart icon button with optional badge for item count
class CartIconButton extends StatelessWidget {
  final int? itemCount;
  final VoidCallback onTap;

  const CartIconButton({
    super.key,
    this.itemCount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        IconButton(
          icon: const Icon(Icons.shopping_cart_outlined),
          onPressed: onTap,
          color: AppColors.iconPrimary,
        ),
        if (itemCount != null && itemCount! > 0)
          Positioned(
            right: 8,
            top: 8,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: AppColors.bgFillError,
                shape: BoxShape.circle,
              ),
              constraints: const BoxConstraints(
                minWidth: 16,
                minHeight: 16,
              ),
              child: Center(
                child: AppText(
                  itemCount! > 99 ? '99+' : itemCount.toString(),
                  typography: AppTypography.bodyXXSmallMedium,
                  color: AppColors.textOnBrand,
                ),
              ),
            ),
          ),
      ],
    );
  }
}


