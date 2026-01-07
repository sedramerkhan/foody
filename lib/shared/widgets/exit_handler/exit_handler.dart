import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foody/common_imports.dart';

/// Widget that handles double back press to exit the app
/// Shows a toast on first back press, exits app on second press
class ExitHandler extends StatefulWidget {
  final Widget child;
  final bool enabled;

  const ExitHandler({
    super.key,
    required this.child,
    this.enabled = true,
  });

  @override
  State<ExitHandler> createState() => _ExitHandlerState();
}

class _ExitHandlerState extends State<ExitHandler> {
  DateTime? _lastBackPressTime;
  static const Duration _exitDuration = Duration(seconds: 2);

  void _handleBackPress() {
    if (!widget.enabled) {
      SystemNavigator.pop();
      return;
    }

    final now = DateTime.now();
    
    // Check if back button was pressed recently (within exit duration)
    if (_lastBackPressTime == null ||
        now.difference(_lastBackPressTime!) > _exitDuration) {
      // First back press - show toast
      _lastBackPressTime = now;
      _showExitToast();
    } else {
      // Second back press within duration - exit app
      SystemNavigator.pop();
    }
  }

  void _showExitToast() {
    final l10n = S.current;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: AppText(
          l10n.commonPressAgainToExit,
          typography: AppTypography.bodyMediumRegular,
          color: AppColors.white,
        ),
        backgroundColor: AppColors.bgSurfaceSecondary,
        duration: _exitDuration,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (didPop) return;
        _handleBackPress();
      },
      child: widget.child,
    );
  }
}

