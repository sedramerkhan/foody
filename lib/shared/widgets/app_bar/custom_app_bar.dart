import 'package:foody/common_imports.dart';

/// A custom AppBar widget that removes the back button and provides consistent styling.
/// 
/// This AppBar is designed for main screens (home, menu, profile) where back navigation
/// is not needed or handled differently.
/// 
/// Example:
/// ```dart
/// CustomAppBar(
///   title: 'Restaurants',
///   actions: [
///     CartIconButton(...),
///   ],
/// )
/// ```
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// The title text to display in the AppBar
  final String title;

  /// Optional actions to display on the right side of the AppBar
  final List<Widget>? actions;

  /// Optional leading widget (if null, no back button is shown)
  final Widget? leading;

  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: AppText(
        title,
        typography: AppTypography.headingMediumBold,
        color: AppColors.textPrimary,
      ),
      backgroundColor: AppColors.bgSurface,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      automaticallyImplyLeading: false,
      leading: leading,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

