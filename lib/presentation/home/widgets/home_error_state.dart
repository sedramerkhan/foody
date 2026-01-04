import 'package:foody/common_imports.dart';
import 'package:foody/core/api_response/no_data/try_again_widget.dart';
import 'package:foody/presentation/home/home_view_model.dart';

class HomeErrorState extends StatelessWidget {
  final String message;
  final HomeViewModel viewModel;

  const HomeErrorState({
    super.key,
    required this.message,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = S.current;
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(), // Enable pull-to-refresh
      child: SizedBox(
        height: MediaQuery.of(context).size.height - 200, // Make it scrollable
        child: TryAgain(
          message: l10n.homeErrorLoadingRestaurants,
          subMessage: message,
          icon: Icon(
            Icons.error_outline,
            size: 56.w,
            color: AppColors.iconPrimaryAlt,
          ),
          onTapButton: () => viewModel.loadRestaurants(),
        ),
      ),
    );
  }
}

