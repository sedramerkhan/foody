import 'package:foody/common_imports.dart';
import 'package:foody/presentation/sign_in/sign_in_view_model.dart';
import 'package:foody/shared/widgets/buttons/app_button.dart';
import 'package:foody/shared/widgets/buttons/app_button_config.dart';
import 'package:foody/shared/widgets/buttons/app_button_style.dart';
import 'package:foody/shared/widgets/text_field/validation/text_field_validators.dart';

class SignInFormCard extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final String? Function(String?) passwordValidator;
  final SignInViewModel viewModel;
  final bool isLoading;
  final VoidCallback onSignIn;
  final VoidCallback onForgotPassword;
  final VoidCallback onSignUp;

  const SignInFormCard({
    super.key,
    required this.formKey,
    required this.usernameController,
    required this.passwordController,
    required this.passwordValidator,
    required this.viewModel,
    required this.isLoading,
    required this.onSignIn,
    required this.onForgotPassword,
    required this.onSignUp,
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
                    validator: (value) => value == null || value.trim().isEmpty
                        ? l10n.commonThisFieldIsRequired
                        : null,
                    textInputAction: TextInputAction.next,
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
                    onSubmitted: (value) => onSignIn(),
                  ),
                ),
                /// Forgot password
                Align(
                  alignment: Alignment.centerRight,
                  child: AppClickableContainer(
                    config:ClickableContainerConfig.enabled(onTap:  onForgotPassword),
                    style: ClickableContainerStyle.standard(
                      padding: EdgeInsets.symmetric(
                        horizontal: 4.w,
                        vertical: 4.h,
                      ),
                    ),
                    child: AppText(
                      l10n.signInForgotPassword,
                      typography: AppTypography.bodySmallRegular,
                      color: AppColors.textSecondaryAlt,
                    ),
                  ),
                ),
                GapH(32.h),
                /// Gradient Sign in button
                AppButton(
                  text: l10n.signInSignIn.toUpperCase(),
                  config: AppButtonConfig(
                    onPressed: isLoading ? null : onSignIn,
                    isLoading: isLoading,
                  ),
                  style: AppButtonStyle.gradientPrimary(),
                  expandWidth: true,
                ),
                GapH(8.h),
                /// Sign up
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(
                      l10n.signInDontHaveAccount,
                      typography: AppTypography.bodySmallRegular,
                      color: AppColors.textSecondaryAlt,
                    ),
                    AppClickableContainer(
                      config: ClickableContainerConfig.enabled(onTap: onSignUp),
                      style: ClickableContainerStyle.standard(
                        padding: EdgeInsets.symmetric(
                          horizontal: 4.w,
                          vertical: 4.h,
                        ),
                      ),
                      child: AppText(
                        l10n.signInSignUp,
                        typography: AppTypography.bodySmallMedium,
                      ),
                    ),
                  ],
                ),
                GapH(MediaQuery.heightOf(context) * 0.2),
                // Bottom padding for scroll
              ],
            ),
          ),
        ),
      ),
    );
  }
}
