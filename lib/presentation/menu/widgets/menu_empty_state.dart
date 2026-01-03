import 'package:foody/common_imports.dart';

class MenuEmptyState extends StatelessWidget {
  const MenuEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = S.current;
    return Center(
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.restaurant_menu_outlined,
              size: 56.w,
              color: AppColors.iconPrimaryAlt,
            ),
                GapH(12.h),
                AppText(
                  l10n.menuNoMenuItemsAvailable,
                  typography: AppTypography.headingSmallBold,
                  color: AppColors.textPrimary,
                ),
                GapH(6.h),
                AppText(
                  l10n.menuNoItemsOnMenu,
                  typography: AppTypography.bodyMediumRegular,
                  color: AppColors.textSecondaryAlt,
                  textAlign: TextAlign.center,
                ),
          ],
        ),
      ),
    );
  }
}

