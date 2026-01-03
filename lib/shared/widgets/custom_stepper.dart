import 'package:easy_stepper/easy_stepper.dart';
import 'package:foody/common_imports.dart';

class CustomStepper extends StatelessWidget {
  const CustomStepper(
      {super.key, required this.activeStep, required this.steps});

  final int activeStep;
  final List<String> steps;

  @override
  Widget build(BuildContext context) {
    return EasyStepper(
      padding: EdgeInsets.zero,
      activeStep: activeStep,
      internalPadding: 0,
      enableStepTapping: false,
      stepRadius: 24.w,
      showStepBorder: false,
      // fitWidth: true,
      disableScroll: true,
      activeStepBackgroundColor: Colors.transparent,
      finishedStepBackgroundColor: Colors.transparent,
      showTitle: true,
      showLoadingAnimation: false,

      ///Line Style
      lineStyle: LineStyle(
          lineType: LineType.dashed,
          lineThickness: 2,
          unreachedLineColor: AppColors.grey200,
          finishedLineColor: AppColors.grey200,
          defaultLineColor: AppColors.grey200),
      steps:
      steps.mapIndexed((index, step) => _buildStep(index, step)).toList(),
    );
  }

  EasyStep _buildStep(int index, String step) {
    const double size = 40;
    final beforeActive = activeStep >= index;
    return EasyStep(
      ///Title
      customTitle: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: CustomText(
            step,
            typography: AppTypography.bodyXSmallMedium,
            color: AppColors.textPrimary,
            overflow: TextOverflow.visible,textAlign: TextAlign.center,
          ),
        ),
      ),
      customStep: Container(
        height: size.h,
        width: size.w,

        ///Border
        decoration: BoxDecoration(
            color: AppColors.white,
            shape: BoxShape.circle,
            border: beforeActive
                ? Border.all(color: AppColors.brand100, width: 4)
                : null),

        ///Circle Icon
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              boxShadow: beforeActive
                  ? [
                const BoxShadow(
                  color: Color(0x57576F85),
                  offset: Offset(0, 4),
                  blurRadius: 8,
                  spreadRadius: 0,
                ),
              ]
                  : null,
            ),
            child: beforeActive
                ? CircleAvatar(
                radius: 10.w,
                backgroundColor: AppColors.iconBrand,
                child: Icon(
                  Icons.check,
                  color: AppColors.white,
                  size: 15.w,
                ))
                : CircleAvatar(
              radius: 15.w,
              backgroundColor: AppColors.grey200,
            ),
          ),
        ),
      ),
    );
  }
}
