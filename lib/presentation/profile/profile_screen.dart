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
              PrimaryButton(
                onPressed: () async {
                  await viewModel.addSyrianRestaurants();
                  if (!context.mounted) return;
                  
                  final response = viewModel.addRestaurantsResponse.value;
                  ApiResponseHandler.handle(
                    context: context,
                    result: response,
                    onSuccess: (_) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(l10n.profileSyrianRestaurantsAddedSuccessfully),
                          backgroundColor: Colors.green,
                        ),
                      );
                    },
                  );
                },
                child: ValueListenableBuilder<ApiResponse<void>>(
                  valueListenable: viewModel.addRestaurantsResponse,
                  builder: (context, response, child) {
                    if (response.isLoading) {
                      return const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      );
                    }
                    return AppText(
                      l10n.profileAddSyrianRestaurants,
                      typography: AppTypography.bodyMediumMedium,
                      color: Colors.white,
                    );
                  },
                ),
              ),
              const SizedBox(height: 12),
              PrimaryButton(
                onPressed: () async {
                  await viewModel.addFakeDrivers();
                  if (!context.mounted) return;
                  
                  final response = viewModel.addDriversResponse.value;
                  ApiResponseHandler.handle(
                    context: context,
                    result: response,
                    onSuccess: (_) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(l10n.profileDriversAddedSuccessfully),
                          backgroundColor: Colors.green,
                        ),
                      );
                    },
                  );
                },
                child: ValueListenableBuilder<ApiResponse<void>>(
                  valueListenable: viewModel.addDriversResponse,
                  builder: (context, response, child) {
                    if (response.isLoading) {
                      return const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      );
                    }
                    return AppText(
                      l10n.profileAddFakeDrivers,
                      typography: AppTypography.bodyMediumMedium,
                      color: Colors.white,
                    );
                  },
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

