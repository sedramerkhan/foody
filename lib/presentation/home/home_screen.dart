import 'package:foody/common_imports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = S.current;
    
    return Scaffold(
      appBar: AppBar(
        title: AppText(
          l10n.homeHome,
          typography: AppTypography.headingMediumBold,
          color: AppColors.textPrimary,
        ),
        backgroundColor: AppColors.bgSurface,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              // TODO: Implement sign out
              Navigator.of(context).pushReplacementNamed(Routes.signIn);
            },
            child: AppText(
              l10n.homeSignOut,
              typography: AppTypography.bodyMediumMedium,
              color: AppColors.textBrand,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GapH(32.h),
              AppText(
                l10n.homeWelcome,
                typography: AppTypography.headingLargeBold,
                color: AppColors.textPrimary,
                textAlign: TextAlign.center,
              ),
              GapH(16.h),
              AppText(
                l10n.homeYouHaveSuccessfullySignedIn,
                typography: AppTypography.bodyLargeRegular,
                color: AppColors.textSecondaryAlt,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

