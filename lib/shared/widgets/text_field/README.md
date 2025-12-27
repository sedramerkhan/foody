# TextField Package - Refactored

This package provides a simplified, flexible text field system for the Foody app.

## Overview

The text field package has been refactored to:
- Separate configuration from styling
- Provide specialized variants for common use cases
- Offer reusable validators
- Simplify the API from 18+ parameters to just 3 essential ones (controller, config, style)

## New Structure

```
text_field/
├── app_text_field.dart              # Main simplified widget
├── app_text_field_config.dart       # Behavior configuration
├── app_text_field_style.dart        # Visual styling
├── variants/
│   ├── password_text_field.dart     # Password input with toggle
│   ├── phone_text_field.dart        # Phone with country code
│   └── multiline_text_field.dart    # Text area
├── validation/
│   └── text_field_validators.dart   # Reusable validators
├── widgets/
│   └── labeled_text_field.dart      # Field with label
└── utils/
    └── disabled_focus_node.dart     # Focus node utility
```

## Quick Start

### Import
```dart
import 'package:foody/shared/widgets/text_field/text_field.dart';
```

### Basic Usage

#### Standard Text Field
```dart
AppTextField(
  controller: nameController,
  config: AppTextFieldConfig.standard(
    hintText: 'Enter your name',
    isRequired: true,
  ),
)
```

**Note:** `AppTextField` has only 3 parameters:
- `controller` - Text editing controller
- `config` - All behavior configuration (validation, callbacks, focus, etc.)
- `style` - Visual styling (optional, uses defaults if not provided)

#### Email Field
```dart
AppTextField(
  controller: emailController,
  config: AppTextFieldConfig.email(
    validator: Validators.email,
  ),
)
```

#### Password Field
```dart
PasswordTextField(
  controller: passwordController,
  validator: Validators.password,
)
```

#### Phone Field
```dart
PhoneTextField(
  controller: phoneController,
  countryCode: '+963',
  validator: Validators.phone,
)
```

#### Multiline Text Area
```dart
MultilineTextField(
  controller: notesController,
  hintText: 'Enter notes',
  maxLines: 5,
)
```

#### Field with Label
```dart
LabeledTextField(
  label: 'Email Address',
  controller: emailController,
  config: AppTextFieldConfig.email(),
)
```

## Validators

### Built-in Validators

```dart
// Required field
Validators.required

// Email validation
Validators.email

// Phone validation
Validators.phone

// Password (8+ chars, letters + numbers)
Validators.password

// Strong password (uppercase, lowercase, numbers, special chars)
Validators.strongPassword

// Length constraints
Validators.minLength(8)
Validators.maxLength(50)
Validators.lengthRange(8, 50)

// Numeric
Validators.numeric
Validators.integer
Validators.minValue(0)
Validators.maxValue(100)

// Pattern matching
Validators.pattern(RegExp(r'^[A-Z]'), 'Must start with uppercase')

// Match another value (e.g., password confirmation)
Validators.match(passwordController.text, message: 'Passwords must match')
```

### Composing Validators

```dart
// Combine multiple validators
final validator = Validators.compose([
  Validators.required,
  Validators.email,
]);

// Required + custom validator
final validator = Validators.requiredAnd(Validators.email);
```

## Styling

### Pre-built Styles

```dart
// Standard style (default)
AppTextFieldStyle.standard()

// Filled background
AppTextFieldStyle.filled(backgroundColor: Colors.grey[100])

// Borderless
AppTextFieldStyle.borderless()
```

### Custom Styling

```dart
final customStyle = AppTextFieldStyle(
  backgroundColor: Colors.white,
  borderRadius: 16.0,
  contentPadding: EdgeInsets.all(16),
  showBorder: true,
  borderColors: BorderColors.standard(),
  prefixIcon: Icon(Icons.search),
);
```

## Configuration Options

### AppTextFieldConfig Properties

