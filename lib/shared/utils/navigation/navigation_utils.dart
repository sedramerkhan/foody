import 'package:flutter/material.dart';
import 'package:foody/core/base/view_model/base_view_model.dart';
import 'package:foody/shared/utils/navigation/custom_page_route.dart';
import 'package:foody/shared/utils/navigation/navigation_helpers.dart';

/// Navigation utilities with custom transitions and ViewModel support
class NavigationUtils {
  NavigationUtils._();

  /// Push a new route with custom slide transition
  static Future<T?> push<T>(
    BuildContext context,
    Widget widget, {
    bool rootNavigator = false,
    bool isFromBottomToTop = false,
  }) {
    return Navigator.of(context, rootNavigator: rootNavigator).push<T>(
      CustomPageRoute<T>(
        page: widget,
        transitionDuration: const Duration(milliseconds: 180),
        routeTransitionsBuilder: (context, animation, secondaryAnimation, child) {
          final tween = Tween(
            begin: isFromBottomToTop
                ? const Offset(0.0, 1.0)
                : const Offset(1.0, 0.0),
            end: Offset.zero,
          ).chain(CurveTween(curve: Curves.ease));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ),
    );
  }

  /// Push a named route with custom slide transition
  static Future<T?> pushNamed<T>(
    BuildContext context,
    String routeName, {
    Object? arguments,
    bool rootNavigator = false,
    bool isFromBottomToTop = false,
  }) {
    return Navigator.of(context, rootNavigator: rootNavigator).pushNamed<T>(
      routeName,
      arguments: arguments,
    );
  }

  /// Push a named route and remove all previous routes until predicate is true
  static Future<T?> pushNamedAndRemoveUntil<T>(
    BuildContext context,
    String newRouteName,
    RoutePredicate predicate, {
    Object? arguments,
    bool rootNavigator = false,
  }) {
    return Navigator.of(
      context,
      rootNavigator: rootNavigator,
    ).pushNamedAndRemoveUntil<T>(
      newRouteName,
      predicate,
      arguments: arguments,
    );
  }

  /// Push a named route as replacement with custom transition
  static Future<T?> pushReplacementNamed<T>(
    BuildContext context,
    String routeName, {
    Object? arguments,
    bool rootNavigator = false,
    bool isFromBottomToTop = false,
  }) {
    if (isFromBottomToTop) {
      return Navigator.of(context, rootNavigator: rootNavigator)
          .pushReplacement<T, dynamic>(
        CustomPageRoute<T>(
          pageBuilder: (context, animation, secondaryAnimation) {
            // This will be handled by the route generator
            return Container();
          },
          settings: RouteSettings(name: routeName, arguments: arguments),
          routeTransitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            const curve = Curves.ease;

            final tween = Tween(begin: begin, end: end)
                .chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ),
      );
    }

    return Navigator.of(
      context,
      rootNavigator: rootNavigator,
    ).pushReplacementNamed<T, dynamic>(
      routeName,
      arguments: arguments,
    );
  }

  /// Push a named route with scale transition
  static Future<T?> pushNamedWithScaleTransition<T>(
    BuildContext context,
    String routeName, {
    Object? arguments,
    bool rootNavigator = false,
    Duration duration = const Duration(milliseconds: 600),
  }) {
    return Navigator.of(context, rootNavigator: rootNavigator).push<T>(
      PageRouteBuilder(
        settings: RouteSettings(name: routeName, arguments: arguments),
        transitionDuration: duration,
        pageBuilder: (context, animation, secondaryAnimation) {
          // This will be handled by the route generator
          return Container();
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.easeOutQuint,
            ),
          );
          return ScaleTransition(scale: scaleAnimation, child: child);
        },
      ),
    );
  }

  /// Pop the current route
  static void pop(BuildContext context, [dynamic result]) {
    Navigator.of(context).pop(result);
  }

  /// Pop routes until predicate is true
  static void popUntil(BuildContext context, RoutePredicate predicate) {
    Navigator.of(context).popUntil(predicate);
  }

  /// Push a named route and provide a ViewModel
  static Future<T?> pushNamedWithProvideViewModel<R extends BaseViewModel, T>(
    BuildContext context,
    R viewModel,
    String routeName, {
    Object? arguments,
    bool rootNavigator = false,
  }) {
    final enhancedArguments = {
      'viewModel': viewModel,
      'originalArguments': arguments,
    };

    return pushNamed<T>(
      context,
      routeName,
      arguments: enhancedArguments,
      rootNavigator: rootNavigator,
    );
  }

  /// Push a named route and provide two ViewModels
  static Future<T?> pushNamedWithProvideTwoViewModel<
      V extends BaseViewModel,
      R extends BaseViewModel,
      T>(
    BuildContext context,
    R viewModel,
    V secondViewModel,
    String routeName, {
    Object? arguments,
    bool rootNavigator = false,
  }) {
    final enhancedArguments = {
      'viewModel': viewModel,
      'secondViewModel': secondViewModel,
      'originalArguments': arguments,
    };

    return pushNamed<T>(
      context,
      routeName,
      arguments: enhancedArguments,
      rootNavigator: rootNavigator,
    );
  }

  /// Push a named route as replacement and provide a ViewModel
  static Future<T?> pushReplacementNamedWithProvideViewModel<
      R extends BaseViewModel,
      T>(
    BuildContext context,
    R viewModel,
    String routeName, {
    Object? arguments,
    bool rootNavigator = false,
  }) {
    final enhancedArguments = {
      'viewModel': viewModel,
      'originalArguments': arguments,
    };

    return pushReplacementNamed<T>(
      context,
      routeName,
      arguments: enhancedArguments,
      rootNavigator: rootNavigator,
    );
  }
}


