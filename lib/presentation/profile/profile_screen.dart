import 'package:foody/common_imports.dart';
import 'package:foody/presentation/profile/profile_view_model.dart';
import 'package:foody/shared/widgets/app_bar/custom_app_bar.dart';
import 'package:foody/shared/widgets/buttons/buttons.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = S.current;
    final viewModel = Provider.of<ProfileViewModel>(context);

    return Scaffold(
      appBar: CustomAppBar(
        title: l10n.profileProfile,
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              // Language Switcher
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: AppColors.bgSurfaceSecondary,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      l10n.profileLanguage,
                      typography: AppTypography.bodyMediumSemiBold,
                      color: AppColors.textPrimary,
                    ),
                    GapH(12.h),
                    Row(
                      children: [
                        Expanded(
                          child: PrimaryButton(
                            onPressed: () async {
                              await AppConfig().setLanguageCode('en');
                              if (context.mounted) {
                                // Restart app to apply language change
                                Navigator.of(context, rootNavigator: true).pushNamedAndRemoveUntil(
                                  Routes.main,
                                      (route) => false,
                                );
                              }
                            },
                            child: AppText(
                              l10n.profileEnglish,
                              typography: AppTypography.bodyMediumMedium,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        GapW(12.w),
                        Expanded(
                          child: PrimaryButton(
                            onPressed: () async {
                              await AppConfig().setLanguageCode('ar');
                              if (context.mounted) {
                                // Restart app to apply language change
                                Navigator.of(context, rootNavigator: true).pushNamedAndRemoveUntil(
                                  Routes.main,
                                      (route) => false,
                                );
                              }
                            },
                            child: AppText(
                              l10n.profileArabic,
                              typography: AppTypography.bodyMediumMedium,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Theme Mode Selector
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: AppColors.bgSurfaceSecondary,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      l10n.profileTheme,
                      typography: AppTypography.bodyMediumSemiBold,
                      color: AppColors.textPrimary,
                    ),
                    GapH(12.h),
                    Row(
                      children: [
                        Expanded(
                          child: _ThemeModeButton(
                            label: l10n.profileLight,
                            mode: 'light',
                            isSelected: AppConfig().themeModeString == 'light',
                            onPressed: () async {
                              await AppConfig().setThemeMode('light');
                            },
                          ),
                        ),
                        GapW(8.w),
                        Expanded(
                          child: _ThemeModeButton(
                            label: l10n.profileDark,
                            mode: 'dark',
                            isSelected: AppConfig().themeModeString == 'dark',
                            onPressed: () async {
                              await AppConfig().setThemeMode('dark');
                            },
                          ),
                        ),
                        GapW(8.w),
                        Expanded(
                          child: _ThemeModeButton(
                            label: l10n.profileSystem,
                            mode: 'system',
                            isSelected: AppConfig().themeModeString == 'system',
                            onPressed: () async {
                              await AppConfig().setThemeMode('system');
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Settings Button
              PrimaryButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(Routes.settings);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.settings,
                      color: Colors.white,
                      size: 20.w,
                    ),
                    GapW(8.w),
                    AppText(
                      l10n.settingsSettings,
                      typography: AppTypography.bodyMediumMedium,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Center(
                  child: AppText(
                    l10n.profileFeaturesComingSoon,
                    typography: AppTypography.bodyMediumRegular,
                    color: AppColors.textSecondaryAlt,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ThemeModeButton extends StatelessWidget {
  final String label;
  final String mode;
  final bool isSelected;
  final VoidCallback onPressed;

  const _ThemeModeButton({
    required this.label,
    required this.mode,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: AppConfig(),
      builder: (context, _) {
        return GestureDetector(
          onTap: onPressed,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.bgFillBrand : AppColors.bgSurfaceSecondary,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(
                color: isSelected ? AppColors.borderBrand : AppColors.borderPrimary,
                width: 1,
              ),
            ),
            child: Center(
              child: AppText(
                label,
                typography: AppTypography.bodySmallMedium,
                color: isSelected ? AppColors.textOnBrand : AppColors.textPrimary,
              ),
            ),
          ),
        );
      },
    );
  }
}

