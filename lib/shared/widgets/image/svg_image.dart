import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foody/shared/utils/auto_layout/screen_utils.dart';
export 'package:flutter_svg/flutter_svg.dart';

/// @deprecated Use [AppSvgImage] instead. This class will be removed in a future version.
/// 
/// Migration guide:
/// ```dart
/// // Old:
/// SvgImage('assets/icons/icon.svg', size: 24, color: Colors.blue)
/// 
/// // New:
/// AppSvgImage(
///   assetPath: 'assets/icons/icon.svg',
///   size: 24,
///   color: Colors.blue,
/// )
/// ```
@Deprecated('Use AppSvgImage instead')
class SvgImage extends StatelessWidget {
  const SvgImage(this.icon, {super.key, this.color, this.size});

  final String icon;
  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size?.h,
      width: size?.w,
      child: SvgPicture.asset(icon,
          colorFilter:
              color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null),
    );
  }
}
