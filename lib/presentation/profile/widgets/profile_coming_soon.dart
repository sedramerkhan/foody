import 'package:foody/common_imports.dart';

class ProfileComingSoon extends StatelessWidget {
  const ProfileComingSoon({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.person_outline,
              size: 56.w,
              color: AppColors.iconPrimaryAlt,
            ),
            GapH(12.h),
            AppText(
              'Profile Coming Soon',
              typography: AppTypography.headingMediumBold,
              color: AppColors.textPrimary,
            ),
            GapH(6.h),
            AppText(
              'Your profile settings will appear here',
              typography: AppTypography.bodyMediumRegular,
              color: AppColors.textSecondaryAlt,
            ),
          ],
        ),
      ),
    );
  }
}

