import 'package:foody/common_imports.dart';

class SignInGradientHeader extends StatelessWidget {
  const SignInGradientHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = S.current;
    
    return Container(
      height: MediaQuery.heightOf(context) * 0.3,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            AppColors.brand500,
            AppColors.brand700,
          ],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal:24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
              l10n.homeWelcome,
              typography: AppTypography.headingXLargeBold,
              color: Colors.white,
            ),
            GapH(4.h),
            AppText(
              l10n.signInSignInToContinue,
              typography: AppTypography.headingMediumBold,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

