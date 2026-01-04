import 'package:foody/common_imports.dart';
import 'package:foody/core/api_response/no_data/try_again_widget.dart';
import 'package:foody/presentation/menu/menu_view_model.dart';

class MenuErrorState extends StatelessWidget {
  final String message;
  final MenuViewModel viewModel;

  const MenuErrorState({
    super.key,
    required this.message,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = S.current;
    return Center(
      child: TryAgain(
        message: l10n.menuErrorLoadingMenu,
        subMessage: message,
        icon: Icon(
          Icons.error_outline,
          size: 56.w,
          color: AppColors.iconPrimaryAlt,
        ),
        onTapButton: () => viewModel.loadMenuItems(),
      ),
    );
  }
}

