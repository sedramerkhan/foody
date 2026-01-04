import 'package:foody/common_imports.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewFirstPage extends StatelessWidget {
  const ReviewFirstPage({
    super.key,
    required this.onRatingUpdate,
    required this.initialValue,
  });

  final Function(double) onRatingUpdate;
  final double initialValue;

  @override
  Widget build(BuildContext context) {
    final l10n = S.current;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          l10n.reviewHowWasYourOrder,
          typography: AppTypography.bodyMediumMedium,
          color: AppColors.textPrimary,
        ),
        GapH(8.h),
        AppText(
          l10n.reviewPleaseGiveYourRating,
          typography: AppTypography.bodyMediumRegular,
          color: AppColors.textSecondaryAlt,
        ),
        GapH(32.h),
        Align(
          alignment: Alignment.center,
          child: RatingBar.builder(
            initialRating: initialValue,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            unratedColor: AppColors.grey200,
            glowRadius: 1,
            glowColor: AppColors.grey300,
            itemCount: 5,
            itemSize: 40.w,
            itemPadding: EdgeInsets.symmetric(horizontal: 2.w),
            itemBuilder: (context, _) => Icon(
              Icons.star_rounded,
              color: AppColors.star,
            ),
            onRatingUpdate: (rating) {
              onRatingUpdate(rating);
            },
            wrapAlignment: WrapAlignment.center,
          ),
        ),
      ],
    );
  }
}

