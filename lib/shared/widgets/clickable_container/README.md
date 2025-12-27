# ClickableContainer Package - Refactored

This package provides a simplified, flexible clickable container widget for the Foody app.

## Overview

The clickable container has been refactored to:
- Separate configuration from styling
- Simplify the API from 11 parameters to just 3 essential ones (child, config, style)
- Better organization and maintainability

## Quick Start

### Import
```dart
import 'package:foody/shared/widgets/clickable_container/clickable_container.dart';
```

### Basic Usage

#### Standard Clickable Container
```dart
AppClickableContainer(
  child: Text('Click me'),
  config: ClickableContainerConfig.enabled(
    onTap: () => print('Clicked'),
  ),
  style: ClickableContainerStyle.standard(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
  ),
)
```

#### With Shadows
```dart
AppClickableContainer(
  child: Text('Card'),
  config: ClickableContainerConfig.enabled(
    onTap: () => _handleTap(),
  ),
  style: ClickableContainerStyle.withShadows(
    color: Colors.white,
    borderRadius: BorderRadius.circular(16),
  ),
)
```

#### Bordered Container
```dart
AppClickableContainer(
  child: Text('Bordered'),
  config: ClickableContainerConfig.enabled(
    onTap: () => _handleTap(),
  ),
  style: ClickableContainerStyle.bordered(
    borderColor: Colors.blue,
    borderRadius: BorderRadius.circular(8),
  ),
)
```

## Configuration Options

### ClickableContainerConfig Properties

- `onTap`: Callback when container is tapped
- `width`: Fixed width of the container
- `height`: Fixed height of the container
- `minWidth`: Minimum width
- `minHeight`: Minimum height
- `maxWidth`: Maximum width
- `maxHeight`: Maximum height

### Factory Constructors

```dart
ClickableContainerConfig.enabled(
  onTap: () => print('Clicked'),
  width: 200,
  height: 100,
)

ClickableContainerConfig.disabled(
  width: 200,
  height: 100,
)
```

### ClickableContainerStyle Properties

- `color`: Background color
- `rippleColor`: Ripple effect color
- `padding`: Internal padding
- `margin`: External margin
- `border`: Border decoration
- `borderRadius`: Corner radius
- `alignment`: Content alignment
- `boxShadow`: Shadow effects
- `withShadows`: Whether to show shadows

### Pre-built Styles

```dart
ClickableContainerStyle.standard()      // Basic style
ClickableContainerStyle.withShadows()   // With shadow effects
ClickableContainerStyle.bordered()      // With border
```

## Examples

### Card with Shadow
```dart
AppClickableContainer(
  child: Column(
    children: [
      Text('Title'),
      Text('Subtitle'),
    ],
  ),
  config: ClickableContainerConfig.enabled(
    onTap: () => _navigateToDetail(),
  ),
  style: ClickableContainerStyle.withShadows(
    color: Colors.white,
    padding: EdgeInsets.all(16),
    borderRadius: BorderRadius.circular(12),
  ),
)
```

### List Item
```dart
AppClickableContainer(
  child: Row(
    children: [
      Icon(Icons.person),
      SizedBox(width: 16),
      Text('John Doe'),
    ],
  ),
  config: ClickableContainerConfig.enabled(
    onTap: () => _openProfile(),
  ),
  style: ClickableContainerStyle.standard(
    padding: EdgeInsets.all(16),
    borderRadius: BorderRadius.circular(8),
  ),
)
```

### Disabled Container
```dart
AppClickableContainer(
  child: Text('Not available'),
  config: ClickableContainerConfig.disabled(),
  style: ClickableContainerStyle.standard(
    color: Colors.grey[200],
  ),
)
```

## Migration Guide

### From `ClickableContainer` to `AppClickableContainer`

**Before:**
```dart
ClickableContainer(
  onTap: () => print('Clicked'),
  color: Colors.white,
  borderRadius: BorderRadius.circular(12),
  padding: EdgeInsets.all(16),
  withShadows: true,
  child: Text('Click me'),
)
```

**After:**
```dart
AppClickableContainer(
  child: Text('Click me'),
  config: ClickableContainerConfig.enabled(
    onTap: () => print('Clicked'),
  ),
  style: ClickableContainerStyle.withShadows(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
    padding: EdgeInsets.all(16),
  ),
)
```

## Deprecated Classes

The following class is deprecated and will be removed in a future version:

- `ClickableContainer` → Use `AppClickableContainer`

This class remains available for backward compatibility but should not be used in new code.

## Best Practices

1. **Use factory constructors** for common configs (.enabled(), .disabled())
2. **Use pre-built styles** for common appearances (.standard(), .withShadows(), .bordered())
3. **Separate styling from behavior** using ClickableContainerConfig and ClickableContainerStyle
4. **Use appropriate padding** for better touch targets
5. **Consider accessibility** when disabling containers

## Support

For issues or questions, please contact the development team.

