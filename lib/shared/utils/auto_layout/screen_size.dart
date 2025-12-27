import 'package:flutter/material.dart';

class ScreenSize {
  static bool isSmallDevice(BuildContext context) =>
      MediaQuery.sizeOf(context).height < 800;

  static bool isBigDevice(BuildContext context) =>
      MediaQuery.sizeOf(context).width > 600;

  static double getHeight(BuildContext context) => MediaQuery.sizeOf(context).height;

  static double getWidth(BuildContext context) => MediaQuery.sizeOf(context).width;
}
