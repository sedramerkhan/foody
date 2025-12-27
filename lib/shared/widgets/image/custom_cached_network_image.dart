import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foody/core/theme/color/app_colors.dart';
import 'package:foody/shared/utils/skeleton_helper.dart';

import 'package:http/http.dart' as http;

import 'image_state.dart';

/// @deprecated Use [AppNetworkImage] instead. This class will be removed in a future version.
/// 
/// Migration guide:
/// ```dart
/// // Old:
/// CustomCachedNetworkImage(
///   imageUrl: 'https://example.com/image.jpg',
///   width: 200,
///   height: 200,
///   borderRadius: BorderRadius.circular(12),
/// )
/// 
/// // New:
/// AppNetworkImage(
///   config: AppImageConfig.standard(
///     imageUrl: 'https://example.com/image.jpg',
///     width: 200,
///     height: 200,
///   ),
///   style: AppImageStyle.rounded(radius: 12),
/// )
/// ```
@Deprecated('Use AppNetworkImage instead')
class CustomCachedNetworkImage extends StatefulWidget {
  const CustomCachedNetworkImage(
      {super.key,
      required this.imageUrl,
      required this.height,
      this.borderRadius = BorderRadius.zero,
      this.width = double.infinity,
      this.fit = BoxFit.cover,
      this.errorWidget,
      this.color});

  final String imageUrl;
  final double height;
  final BorderRadius borderRadius;
  final double width;
  final BoxFit fit;
  final Widget? errorWidget;
  final Color? color;

  @override
  State<CustomCachedNetworkImage> createState() =>
      _CustomCachedNetworkImageState();
}

class _CustomCachedNetworkImageState extends State<CustomCachedNetworkImage> {
  final ValueNotifier<ImageState> checkExist =
      ValueNotifier<ImageState>(ImageState.loading);

  int retryCount = 0;
  static const int maxRetries = 3;
  bool _hasValidatedUrl = false;

  @override
  void initState() {
    super.initState();
    _isUrlValid(widget.imageUrl);
  }

  @override
  void didUpdateWidget(CustomCachedNetworkImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Revalidate if URL changed
    if (oldWidget.imageUrl != widget.imageUrl) {
      // Reset validation flag when URL changes
      _hasValidatedUrl = false;
      retryCount = 0;
      _isUrlValid(widget.imageUrl);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: ValueListenableBuilder(
        valueListenable: checkExist,
        builder: (context, value, child) {
         // print("image state ...$value $retryCount ${widget.imageUrl}");

          switch (value) {
            case ImageState.loading:
              return _placeHolder();

            case ImageState.success:
              return CachedNetworkImage(
                imageUrl: widget.imageUrl,
                cacheKey: widget.imageUrl, 
                placeholder: (context, url) => _placeHolder(),
                errorWidget: (context, url, error) => _errorWidget(),
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: widget.borderRadius,
                    color: widget.color,
                    image: DecorationImage(
                      filterQuality: FilterQuality.high,
                      image: imageProvider,
                      fit: widget.fit,
                    ),
                  ),
                ),
              );

            case ImageState.error:
              if (retryCount < maxRetries) {
                retryCount++;
                _isUrlValid(widget.imageUrl);
              }
              return _errorWidget();
          }
        },
      ),
    );
  }

  Future<void> _isUrlValid(String text) async {
    if (_hasValidatedUrl && text == widget.imageUrl) {
      return; // Already validated this URL
    }
    
    checkExist.value = ImageState.loading;
    try {
      final uri = Uri.tryParse(text);
      if (uri != null && uri.hasAbsolutePath) {
        final response = await http.head(uri);
        _hasValidatedUrl = true;
        checkExist.value =
            response.statusCode == 200 ? ImageState.success : ImageState.error;
      } else {
        checkExist.value = ImageState.error;
      }
    } catch (e) {
      checkExist.value = ImageState.error;
    }
  }

  Widget _placeHolder() {
    return SkeletonHelper.image(
      width: widget.width,
      height: widget.height,
      borderRadius: widget.borderRadius,
    );
  }

  Widget _errorWidget() {
    return widget.errorWidget ??
        Container(
          decoration: BoxDecoration(
            color: AppColors.bgSurfaceSecondary,
            borderRadius: widget.borderRadius,
          ),
        );
  }
}
