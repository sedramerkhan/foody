import 'package:flutter/material.dart';

/// Custom page route with configurable transitions
class CustomPageRoute<T> extends PageRouteBuilder<T> {
  final Widget? page;
  final RouteTransitionsBuilder? routeTransitionsBuilder;
  final Duration _transitionDuration;

  CustomPageRoute({
    this.page,
    RouteTransitionsBuilder? routeTransitionsBuilder,
    Duration? transitionDuration,
    super.settings,
    RoutePageBuilder? pageBuilder,
  })  : _transitionDuration = transitionDuration ?? const Duration(milliseconds: 180),
        routeTransitionsBuilder = routeTransitionsBuilder,
        super(
          pageBuilder: pageBuilder ??
              (page != null
                  ? ((context, animation, secondaryAnimation) => page!)
                  : throw ArgumentError(
                      'Either page or pageBuilder must be provided')),
          transitionDuration:
              transitionDuration ?? const Duration(milliseconds: 180),
          transitionsBuilder: routeTransitionsBuilder ??
              ((context, animation, secondaryAnimation, child) => child),
        );

  @override
  Duration get transitionDuration => _transitionDuration;
}

