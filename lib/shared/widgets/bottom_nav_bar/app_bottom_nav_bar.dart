import 'package:foody/common_imports.dart';

/// Bottom navigation bar for main app navigation
class AppBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const AppBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = S.current;
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.brand500,
      unselectedItemColor: AppColors.iconPrimary,
      backgroundColor: AppColors.bgSurface,
      elevation: 8,
      selectedLabelStyle: TextStyle(
        fontSize: AppFontSize.s12,
        fontWeight: AppFontWeight.medium500,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: AppFontSize.s12,
        fontWeight: AppFontWeight.regular400,
      ),
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home),
          label: l10n.homeHome,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.receipt_long_outlined),
          activeIcon: Icon(Icons.receipt_long),
          label: l10n.ordersOrders,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          activeIcon: Icon(Icons.person),
          label: l10n.profileProfile,
        ),
      ],
    );
  }
}

