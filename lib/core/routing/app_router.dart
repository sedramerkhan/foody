import 'package:flutter/material.dart';
import 'package:foody/core/base/view_model/base_view_model.dart';
import 'package:foody/core/routing/routes.dart';
import 'package:foody/presentation/home/home_screen.dart';
import 'package:foody/presentation/sign_in/sign_in_screen.dart';
import 'package:foody/presentation/sign_in/sign_in_view_model.dart';
import 'package:foody/shared/utils/navigation/custom_page_route.dart';
import 'package:foody/shared/utils/navigation/navigation_helpers.dart';
import 'package:foody/shared/utils/navigation/view_model_provider.dart';

/// Application router that handles navigation and route generation
class AppRouter {
  AppRouter._();

  /// Generate routes for the application
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments as Map<String, dynamic>?;

    switch (settings.name) {
      case Routes.signIn:
        return CustomPageRoute(
          page: provideViewModel<SignInViewModel>(
            createViewModel: () => SignInViewModel(),
            arguments: arguments,
            child: const SignInScreen(),
          ),
          settings: settings,
        );
      case Routes.home:
        return CustomPageRoute(
          page: const HomeScreen(),
          settings: settings,
        );
      default:
        return CustomPageRoute(
          page: provideViewModel<SignInViewModel>(
            createViewModel: () => SignInViewModel(),
            arguments: arguments,
            child: const SignInScreen(),
          ),
          settings: settings,
        );
    }
  }

  /// Get initial route based on authentication state
  static String getInitialRoute() {
    // TODO: Check if user is authenticated
    // For now, always start with sign-in
    return Routes.signIn;
  }
}

