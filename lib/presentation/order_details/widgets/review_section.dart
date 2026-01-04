import 'package:foody/common_imports.dart';
import 'package:foody/presentation/order_details/order_details_view_model.dart';
import 'package:foody/presentation/review/review_bottom_sheet.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';

class ReviewSection extends StatelessWidget {
  final OrderDetails orderDetails;
  final OrderDetailsViewModel viewModel;

  const ReviewSection({
    super.key,
    required this.orderDetails,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = S.current;
    final review = orderDetails.review;
    final dateFormat = DateFormat('MMM dd, yyyy');

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.bgSurfaceSecondary,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: AppColors.borderPrimary,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            l10n.reviewYourReview,
            typography: AppTypography.headingSmallBold,
            color: AppColors.textPrimary,
          ),
          if (orderDetails.canReview) ...[
            GapH(16.h),
            PrimaryButton(
              text: l10n.reviewLeaveAReview,
              onPressed: () async {
                final result = await showReviewBottomSheet(context, orderDetails.order.orderId);
                if (result == true) {
                  // Reload order details to show the new review
                  viewModel.loadOrderDetails(orderDetails.order.orderId);
                }
              },
            ),
            GapH(16.h),
          ],
          if (review != null) ...[
            GapH(16.h),
            Row(
              children: [
                RatingBar.builder(
                  initialRating: review.rating,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  ignoreGestures: true,
                  itemCount: 5,
                  itemSize: 20.w,
                  itemPadding: EdgeInsets.symmetric(horizontal: 2.w),
                  itemBuilder: (context, _) => Icon(
                    Icons.star_rounded,
                    color: AppColors.star,
                  ),
                  onRatingUpdate: (_) {},
                ),
                GapW(8.w),
                AppText(
                  dateFormat.format(review.createdAt),
                  typography: AppTypography.bodySmallRegular,
                  color: AppColors.textSecondaryAlt,
                ),
              ],
            ),
            if (review.comment != null && review.comment!.isNotEmpty) ...[
              GapH(12.h),
              AppText(
                review.comment!,
                typography: AppTypography.bodyMediumRegular,
                color: AppColors.textPrimary,
              ),
            ],
          ] else if (orderDetails.canReview) ...[
            GapH(12.h),
            AppText(
              l10n.reviewNoReviewYet,
              typography: AppTypography.bodyMediumRegular,
              color: AppColors.textSecondaryAlt,
            ),
          ],
        ],
      ),
    );
  }
}