- `hintText`: Placeholder text
- `isRequired`: Whether field is required (adds validator)
- `enabled`: Enable/disable field
- `autofocus`: Auto-focus on mount
- `keyboardType`: Keyboard type (text, email, phone, number, etc.)
- `textInputAction`: Action button (next, done, search, etc.)
- `maxLines`: Maximum lines (1 for single-line)
- `minLines`: Minimum lines (for multiline)
- `maxLength`: Character limit
- `onChanged`: Callback when text changes
- `onSubmitted`: Callback when submitted
- `onTap`: Callback when field is tapped
- `focusNode`: Focus node for focus management
- `showErrorText`: Whether to show validation errors below field
- `validator`: Custom validation function
- `obscureText`: Hide text (for passwords)
- `textDirection`: Force LTR/RTL

### Factory Constructors

```dart
AppTextFieldConfig.standard()
AppTextFieldConfig.email()
AppTextFieldConfig.phone()
AppTextFieldConfig.password()
AppTextFieldConfig.number()
AppTextFieldConfig.multiline()
```

## Migration Guide

### From `AppTextFormField` to `AppTextField`

**Before:**
```dart
AppTextFormField(
  textFieldData: TextFieldData(
    hintText: "Email",
    type: TextFormFieldType.text,
    isRequired: true,
    validator: (s) => s.isEmpty ? "Required" : null,
    keyboardType: TextInputType.emailAddress,
    textInputAction: TextInputAction.next,
  ),
  controller: emailController,
  cornerRadius: 12,
  isSuccess: false,
)
```

**After:**
```dart
AppTextField(
  controller: emailController,
  config: AppTextFieldConfig.email(
    validator: Validators.email,
  ),
)
```

### From `TextFormFieldWithTitle` to `LabeledTextField`

**Before:**
```dart
TextFormFieldWithTitle(
  title: "Email",
  textFieldData: TextFieldData(hintText: "Enter email"),
  controller: emailController,
)
```

**After:**
```dart
LabeledTextField(
  label: "Email",
  controller: emailController,
  config: AppTextFieldConfig.standard(hintText: "Enter email"),
)
```

## Deprecated Classes

The following classes have been removed and replaced:

- `AppTextFormField` → Use `AppTextField`
- `TextFormFieldWithTitle` → Use `LabeledTextField`
- `TextFieldData` → Use `AppTextFieldConfig`
- `BorderStatesState` → Use `BorderColors` in `AppTextFieldStyle`
- `PrefixPhoneNumber` → Use `PhoneTextField`

**Note:** `DisabledFocusNode` has been moved to `utils/disabled_focus_node.dart` and is still available.

## Examples

### Login Form
```dart
Column(
  children: [
    LabeledTextField(
      label: 'Email',
      controller: emailController,
      config: AppTextFieldConfig.email(
        validator: Validators.email,
      ),
    ),
    SizedBox(height: 16),
    LabeledTextField(
      label: 'Password',
      controller: passwordController,
      config: AppTextFieldConfig.password(
        validator: Validators.minLength(8),
      ),
    ),
  ],
)
```

### Registration Form
```dart
Form(
  key: formKey,
  child: Column(
    children: [
      LabeledTextField(
        label: 'Full Name',
        controller: nameController,
        config: AppTextFieldConfig.standard(
          isRequired: true,
          validator: Validators.minLength(3),
        ),
      ),
      PhoneTextField(
        controller: phoneController,
        countryCode: '+963',
      ),
      PasswordTextField(
        controller: passwordController,
        validator: Validators.strongPassword,
      ),
      MultilineTextField(
        controller: bioController,
        hintText: 'Tell us about yourself',
        maxLines: 5,
      ),
    ],
  ),
)
```

## Utilities

### DisabledFocusNode

For fields like date pickers where you want the field to be clickable but don't want the keyboard to appear:

```dart
AppTextField(
  controller: dateController,
  config: AppTextFieldConfig.standard(
    hintText: 'Select date',
    focusNode: DisabledFocusNode(),
    onTap: () => _showDatePicker(),
  ),
)
```

This prevents the text field from gaining focus while still allowing tap events.

## Best Practices

1. **Use specialized variants** when possible (PasswordTextField, PhoneTextField)
2. **Compose validators** instead of writing custom validation logic
3. **Use factory constructors** for common configs (.email(), .phone(), etc.)
4. **Separate styling from behavior** using AppTextFieldConfig and AppTextFieldStyle
5. **Use LabeledTextField** for forms to maintain consistent labeling
6. **Use DisabledFocusNode** for date pickers and similar fields that should be clickable but not focusable

## Support

For issues or questions, please contact the development team.

