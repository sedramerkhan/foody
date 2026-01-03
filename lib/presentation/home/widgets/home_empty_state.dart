import 'package:foody/common_imports.dart';

class HomeEmptyState extends StatelessWidget {
  const HomeEmptyState({super.key});

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
                  Icons.restaurant_outlined,
                  size: 56.w,
                  color: AppColors.iconPrimaryAlt,
                ),
                GapH(12.h),
                AppText(
                  'No restaurants available',
                  typography: AppTypography.headingSmallBold,
                  color: AppColors.textPrimary,
                ),
                GapH(6.h),
                AppText(
                  'Check back later for new restaurants',
                  typography: AppTypography.bodyMediumRegular,
                  color: AppColors.textSecondaryAlt,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

