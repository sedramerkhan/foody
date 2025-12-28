import 'package:foody/common_imports.dart';
import 'package:foody/presentation/sign_in/sign_in_view_model.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  ApiResponse<Map<String, dynamic>>? _lastResponse;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


  Future<void> _handleSignIn(SignInViewModel viewModel) async {
    if (_formKey.currentState?.validate() ?? false) {
     final result = await viewModel.signIn(
        username: _usernameController.text.trim(),
        password: _passwordController.text,
      );

     ApiResponseHandler.handle(context: context, result: result, onSuccess: (_){
       NavigationUtils.pushReplacementNamed(context, Routes.home);
     });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Can be used without context - uses S.current
    final l10n = S.current;
    final viewModel = Provider.of<SignInViewModel>(context);

    // Listen to sign-in response changes
    return ValueListenableBuilder<ApiResponse<Map<String, dynamic>>>(
      valueListenable: viewModel.signInResponse,
      builder: (context, response, _) {
        final isLoading = response is Loading;
        return IgnorePointer(
          ignoring: isLoading,
          child: Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      GapH(40.h),
                      // Title
                      AppText(
                        l10n.signInWelcomeBack,
                        typography: AppTypography.headingLargeBold,
                        color: AppColors.textPrimary,
                        textAlign: TextAlign.center,
                      ),
                      GapH(8.h),
                      AppText(
                        l10n.signInSignInToContinue,
                        typography: AppTypography.bodyLargeRegular,
                        color: AppColors.textSecondaryAlt,
                        textAlign: TextAlign.center,
                      ),
                      GapH(48.h),
                      // Username field
                      LabeledTextField(
                        label: l10n.signInUsername,
                        controller: _usernameController,
                        config: AppTextFieldConfig.standard(
                          hintText: l10n.signInEnterYourUsername,
                          isRequired: true,
                          validator: (value) => value == null || value.trim().isEmpty
                              ? l10n.commonThisFieldIsRequired
                              : null,
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                      GapH(24.h),
                      // Password field
                      LabeledTextField(
                        label: l10n.signInPassword,
                        controller: _passwordController,
                        config: AppTextFieldConfig.password(
                          hintText: l10n.signInEnterYourPassword,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return l10n.commonThisFieldIsRequired;
                            }
                            if (value.length < 8) {
                              return l10n.commonPasswordMustBeAtLeast8Characters;
                            }
                            return null;
                          },
                          onSubmitted: (value) => _handleSignIn(viewModel),
                        ),
                      ),
                      GapH(40.h),
                      // Sign in button
                      PrimaryButton(
                        text: l10n.signInSignIn,
                        onPressed: isLoading ? null : () => _handleSignIn(viewModel),
                        isLoading: isLoading,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

