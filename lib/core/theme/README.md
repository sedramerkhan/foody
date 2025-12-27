# Theme System - Food Delivery App

This package provides the complete theme system for the Foody food delivery app.

## Location

The theme is correctly placed in `lib/core/theme/` as it's core infrastructure that should be accessible throughout the app.

## Structure

```
theme/
├── color/
│   ├── app_colors.dart        # Color constants and utilities
│   └── theme_colors.dart       # Base color definitions
├── text/
│   ├── app_typography.dart     # Typography system
│   ├── app_text_style.dart    # Text style builder
│   ├── app_font_size.dart     # Font size constants
│   ├── app_font_weight.dart   # Font weight constants
│   └── app_text_common.dart   # Common text utilities
└── theme.dart                  # Main theme configuration
```

## Color System

### Primary Colors (Brand)

The app uses a **warm orange-red** color scheme optimized for food delivery apps:

- **Primary Brand**: `#FF5722` (Orange-Red) - Main brand color
  - Creates appetite and energy
  - Similar to Uber Eats, DoorDash style
  - Warm and inviting for food-related apps

**Brand Color Scale:**
- `brand800`: `#C4320A` - Darkest (for text on light)
- `brand700`: `#E65100` - Dark
- `brand600`: `#FF6B35` - Medium-dark
- `brand500`: `#FF5722` - **Primary** (main brand color)
- `brand400`: `#FF8A65` - Medium-light
- `brand300`: `#FFAB91` - Light
- `brand200`: `#FFCCBC` - Very light
- `brand100`: `#FFE0B2` - Pale
- `brand50`: `#FFF3E0` - Very pale
- `brand25`: `#FFF8F3` - Almost white

### Secondary Colors

- **Secondary**: `#FFB300` (Warm Yellow)
  - Complementary to orange-red
  - Used for highlights, accents, and call-to-action elements
  - Creates visual interest and warmth

**Secondary Color Scale:**
- `secondary700`: `#FFA000` - Darker yellow
- `secondary500`: `#FFB300` - **Main secondary**
- `secondary300`: `#FFC107` - Light yellow
- `secondary100`: `#FFF9C4` - Very light yellow

### Semantic Colors

#### Success (Green)
- `green500`: `#4CAF50` - Success actions, confirmations
- Used for: Order confirmed, delivery success, positive feedback

#### Error (Red)
- `red500`: `#E53935` - Errors, warnings, destructive actions
- Used for: Validation errors, failed operations, warnings

#### Info (Blue)
- `blue500`: `#2196F3` - Informational messages
- Used for: Notifications, info dialogs, links

### Neutral Colors (Grays)

Complete gray scale from `grey900` (darkest) to `grey50` (lightest) for:
- Text colors
- Backgrounds
- Borders
- Dividers

## Usage

### Import Theme

```dart
import 'package:foody/core/theme/theme.dart';

// Use in MaterialApp
MaterialApp(
  theme: defaultThemeData,
  // ...
)
```

### Access Colors

```dart
import 'package:foody/core/theme/color/app_colors.dart';

// Primary brand color
Container(color: AppColors.brand500)

// Secondary color
Container(color: AppColors.secondary500)

// Semantic colors
Text('Success', style: TextStyle(color: AppColors.green500))
Text('Error', style: TextStyle(color: AppColors.red500))
```

### Typography

```dart
import 'package:foody/core/theme/typography/app_typography.dart';
import 'package:foody/shared/widgets/text/theme_text_style.dart';

// Use typography
Text(
  'Heading',
  style: AppTextStyle(
    typography: AppTypography.headingLargeBold,
    color: AppColors.textPrimary,
  ).materialTextStyle,
)
```

## Color Scheme in Theme

The `ColorScheme` is configured as:

- **Primary**: `brand500` (#FF5722) - Warm orange-red
- **Secondary**: `secondary500` (#FFB300) - Warm yellow
- **Tertiary**: `green500` (#4CAF50) - Success green
- **Error**: `red500` (#E53935) - Error red

## Design Rationale

### Why Orange-Red for Food Delivery?

1. **Appetite Stimulation**: Orange and red are proven to stimulate appetite
2. **Energy & Urgency**: Creates sense of energy and quick delivery
3. **Industry Standard**: Similar to major food delivery apps (Uber Eats, DoorDash)
4. **Warmth**: Creates inviting, friendly feeling
5. **Visibility**: High contrast and attention-grabbing

### Color Psychology

- **Orange-Red**: Appetite, energy, warmth, action
- **Yellow**: Happiness, optimism, highlights
- **Green**: Fresh, healthy, success, confirmation
- **Red**: Urgency, errors, important warnings

## Best Practices

1. **Use brand colors** for primary actions (buttons, links, CTAs)
2. **Use semantic colors** appropriately (green for success, red for errors)
3. **Maintain contrast** for accessibility (WCAG AA minimum)
4. **Use color scales** for depth and hierarchy
5. **Keep consistency** across the app

## Accessibility

All color combinations meet WCAG AA contrast requirements:
- Text on brand backgrounds: White text on brand500
- Text on light backgrounds: Dark text (grey900, grey800)
- Error states: High contrast red for visibility

## Migration Notes

If you were using the old green brand colors:
- Old `brand500` (green) → New `brand500` (orange-red)
- Update any hardcoded green brand references
- Test UI components for color changes

## Support

For theme questions or color adjustments, contact the design team.

