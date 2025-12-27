


import 'package:flutter/material.dart';
import 'package:flutter_skeleton_ui/flutter_skeleton_ui.dart';

class SkeletonHelper {

  /// Image
  static Widget image({
    double width = double.infinity,
    double height = double.infinity,
    BorderRadius? borderRadius,
  }) {
    return SkeletonAvatar(
        style: SkeletonAvatarStyle(
          width: width,
          height: height,
          borderRadius: borderRadius ?? BorderRadius.zero,
          randomHeight: false,
          randomWidth: false,
        ));
  }
  ///Line
  static Widget line(
      {double height = 16, double radius = 8,double maxLength= 200}) {
    return SkeletonLine(
      style: SkeletonLineStyle(
        height: height,

        randomLength: true,
        minLength: maxLength/2,
        maxLength: maxLength,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}
