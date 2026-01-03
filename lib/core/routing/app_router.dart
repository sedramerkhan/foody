import 'package:foody/common_imports.dart';
import 'package:foody/presentation/main/main_screen.dart';
import 'package:foody/presentation/home/home_view_model.dart';
import 'package:foody/presentation/menu/menu_screen.dart';
import 'package:foody/presentation/menu/menu_view_model.dart';
import 'package:foody/presentation/orders/orders_screen.dart';
import 'package:foody/presentation/profile/profile_screen.dart';
import 'package:foody/presentation/sign_in/sign_in_screen.dart';
import 'package:foody/presentation/cart/cart_screen.dart';
import 'package:foody/presentation/checkout/checkout_screen.dart';
import 'package:foody/presentation/sign_in/sign_in_view_model.dart';

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
      case Routes.main:
        return CustomPageRoute(
          page: provideViewModel<HomeViewModel>(
            createViewModel: () => HomeViewModel(),
            arguments: arguments,
            child: const MainScreen(),
          ),
          settings: settings,
        );
      case Routes.home:
        return CustomPageRoute(
          page: provideViewModel<HomeViewModel>(
            createViewModel: () => HomeViewModel(),
            arguments: arguments,
            child: const MainScreen(),
          ),
          settings: settings,
        );
      case Routes.menu:
        return CustomPageRoute(
          page: provideViewModel<MenuViewModel>(
            createViewModel: () => MenuViewModel(),
            arguments: arguments,
            child: const MenuScreen(),
          ),
          settings: settings,
        );
      case Routes.orders:
        return CustomPageRoute(
          page: const OrdersScreen(),
          settings: settings,
        );
      case Routes.profile:
        return CustomPageRoute(
          page: const ProfileScreen(),
          settings: settings,
        );
      case Routes.cart:
        return CustomPageRoute(
          page: const CartScreen(),
          settings: settings,
        );
      case Routes.checkout:
        return CustomPageRoute(
          page: const CheckoutScreen(),
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

