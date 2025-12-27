
import 'package:flutter/material.dart';
import 'package:foody/core/theme/color/app_colors.dart';

class RippleInkWell extends StatelessWidget {
  const RippleInkWell({
    super.key,
    required this.onTap,
    required this.child,
    this.rippleColor,
    this.borderRadius,
  });

  final Function()? onTap;
  final Color? rippleColor;
  final BorderRadius? borderRadius;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final color =onTap==null? null: rippleColor ?? AppColors.grey100.withValues(alpha: .8);
    return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius:borderRadius ,
          focusColor: color,
          splashColor: color,
          highlightColor: color,
          overlayColor: WidgetStateProperty.all(color),
          hoverColor: color,
          child: child,
        ));
  }
}
