import 'package:flutter/material.dart';

/// A FocusNode that prevents the text field from gaining focus.
/// 
/// This is useful for fields like date pickers where you want the field
/// to be clickable (to show a picker) but don't want the keyboard to appear.
/// 
/// Example:
/// ```dart
/// AppTextField(
///   controller: dateController,
///   config: AppTextFieldConfig.standard(
///     focusNode: DisabledFocusNode(),
///     onTap: () => _showDatePicker(),
///   ),
/// )
/// ```
class DisabledFocusNode extends FocusNode {
  /// Creates a focus node that always reports as not having focus.
  DisabledFocusNode({super.onKey, super.skipTraversal, super.canRequestFocus});

  @override
  bool get hasFocus => false;

  @override
  bool get hasPrimaryFocus => false;

  @override
  void requestFocus([FocusNode? node]) {
    // Prevent focus from being requested
    return;
  }
}

