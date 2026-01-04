import 'package:flutter/material.dart';
import 'package:foody/common_imports.dart';
import 'package:foody/core/theme/color/app_colors.dart';
import 'package:foody/core/theme/typography/app_typography.dart';
import 'package:foody/shared/utils/auto_layout/screen_utils.dart';
import 'package:foody/shared/widgets/buttons/buttons.dart';
import 'package:foody/shared/widgets/text/app_text.dart';

class TryAgain extends StatelessWidget {
  final String message;
  final String? subMessage;
  final Function()? onTapButton;
  final Function()? onTapIcon;
  final Widget? icon;

  const TryAgain({
    super.key,
    required this.message,
    this.onTapButton,
    this.onTapIcon,
    this.subMessage,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) ...[
            icon!,
            SizedBox(height: 16.h),
          ],
          AppText(
            message,
            typography: AppTypography.bodyLargeMedium,
            color: AppColors.black,
            textAlign: TextAlign.center,
          ),
          if (subMessage != null) ...[
            SizedBox(height: 8.h),
            AppText(
              subMessage!,
              typography: AppTypography.bodyMediumRegular,
              textAlign: TextAlign.center,
            ),
          ],
          SizedBox(height: 30.h),
          if (onTapButton != null)
            PrimaryButton(
              text: S.current.commonTryAgain,
              onPressed: onTapButton,
              isLoading: false,
              width: 177.w,
              height: 40,
            ),
        ],
      ),
    );
  }
}
