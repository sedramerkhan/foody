# Text Package - Refactored

This package provides a simplified, flexible text widget system for the Foody app.

## Overview

The text package has been refactored to:
- Separate configuration from styling
- Provide convenient factory constructors for common use cases
- Simplify the API with clear separation of concerns
- Better organization and maintainability

## New Structure

```
text/
├── app_text.dart              # Main simplified widget
├── app_text_config.dart       # Behavior configuration
├── app_text_style.dart        # Visual styling
├── text.dart                  # Barrel export file
└── custom_text.dart           # Deprecated (old file)
```

## Quick Start

### Import
```dart
import 'package:foody/shared/widgets/text/text.dart';
```

### Basic Usage

#### Simple Text
```dart
AppText.simple('Hello World')
```

#### With Style
```dart
AppText(
  'Hello World',
  config: AppTextConfig.singleLine(),
  style: AppTextWidgetStyle.primary(),
)
```

#### Multi-line Text
```dart
AppText(
  'This is a longer text that will wrap to multiple lines',
  config: AppTextConfig.multiLine(maxLines: 3),
  style: AppTextWidgetStyle.standard(),
)
```

#### Custom Styling
```dart
AppText(
  'Custom Text',
  config: AppTextConfig.singleLine(),
  style: AppTextWidgetStyle(
    typography: AppTypography.headingLargeBold,
    color: Colors.blue,
  ),
)
```

## Configuration Options

### AppTextConfig Properties

- `maxLines`: Maximum number of lines (null for unlimited)
- `overflow`: How to handle text overflow (default: ellipsis)
- `textAlign`: Text alignment (default: start)

### Factory Constructors

```dart
AppTextConfig.singleLine()        // Single line with ellipsis
AppTextConfig.multiLine(maxLines: 3)  // Multi-line with limit
AppTextConfig.unlimited()        // Unlimited lines
```

### AppTextWidgetStyle Properties

- `typography`: Typography style from theme
- `color`: Text color
- `textDecoration`: Text decoration (underline, etc.)

### Pre-built Styles

```dart
AppTextWidgetStyle.standard()      // Default style
AppTextWidgetStyle.primary()       // Primary text color
AppTextWidgetStyle.secondary()     // Secondary text color
AppTextWidgetStyle.brand()         // Brand text color
AppTextWidgetStyle.error()         // Error text color
AppTextWidgetStyle.underlined()    // Underlined text
```

## Examples

### Headings
```dart
AppText(
  'Page Title',
  config: AppTextConfig.singleLine(),
  style: AppTextWidgetStyle(
    typography: AppTypography.headingLargeBold,
    color: AppColors.textPrimary,
  ),
)
```

### Body Text
```dart
AppText(
  'This is body text that can wrap to multiple lines',
  config: AppTextConfig.multiLine(maxLines: 5),
  style: AppTextWidgetStyle.secondary(),
)
```

### Error Message
```dart
AppText(
  'This field is required',
  config: AppTextConfig.singleLine(),
  style: AppTextWidgetStyle.error(),
)
```

### Link Text
```dart
AppText(
  'Click here',
  config: AppTextConfig.singleLine(),
  style: AppTextWidgetStyle.underlined(
    color: AppColors.textBrand,
  ),
)
```

### Simple Usage
```dart
// Quick and simple
AppText.simple(
  'Hello World',
  color: AppColors.textPrimary,
  maxLines: 2,
)
```

## Migration Guide

### From `CustomText` to `AppText`

**Before:**
```dart
CustomText(
  'Hello World',
  typography: AppTypography.bodyLargeMedium,
  color: AppColors.textPrimary,
  maxLines: 2,
  textAlign: TextAlign.center,
)
```

**After:**
```dart
AppText(
  'Hello World',
  config: AppTextConfig.multiLine(maxLines: 2)
    .copyWith(textAlign: TextAlign.center),
  style: AppTextWidgetStyle.primary(),
)
```

**Or simpler:**
```dart
AppText.simple(
  'Hello World',
  typography: AppTypography.bodyLargeMedium,
  color: AppColors.textPrimary,
  maxLines: 2,
  textAlign: TextAlign.center,
)
```

## Deprecated Classes

The following class is deprecated and will be removed in a future version:

- `CustomText` → Use `AppText`

This class remains available for backward compatibility but should not be used in new code.

## Best Practices

1. **Use `AppText.simple()`** for quick, simple text
2. **Use factory constructors** for common configs (.singleLine(), .multiLine())
3. **Use pre-built styles** for common appearances (.primary(), .secondary(), .brand())
4. **Separate styling from behavior** using AppTextConfig and AppTextWidgetStyle
5. **Set maxLines appropriately** to prevent layout issues

## Support

For issues or questions, please contact the development team.

