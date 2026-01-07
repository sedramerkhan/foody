import 'package:foody/common_imports.dart';
import 'package:foody/core/data/remote/firebase/firebase_auth_service.dart';
import 'package:foody/core/di/di.dart';
import 'package:foody/presentation/main/main_screen.dart';
import 'package:foody/presentation/home/home_view_model.dart';
import 'package:foody/presentation/menu/menu_screen.dart';
import 'package:foody/presentation/menu/menu_view_model.dart';
import 'package:foody/presentation/orders/orders_screen.dart';
import 'package:foody/presentation/orders/orders_view_model.dart';
import 'package:foody/presentation/order_details/order_details_screen.dart';
import 'package:foody/presentation/order_details/order_details_view_model.dart';
import 'package:foody/presentation/profile/profile_screen.dart';
import 'package:foody/presentation/profile/profile_view_model.dart';
import 'package:foody/presentation/sign_in/sign_in_screen.dart';
import 'package:foody/presentation/sign_in/sign_in_view_model.dart';
import 'package:foody/presentation/sign_up/sign_up_screen.dart';
import 'package:foody/presentation/sign_up/sign_up_view_model.dart';
import 'package:foody/presentation/cart/cart_screen.dart';
import 'package:foody/presentation/checkout/checkout_screen.dart';
import 'package:foody/shared/widgets/exit_handler/exit_handler.dart';

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
        final authService = getIt<FirebaseAuthService>();
        final isAuthenticated = authService.currentUser != null;
        
        return CustomPageRoute(
          page: ExitHandler(
            enabled: isAuthenticated,
            child: provideViewModel<HomeViewModel>(
              createViewModel: () => HomeViewModel(),
              arguments: arguments,
              child: const MainScreen(),
            ),
          ),
          settings: settings,
        );
      case Routes.home:
        final authService = getIt<FirebaseAuthService>();
        final isAuthenticated = authService.currentUser != null;
        
        return CustomPageRoute(
          page: ExitHandler(
            enabled: isAuthenticated,
            child: provideViewModel<HomeViewModel>(
              createViewModel: () => HomeViewModel(),
              arguments: arguments,
              child: const MainScreen(),
            ),
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
          page: provideViewModel<OrdersViewModel>(
            createViewModel: () => OrdersViewModel(),
            arguments: arguments,
            child: const OrdersScreen(),
          ),
          settings: settings,
        );
      case Routes.orderDetails:
        final orderId = arguments?['orderId'] as String?;
        if (orderId == null) {
          // Fallback to orders screen if orderId is missing
          return CustomPageRoute(
            page: provideViewModel<OrdersViewModel>(
              createViewModel: () => OrdersViewModel(),
              arguments: arguments,
              child: const OrdersScreen(),
            ),
            settings: settings,
          );
        }
        return CustomPageRoute(
          page: provideViewModel<OrderDetailsViewModel>(
            createViewModel: () => OrderDetailsViewModel(),
            arguments: arguments,
            child: OrderDetailsScreen(orderId: orderId),
          ),
          settings: settings,
        );
      case Routes.profile:
        return CustomPageRoute(
          page: provideViewModel<ProfileViewModel>(
            createViewModel: () => ProfileViewModel(),
            arguments: arguments,
            child: const ProfileScreen(),
          ),
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
      case Routes.signUp:
        return CustomPageRoute(
          page: provideViewModel<SignUpViewModel>(
            createViewModel: () => SignUpViewModel(),
            arguments: arguments,
            child: const SignUpScreen(),
          ),
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
    final authService = getIt<FirebaseAuthService>();
    final currentUser = authService.currentUser;
    
    // If user is authenticated, go to main screen
    // Otherwise, go to sign-in screen
    return currentUser != null ? Routes.main : Routes.signIn;
  }
}

