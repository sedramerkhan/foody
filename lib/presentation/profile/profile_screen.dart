import 'package:foody/common_imports.dart';
import 'package:foody/presentation/profile/widgets/profile_coming_soon.dart';
import 'package:foody/shared/widgets/app_bar/custom_app_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = S.current;

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Profile',
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

