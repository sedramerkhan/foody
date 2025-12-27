# Image Package - Refactored

This package provides a simplified, flexible image system for the Foody app.

## Overview

The image package has been refactored to:
- Separate configuration from styling
- Provide better error handling and retry logic
- Simplify the API with clear separation of concerns
- Better organization and maintainability

## New Structure

```
image/
├── app_network_image.dart      # Network image with caching
├── app_svg_image.dart          # SVG image widget
├── app_image_config.dart       # Behavior configuration
├── app_image_style.dart       # Visual styling
├── image_state.dart            # Image loading states
└── image.dart                  # Barrel export file
```

## Quick Start

### Import
```dart
import 'package:foody/shared/widgets/image/image.dart';
```

### Basic Usage

#### Network Image
```dart
AppNetworkImage(
  config: AppImageConfig.standard(
    imageUrl: 'https://example.com/image.jpg',
    width: 200,
    height: 200,
  ),
  style: AppImageStyle.rounded(radius: 12),
)
```

#### Full Width Image
```dart
AppNetworkImage(
  config: AppImageConfig.fullWidth(
    imageUrl: 'https://example.com/banner.jpg',
    height: 200,
  ),
)
```

#### Square Image
```dart
AppNetworkImage(
  config: AppImageConfig.square(
    imageUrl: 'https://example.com/avatar.jpg',
    size: 100,
  ),
  style: AppImageStyle.circular(),
)
```

#### SVG Image
```dart
AppSvgImage(
  assetPath: 'assets/icons/icon.svg',
  size: 24,
  color: Colors.blue,
)
```

## Configuration Options

### AppImageConfig Properties

- `imageUrl`: URL of the image to load
- `width`: Fixed width of the image
- `height`: Fixed height of the image
- `fit`: How the image should be inscribed (BoxFit.cover, etc.)
- `maxRetries`: Maximum retry attempts for failed loads (default: 3)
- `errorWidget`: Custom widget to show on error
- `color`: Color overlay for the image

### Factory Constructors

```dart
AppImageConfig.standard(
  imageUrl: 'https://example.com/image.jpg',
  width: 200,
  height: 200,
)

AppImageConfig.fullWidth(
  imageUrl: 'https://example.com/banner.jpg',
  height: 200,
)

AppImageConfig.square(
  imageUrl: 'https://example.com/avatar.jpg',
  size: 100,
)
```

### AppImageStyle Properties

- `borderRadius`: Corner radius of the image
- `backgroundColor`: Background color behind the image
- `placeholder`: Custom placeholder widget
- `errorWidget`: Custom error widget

### Pre-built Styles

```dart
AppImageStyle.standard()              // No border radius
AppImageStyle.rounded(radius: 12)     // Rounded corners
AppImageStyle.circular()              // Circular image
AppImageStyle.withBackground()        // With background color
```

## Examples

### Profile Avatar
```dart
AppNetworkImage(
  config: AppImageConfig.square(
    imageUrl: user.avatarUrl,
    size: 80,
  ),
  style: AppImageStyle.circular(),
)
```

### Banner Image
```dart
AppNetworkImage(
  config: AppImageConfig.fullWidth(
    imageUrl: banner.imageUrl,
    height: 200,
  ),
  style: AppImageStyle.rounded(radius: 16),
)
```

### Image with Custom Error Widget
```dart
AppNetworkImage(
  config: AppImageConfig.standard(
    imageUrl: product.imageUrl,
    width: 150,
    height: 150,
    errorWidget: Icon(Icons.image_not_supported),
  ),
  style: AppImageStyle.rounded(radius: 8),
)
```

### SVG Icon
```dart
AppSvgImage(
  assetPath: 'assets/icons/heart.svg',
  size: 24,
  color: Colors.red,
)
```

## Migration Guide

### From `CustomCachedNetworkImage` to `AppNetworkImage`

**Before:**
```dart
CustomCachedNetworkImage(
  imageUrl: 'https://example.com/image.jpg',
  width: 200,
  height: 200,
  borderRadius: BorderRadius.circular(12),
)
```

**After:**
```dart
AppNetworkImage(
  config: AppImageConfig.standard(
    imageUrl: 'https://example.com/image.jpg',
    width: 200,
    height: 200,
  ),
  style: AppImageStyle.rounded(radius: 12),
)
```

### From `SvgImage` to `AppSvgImage`

**Before:**
```dart
SvgImage('assets/icons/icon.svg', size: 24, color: Colors.blue)
```

**After:**
```dart
AppSvgImage(
  assetPath: 'assets/icons/icon.svg',
  size: 24,
  color: Colors.blue,
)
```

## Deprecated Classes

The following classes are deprecated and will be removed in a future version:

- `CustomCachedNetworkImage` → Use `AppNetworkImage`
- `SvgImage` → Use `AppSvgImage`

These classes remain available for backward compatibility but should not be used in new code.

## Features

- ✅ Automatic retry logic for failed image loads
- ✅ URL validation before loading
- ✅ Loading placeholders with skeleton
- ✅ Custom error widgets
- ✅ Caching support via cached_network_image
- ✅ Color overlays
- ✅ Flexible sizing options

## Best Practices

1. **Use factory constructors** for common configs (.standard(), .fullWidth(), .square())
2. **Use pre-built styles** for common appearances (.rounded(), .circular())
3. **Provide error widgets** for better UX when images fail to load
4. **Use appropriate fit modes** (BoxFit.cover for thumbnails, BoxFit.contain for full images)
5. **Set maxRetries** appropriately based on network reliability

## Support

For issues or questions, please contact the development team.

