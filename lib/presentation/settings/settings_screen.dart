import 'package:foody/common_imports.dart';
import 'package:foody/presentation/profile/profile_view_model.dart';
import 'package:foody/shared/widgets/app_bar/custom_app_bar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = S.current;
    final viewModel = Provider.of<ProfileViewModel>(context);

    return Scaffold(
      appBar: CustomAppBar(
        title: l10n.settingsSettings,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              // Add Syrian Restaurants
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
              // Add Fake Drivers
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
            ],
          ),
        ),
      ),
    );
  }
}

