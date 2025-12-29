import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foody/core/theme/color/app_colors.dart';
import 'package:foody/shared/utils/skeleton_helper.dart';
import 'package:http/http.dart' as http;
import 'app_image_config.dart';
import 'app_image_style.dart';
import 'image_state.dart';

/// A simplified network image widget with caching, retry logic, and loading states.
/// 
/// This widget provides a clean API for displaying network images with consistent
/// behavior while allowing full customization through [AppImageConfig] and [AppImageStyle].
/// 
/// Example:
/// ```dart
/// AppNetworkImage(
///   config: AppImageConfig.standard(
///     imageUrl: 'https://example.com/image.jpg',
///     width: 200,
///     height: 200,
///   ),
///   style: AppImageStyle.rounded(radius: 12),
/// )
/// ```
class AppNetworkImage extends StatefulWidget {
  /// Configuration for behavior (URL, dimensions, fit, etc.)
  final AppImageConfig config;

  /// Visual styling configuration
  final AppImageStyle? style;

  const AppNetworkImage({
    super.key,
    required this.config,
    this.style,
  });

  @override
  State<AppNetworkImage> createState() => _AppNetworkImageState();
}

class _AppNetworkImageState extends State<AppNetworkImage> {
  final ValueNotifier<ImageState> _imageState =
      ValueNotifier<ImageState>(ImageState.loading);
  int _retryCount = 0;
  bool _hasValidatedUrl = false;

  @override
  void initState() {
    super.initState();
    _validateUrl(widget.config.imageUrl);
  }

  @override
  void didUpdateWidget(AppNetworkImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.config.imageUrl != widget.config.imageUrl) {
      _hasValidatedUrl = false;
      _retryCount = 0;
      _validateUrl(widget.config.imageUrl);
    }
  }

  @override
  void dispose() {
    _imageState.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final imageStyle = widget.style ?? AppImageStyle.standard();

    return SizedBox(
      width: widget.config.width,
      height: widget.config.height,
      child: ValueListenableBuilder<ImageState>(
        valueListenable: _imageState,
        builder: (context, state, child) {
          switch (state) {
            case ImageState.loading:
              return _buildPlaceholder(imageStyle);

            case ImageState.success:
              return CachedNetworkImage(
                imageUrl: widget.config.imageUrl,
                cacheKey: widget.config.imageUrl,
                placeholder: (context, url) => _buildPlaceholder(imageStyle),
                errorWidget: (context, url, error) => _buildErrorWidget(imageStyle),
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: imageStyle.borderRadius,
                    color: widget.config.color ?? imageStyle.backgroundColor,
                    image: DecorationImage(
                      filterQuality: FilterQuality.high,
                      image: imageProvider,
                      fit: widget.config.fit,
                    ),
                  ),
                ),
              );

            case ImageState.error:
              if (_retryCount < widget.config.maxRetries) {
                _retryCount++;
                _validateUrl(widget.config.imageUrl);
              }
              return _buildErrorWidget(imageStyle);
          }
        },
      ),
    );
  }

  Future<void> _validateUrl(String url) async {
    if (_hasValidatedUrl && url == widget.config.imageUrl) {
      return;
    }

    if (!mounted) return;
    _safeSetImageState(ImageState.loading);
    try {
      final uri = Uri.tryParse(url);
      if (uri != null && uri.hasAbsolutePath) {
        final response = await http.head(uri);
        if (!mounted) return;
        _hasValidatedUrl = true;
        _safeSetImageState(
            response.statusCode == 200 ? ImageState.success : ImageState.error);
      } else {
        if (!mounted) return;
        _safeSetImageState(ImageState.error);
      }
    } catch (e) {
      if (!mounted) return;
      _safeSetImageState(ImageState.error);
    }
  }

  void _safeSetImageState(ImageState state) {
    if (mounted) {
      try {
        _imageState.value = state;
      } catch (_) {
        // ValueNotifier was disposed, ignore silently
      }
    }
  }

  Widget _buildPlaceholder(AppImageStyle style) {
    if (style.placeholder != null) {
      return style.placeholder!;
    }

    return SkeletonHelper.image(
      width: widget.config.width ?? double.infinity,
      height: widget.config.height ?? 200,
      borderRadius: style.borderRadius,
    );
  }

  Widget _buildErrorWidget(AppImageStyle style) {
    if (style.errorWidget != null) {
      return style.errorWidget!;
    }

    if (widget.config.errorWidget != null) {
      return widget.config.errorWidget!;
    }

    return Container(
      decoration: BoxDecoration(
        color: AppColors.bgSurfaceSecondary,
        borderRadius: style.borderRadius,
      ),
    );
  }
}

