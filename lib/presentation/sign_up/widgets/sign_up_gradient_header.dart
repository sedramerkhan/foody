import 'package:foody/common_imports.dart';

class SignUpGradientHeader extends StatelessWidget {
  const SignUpGradientHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = S.current;

    return Container(
      height: MediaQuery.heightOf(context) * .35,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.bgFillBrand,
            AppColors.bgFillBrandAlt,
          ],
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText(
                l10n.signUpCreateAccount,
                typography: AppTypography.headingLargeBold,
                color: AppColors.textOnBrand,
              ),
              GapH(8.h),
              AppText(
                l10n.signUpSignUpToContinue,
                typography: AppTypography.bodyMediumRegular,
                color: AppColors.textOnBrand,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

