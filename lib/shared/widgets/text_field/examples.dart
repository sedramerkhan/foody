import 'package:flutter/material.dart';
import 'package:foody/shared/widgets/text_field/text_field.dart';

/// Example demonstrating the new text field API
/// 
/// This file shows how to use the refactored text field components
/// with much simpler and cleaner code than before.
class TextFieldExamples extends StatefulWidget {
  const TextFieldExamples({super.key});

  @override
  State<TextFieldExamples> createState() => _TextFieldExamplesState();
}

class _TextFieldExamplesState extends State<TextFieldExamples> {
  final _formKey = GlobalKey<FormState>();
  
  // Controllers
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _bioController = TextEditingController();
  
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New TextField Examples'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Example 1: Standard text field with label
            LabeledTextField(
              label: 'Full Name',
              controller: _nameController,
              config: AppTextFieldConfig.standard(
                hintText: 'Enter your full name',
                isRequired: true,
                validator: Validators.minLength(3),
              ),
            ),
            const SizedBox(height: 16),

            // Example 2: Email field
            LabeledTextField(
              label: 'Email Address',
              controller: _emailController,
              config: AppTextFieldConfig.email(
                validator: Validators.compose([
                  Validators.required,
                  Validators.email,
                ]),
              ),
            ),
            const SizedBox(height: 16),

            // Example 3: Phone field with country code
            LabeledTextField(
              label: 'Phone Number',
              controller: _phoneController,
              config: AppTextFieldConfig.phone(),
              // Using PhoneTextField directly also works:
              // PhoneTextField(
              //   controller: _phoneController,
              //   countryCode: '+963',
              // ),
            ),
            const SizedBox(height: 16),

            // Example 4: Password field with visibility toggle
            LabeledTextField(
              label: 'Password',
              controller: _passwordController,
              config: AppTextFieldConfig.password(
                validator: Validators.compose([
                  Validators.required,
                  Validators.minLength(8),
                ]),
              ),
            ),
            const SizedBox(height: 16),

            // Example 5: Confirm password with match validation
            LabeledTextField(
              label: 'Confirm Password',
              controller: _confirmPasswordController,
              config: AppTextFieldConfig.password(
                validator: Validators.compose([
                  Validators.required,
                  Validators.match(
                    _passwordController.text,
                    message: 'Passwords do not match',
                  ),
                ]),
              ),
            ),
            const SizedBox(height: 16),

            // Example 6: Multiline text area
            LabeledTextField(
              label: 'Bio',
              helperText: 'Tell us about yourself (optional)',
              controller: _bioController,
              config: AppTextFieldConfig.multiline(
                hintText: 'Enter your bio...',
                maxLines: 5,
                maxLength: 500,
              ),
              showCharacterCounter: true,
            ),
            const SizedBox(height: 24),

            // Submit button
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  // Form is valid
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Form validated successfully!'),
                    ),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================================
// COMPARISON: Before vs After
// ============================================================================

/// OLD WAY (Deprecated - Don't use in new code):
/// 
/// ```dart
/// AppTextFormField(
///   textFieldData: TextFieldData(
///     hintText: "Enter your email",
///     type: TextFormFieldType.text,
///     isRequired: true,
///     validator: (s) {
///       if (s.isEmpty) return "Required";
///       if (!s.contains('@')) return "Invalid email";
///       return null;
///     },
///     keyboardType: TextInputType.emailAddress,
///     textInputAction: TextInputAction.next,
///     onChange: (value) { /* ... */ },
///     showError: true,
///     enable: true,
///     autofocus: false,
///     hasBorder: true,
///     backgroundColor: Colors.white,
///     contentPadding: EdgeInsets.all(12),
///   ),
///   controller: emailController,
///   cornerRadius: 12,
///   isSuccess: false,
///   isGift: false, // What is this?
///   height: 58,
/// )
/// ```

/// NEW WAY (Recommended):
/// 
/// ```dart
/// AppTextField(
///   controller: emailController,
///   config: AppTextFieldConfig.email(
///     validator: Validators.email,
///   ),
/// )
/// ```

/// Even simpler with labeled field:
/// 
/// ```dart
/// LabeledTextField(
///   label: 'Email',
///   controller: emailController,
///   config: AppTextFieldConfig.email(
///     validator: Validators.email,
///   ),
/// )
/// ```

