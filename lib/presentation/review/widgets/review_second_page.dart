import 'package:foody/common_imports.dart';
import 'package:foody/shared/widgets/text_field/widgets/labeled_text_field.dart';
import 'package:foody/shared/widgets/text_field/app_text_field_config.dart';

class ReviewSecondPage extends StatelessWidget {
  const ReviewSecondPage({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final l10n = S.current;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          l10n.reviewHowWasYourExperience,
          typography: AppTypography.bodyMediumMedium,
          color: AppColors.textPrimary,
        ),
        GapH(16.h),
        LabeledTextField(
          label: l10n.reviewLeaveAComment,
          controller: controller,
          config: AppTextFieldConfig(
            hintText: l10n.reviewWhatDidYouLikeOrDislike,
            textInputAction: TextInputAction.done,
            maxLines: 4,
            isRequired: false,
          ),
          showRequiredIndicator: false,
        ),
      ],
    );
  }
}

