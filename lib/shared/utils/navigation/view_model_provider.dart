import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:foody/core/base/view_model/base_view_model.dart';

/// Provides a single ViewModel to the subtree.
/// 
/// If `arguments['viewModel']` already contains an instance of `T`, reuse it.
/// Otherwise create a new instance via `createViewModel`.
Widget provideViewModel<T extends BaseViewModel>({
  required Widget child,
  required T Function() createViewModel,
  Map<String, dynamic>? arguments,
}) {
  final viewModel = arguments?['viewModel'];
  
  if (viewModel != null && viewModel is T) {
    return ChangeNotifierProvider<T>.value(
      value: viewModel,
      child: child,
    );
  }
  
  return ChangeNotifierProvider<T>(
    create: (_) => createViewModel(),
    child: child,
  );
}

/// Provides two ViewModels to the subtree.
/// 
/// If viewModels are provided in arguments, reuse them.
/// Otherwise create new instances via the factory functions.
Widget provideTwoViewModels<T extends BaseViewModel, V extends BaseViewModel>({
  required Widget child,
  required T Function() createFirstViewModel,
  required V Function() createSecondViewModel,
  Map<String, dynamic>? arguments,
}) {
  final firstViewModel = arguments?['viewModel'];
  final secondViewModel = arguments?['secondViewModel'];
  
  return MultiProvider(
    providers: [
      // First ViewModel
      if (firstViewModel != null && firstViewModel is T)
        ChangeNotifierProvider<T>.value(value: firstViewModel)
      else
        ChangeNotifierProvider<T>(create: (_) => createFirstViewModel()),
      
      // Second ViewModel
      if (secondViewModel != null && secondViewModel is V)
        ChangeNotifierProvider<V>.value(value: secondViewModel)
      else
        ChangeNotifierProvider<V>(create: (_) => createSecondViewModel()),
    ],
    child: child,
  );
}

