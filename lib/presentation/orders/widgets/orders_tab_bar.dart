import 'package:foody/common_imports.dart';

/// Beautiful custom tab bar for orders screen
class OrdersTabBar extends StatelessWidget {
  final List<String> tabs;

  const OrdersTabBar({
    super.key,
    required this.tabs,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelColor: AppColors.textBrand,
      unselectedLabelColor: AppColors.textSecondary,
      labelStyle: AppTextStyle(
        typography: AppTypography.bodyMediumMedium,
        color: AppColors.textBrand,
      ).toTextStyle(),
      unselectedLabelStyle: AppTextStyle(
        typography: AppTypography.bodyMediumMedium,
        color: AppColors.textSecondary,
      ).toTextStyle(),
      dividerColor: Colors.transparent,
      overlayColor: const WidgetStatePropertyAll(Colors.transparent),
      indicatorPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
      indicatorSize: TabBarIndicatorSize.tab,
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(22.r),
        color: AppColors.bgFillBrandAlt,
      ),
      tabs: tabs
          .map((tab) => Tab(
        text: tab,
      ))
          .toList(),
    );
  }
}

