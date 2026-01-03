import 'package:foody/common_imports.dart';
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
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(), // Enable pull-to-refresh
      child: SizedBox(
        height: MediaQuery.of(context).size.height - 200, // Make it scrollable
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline,
                  size: 56.w,
                  color: AppColors.iconPrimaryAlt,
                ),
                GapH(12.h),
                AppText(
                  'Error loading restaurants',
                  typography: AppTypography.headingSmallBold,
                  color: AppColors.textPrimary,
                ),
                GapH(6.h),
                AppText(
                  message,
                  typography: AppTypography.bodyMediumRegular,
                  color: AppColors.textSecondaryAlt,
                  textAlign: TextAlign.center,
                ),
                GapH(20.h),
                PrimaryButton(
                  text: 'Try Again',
                  onPressed: () => viewModel.loadRestaurants(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

