import 'package:foody/common_imports.dart';
import 'package:foody/presentation/sign_up/sign_up_view_model.dart';

class SignUpFormCard extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController addressController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final String? Function(String?) usernameValidator;
  final String? Function(String?) emailValidator;
  final String? Function(String?) phoneValidator;
  final String? Function(String?) passwordValidator;
  final SignUpViewModel viewModel;
  final bool isLoading;
  final VoidCallback onSignUp;
  final VoidCallback onSignIn;

  const SignUpFormCard({
    super.key,
    required this.formKey,
    required this.usernameController,
    required this.emailController,
    required this.phoneController,
    required this.addressController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.usernameValidator,
    required this.emailValidator,
    required this.phoneValidator,
    required this.passwordValidator,
    required this.viewModel,
    required this.isLoading,
    required this.onSignUp,
    required this.onSignIn,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = S.current;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.bgSurface,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: Offset(0, -5),
            ),
          ],
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.w),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GapH(20.h),
                /// Username field
                LabeledTextField(
                  label: l10n.signInUsername,
                  controller: usernameController,
                  config: AppTextFieldConfig.standard(
                    hintText: l10n.signInEnterYourUsername,
                    isRequired: true,
                    validator: usernameValidator,
                    textInputAction: TextInputAction.next,
                  ),
                ),
                GapH(16.h),
                /// Email field
                LabeledTextField(
                  label: l10n.signUpEmail,
                  controller: emailController,
                  config: AppTextFieldConfig.email(
                    hintText: l10n.signUpEnterYourEmail,
                    isRequired: true,
                    validator: emailValidator,
                  ),
                ),
                GapH(16.h),
                /// Phone field
                LabeledTextField(
                  label: l10n.signUpPhone,
                  controller: phoneController,
                  config: AppTextFieldConfig.phone(
                    hintText: l10n.signUpEnterYourPhone,
                    isRequired: false,
                    validator: phoneValidator,
                  ),
                ),
                GapH(16.h),
                /// Address field (optional)
                LabeledTextField(
                  label: l10n.signUpAddress,
                  controller: addressController,
                  config: AppTextFieldConfig.multiline(
                    hintText: l10n.signUpEnterYourAddress,
                    isRequired: false,
                    maxLines: 3,
                    minLines: 2,
                  ),
                ),
                GapH(16.h),
                /// Password field
                LabeledTextField(
                  label: l10n.signInPassword,
                  controller: passwordController,
                  config: AppTextFieldConfig.password(
                    hintText: l10n.signInEnterYourPassword,
                    validator: passwordValidator,
                  ),
                ),
                GapH(16.h),
                /// Confirm Password field
                LabeledTextField(
                  label: l10n.signUpConfirmPassword,
                  controller: confirmPasswordController,
                  config: AppTextFieldConfig.password(
                    hintText: l10n.signUpEnterConfirmPassword,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return l10n.commonThisFieldIsRequired;
                      }
                      if (value != passwordController.text) {
                        return l10n.signUpPasswordsDoNotMatch;
                      }
                      return null;
                    },
                    onSubmitted: (_) => onSignUp(),
                  ),
                ),
                GapH(32.h),
                /// Gradient Sign up button
                AppButton(
                  text: l10n.signUpSignUp.toUpperCase(),
                  config: AppButtonConfig(
                    onPressed: isLoading ? null : onSignUp,
                    isLoading: isLoading,
                  ),
                  style: AppButtonStyle.gradientPrimary(),
                  expandWidth: true,
                ),
                GapH(8.h),
                /// Sign in link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(
                      l10n.signUpAlreadyHaveAccount,
                      typography: AppTypography.bodySmallRegular,
                      color: AppColors.textSecondaryAlt,
                    ),
                    AppClickableContainer(
                      config: ClickableContainerConfig.enabled(onTap: onSignIn),
                      style: ClickableContainerStyle.standard(
                        padding: EdgeInsets.symmetric(
                          horizontal: 4.w,
                          vertical: 4.h,
                        ),
                      ),
                      child: AppText(
                        l10n.signInSignIn,
                        typography: AppTypography.bodySmallMedium,
                      ),
                    ),
                  ],
                ),
                GapH(30.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

