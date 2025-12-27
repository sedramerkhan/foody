# Buttons Package - Refactored

This package provides a simplified, flexible button system for the Foody app.

## Overview

The button package has been refactored to:
- Separate configuration from styling
- Provide specialized variants for common use cases
- Simplify the API from 10+ parameters to just 3 essential ones (child, config, style)
- Better organization and maintainability

## New Structure

```
buttons/
├── app_button.dart              # Main simplified widget
├── app_button_config.dart       # Behavior configuration
├── app_button_style.dart        # Visual styling
├── variants/
│   ├── primary_button.dart      # Primary action button
│   ├── outlined_button.dart     # Outlined secondary button
│   ├── text_button.dart         # Text button (tertiary)
│   └── icon_button.dart        # Icon-only button
└── buttons.dart                 # Barrel export file
```

## Quick Start

### Import
```dart
import 'package:foody/shared/widgets/buttons/buttons.dart';
```

### Basic Usage

#### Primary Button
```dart
PrimaryButton(
  text: 'Submit',
  onPressed: () => _handleSubmit(),
)
```

#### Outlined Button
```dart
OutlinedButton(
  text: 'Cancel',
  onPressed: () => _handleCancel(),
)
```

#### Text Button
```dart
AppTextButton(
  text: 'Skip',
  onPressed: () => _handleSkip(),
)
```

#### Icon Button
```dart
AppIconButton(
  icon: Icon(Icons.add),
  onPressed: () => _handleAdd(),
)
```

#### Custom Button
```dart
AppButton(
  child: Row(
    children: [
      Icon(Icons.save),
      SizedBox(width: 8),
      Text('Save'),
    ],
  ),
  config: AppButtonConfig.enabled(
    onPressed: () => _handleSave(),
  ),
  style: AppButtonStyle.primary(),
)
```

## Specialized Variants

### PrimaryButton

Main action button with brand colors, expands to full width by default.

```dart
PrimaryButton(
  text: 'Submit',
  onPressed: () => _handleSubmit(),
  isLoading: false,
  enabled: true,
  prefixIcon: Icon(Icons.check),
  suffixIcon: Icon(Icons.arrow_forward),
)
```

### OutlinedButton

Secondary action button with border.

```dart
OutlinedButton(
  text: 'Cancel',
  onPressed: () => _handleCancel(),
  isLoading: false,
)
```

### AppTextButton

Tertiary action button with no background.

```dart
AppTextButton(
  text: 'Skip',
  onPressed: () => _handleSkip(),
  underlined: false, // Set to true for underlined text
)
```

### AppIconButton

Icon-only button, typically circular.

```dart
AppIconButton(
  icon: Icon(Icons.add),
  onPressed: () => _handleAdd(),
  width: 48,
  height: 48,
  borderRadius: 24.0, // Circular
)
```

## Configuration Options

### AppButtonConfig Properties

- `onPressed`: Callback when button is pressed
- `isLoading`: Whether button is in loading state
- `enabled`: Whether button is enabled
- `width`: Fixed width of the button
- `height`: Height of the button (default: 48)
- `minWidth`: Minimum width of the button

### Factory Constructors

```dart
AppButtonConfig.enabled(
  onPressed: () => print('Clicked'),
  isLoading: false,
)

AppButtonConfig.disabled()

AppButtonConfig.loading()
```

### AppButtonStyle Properties

- `textStyle`: Text style for button label
- `backgroundColor`: Background color
- `foregroundColor`: Text/icon color
- `borderColor`: Border color
- `hoverColor`: Color when hovered/pressed
- `disabledBackgroundColor`: Background when disabled
- `disabledForegroundColor`: Text color when disabled
- `padding`: Internal padding
- `borderRadius`: Corner radius
- `elevation`: Shadow elevation

### Pre-built Styles

```dart
AppButtonStyle.primary()        // Brand color, white text
AppButtonStyle.secondary()       // Secondary background
AppButtonStyle.outlined()        // White background, brand border
AppButtonStyle.text()            // Transparent, brand text
AppButtonStyle.textUnderlined()  // Transparent, underlined text
AppButtonStyle.disabled()       // Disabled state
AppButtonStyle.disabledText()    // Disabled text button
```

## Examples

### Form Buttons
```dart
Column(
  children: [
    PrimaryButton(
      text: 'Submit',
      onPressed: () => _handleSubmit(),
      isLoading: _isSubmitting,
    ),
    SizedBox(height: 16),
    OutlinedButton(
      text: 'Cancel',
      onPressed: () => _handleCancel(),
    ),
  ],
)
```

### Button with Icons
```dart
PrimaryButton(
  text: 'Continue',
  onPressed: () => _handleContinue(),
  prefixIcon: Icon(Icons.arrow_back),
  suffixIcon: Icon(Icons.arrow_forward),
)
```

### Loading State
```dart
PrimaryButton(
  text: 'Processing',
  onPressed: null,
  isLoading: true,
)
```

### Disabled State
```dart
PrimaryButton(
  text: 'Submit',
  onPressed: () => _handleSubmit(),
  enabled: false,
)
```

### Custom Styling
```dart
AppButton(
  child: Text('Custom Button'),
  config: AppButtonConfig.enabled(
    onPressed: () => print('Clicked'),
  ),
  style: AppButtonStyle.primary().copyWith(
    borderRadius: 20.0,
    backgroundColor: Colors.blue,
  ),
)
```

## Migration Guide

### From `CustomButton` to `PrimaryButton`

**Before:**
```dart
CustomButton(
  text: "Submit",
  onPressed: () => _handleSubmit(),
  styleConfig: ButtonStyleConfig.primary,
  isLoading: false,
  width: double.infinity,
)
```

**After:**
```dart
PrimaryButton(
  text: "Submit",
  onPressed: () => _handleSubmit(),
  isLoading: false,
)
```

### From `CustomButton.text()` to `AppTextButton`

**Before:**
```dart
CustomButton.text(
  text: "Skip",
  onPressed: () => _handleSkip(),
)
```

**After:**
```dart
AppTextButton(
  text: "Skip",
  onPressed: () => _handleSkip(),
)
```

### From `CustomButton.icon()` to `AppIconButton`

**Before:**
```dart
CustomButton.icon(
  icon: Icon(Icons.add),
  onPressed: () => _handleAdd(),
)
```

**After:**
```dart
AppIconButton(
  icon: Icon(Icons.add),
  onPressed: () => _handleAdd(),
)
```

## Deprecated Classes

The following classes are deprecated and will be removed in a future version:

- `CustomButton` → Use `AppButton` or specialized variants
- `ButtonStyleConfig` → Use `AppButtonStyle`

These classes remain available for backward compatibility but should not be used in new code.

## Best Practices

1. **Use specialized variants** when possible (PrimaryButton, OutlinedButton, etc.)
2. **Use factory constructors** for common configs (.enabled(), .disabled(), .loading())
3. **Separate styling from behavior** using AppButtonConfig and AppButtonStyle
4. **Use loading state** instead of disabling button during async operations
5. **Use expandWidth** for primary buttons that should fill available space

## Support

For issues or questions, please contact the development team.

