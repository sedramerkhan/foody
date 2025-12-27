import 'dart:ui';

class ScreenUtil {
  static double scaleWidth = 1.0;
  static double scaleHeight = 1.0;
  static double scaleText = 1.0;

  static void init({required Size designSize, required Size deviceSize}) {
    scaleWidth = deviceSize.width / designSize.width;
    scaleHeight = deviceSize.height / designSize.height;
    scaleText = scaleWidth; // Scale text based on width
  }

  static double setWidth(double inputWidth) => inputWidth * scaleWidth;

  static double setHeight(double inputHeight) => inputHeight * scaleHeight;

  static double setTextSize(double inputTextSize) {
    final scaled= inputTextSize * scaleText;
    return scaled.clamp(inputTextSize * 0.85, inputTextSize * 1.2);
  }
}

extension ScreenUtilExtensions on num {
  double get w => ScreenUtil.setWidth(toDouble());

  double get h => ScreenUtil.setHeight(toDouble());

  double get sp => ScreenUtil.setTextSize(toDouble());
}
