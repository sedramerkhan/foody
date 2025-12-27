import 'package:flutter/material.dart';
import 'package:foody/common_imports.dart';
import 'package:foody/core/theme/color/app_colors.dart';
import 'package:foody/core/theme/typography/app_typography.dart';
import 'package:foody/shared/utils/auto_layout/screen_utils.dart';
import 'package:foody/shared/widgets/gap/gaph.dart';
import 'package:foody/shared/widgets/image/svg_image.dart';
import 'package:foody/shared/widgets/text/app_text.dart';

class NoResult extends StatelessWidget {
  final String title;
  final String? subTitle;
  final String? svgPath;

  const NoResult({
    super.key,
    required this.title,
    this.subTitle,
    this.svgPath,

  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width * .6,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (svgPath != null) ...[
              SvgImage(svgPath!),
              GapH(12.h),
            ],
            AppText(
              title,
              typography: AppTypography.headingSmallBold,
              overflow: TextOverflow.visible,
              textAlign: TextAlign.center,
            ),
            if (subTitle != null) ...[
              GapH(8.h),
              AppText(
                subTitle!,
                typography: AppTypography.bodyMediumRegular,
                color: AppColors.textPrimary,
                textAlign: TextAlign.center,
                overflow: TextOverflow.visible,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
