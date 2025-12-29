import 'package:foody/common_imports.dart';
import 'package:foody/presentation/profile/widgets/profile_coming_soon.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = S.current;

    return Scaffold(
      appBar: AppBar(
        title: AppText(
          'Profile',
          typography: AppTypography.headingMediumBold,
          color: AppColors.textPrimary,
        ),
        backgroundColor: AppColors.bgSurface,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
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
      body: const SafeArea(
        child: ProfileComingSoon(),
      ),
    );
  }
}

