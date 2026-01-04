import 'package:foody/common_imports.dart';
import 'package:foody/presentation/review/review_view_model.dart';
import 'package:foody/presentation/review/widgets/review_first_page.dart';
import 'package:foody/presentation/review/widgets/review_second_page.dart';
import 'package:foody/shared/widgets/buttons/buttons.dart';
import 'package:flutter/services.dart';

class ReviewPagerView extends StatefulWidget {
  const ReviewPagerView({super.key});

  @override
  State<ReviewPagerView> createState() => _ReviewPagerViewState();
}

class _ReviewPagerViewState extends State<ReviewPagerView> {
  late PageController _pageController;
  int _pageIndex = 0;
  final int length = 2;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = S.current;
    final viewModel = Provider.of<ReviewViewModel>(context);

    return ValueListenableBuilder<bool>(
      valueListenable: viewModel.isLoading,
      builder: (context, isLoading, _) {
        return IgnorePointer(
          ignoring: isLoading,
          child: Column(
            children: [
              // Bottom sheet line
              Container(
                width: 40.w,
                height: 4.h,
                margin: EdgeInsets.only(bottom: 16.h),
                decoration: BoxDecoration(
                  color: AppColors.grey300,
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    l10n.reviewLeaveAReview,
                    typography: AppTypography.headingSmallBold,
                    color: AppColors.textPrimary,
                  ),
                  RippleInkWell(
                    onTap: () => Navigator.of(context).pop(),
                    borderRadius: BorderRadius.circular(20.r),
                    child: Padding(
                      padding: EdgeInsets.all(4.w),
                      child: Icon(
                        Icons.close,
                        size: 28.w,
                        color: AppColors.iconPrimary,
                      ),
                    ),
                  ),
                ],
              ),
              Divider(color: AppColors.grey200),
              GapH(20.h),
              // Pager content
              _pager(viewModel),
              GapH(20.h),
              // Action button
              ValueListenableBuilder<bool>(
                valueListenable: viewModel.isLoading,
                builder: (context, isLoading, _) {
                  return PrimaryButton(
                    isLoading: isLoading,
                    text: _pageIndex == 0 ? l10n.reviewNext : l10n.reviewSubmitReview,
                    onPressed: () async {
                      // Hide keyboard
                      FocusScope.of(context).unfocus();
                      SystemChannels.textInput.invokeMethod('TextInput.hide');
                      
                      if (_pageIndex == 0) {
                        _pageIndex++;
                        animate();
                      } else {
                        final result = await viewModel.submitReview();
                        if (result.isSuccess) {
                          Navigator.of(context).pop(true);
                        } else {
                          final failure = result as Failure;
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: AppText(
                                failure.message,
                                typography: AppTypography.bodyMediumRegular,
                                color: AppColors.white,
                              ),
                              backgroundColor: AppColors.red500,
                            ),
                          );
                        }
                      }
                    },
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void animate() {
    _pageController.animateToPage(
      _pageIndex,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeIn,
    );
  }

  Widget _pager(ReviewViewModel viewModel) {
    return Expanded(
      child: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
        itemCount: length,
        controller: _pageController,
        itemBuilder: (context, index) {
          return SingleChildScrollView(
            child: index == 0
                ? ReviewFirstPage(
                    initialValue: viewModel.rating.value,
                    onRatingUpdate: viewModel.setRating,
                  )
                : ReviewSecondPage(
                    controller: viewModel.commentController,
                  ),
          );
        },
      ),
    );
  }
}

