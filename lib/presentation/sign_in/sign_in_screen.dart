import 'package:foody/common_imports.dart';
import 'package:foody/presentation/sign_in/sign_in_view_model.dart';
import 'package:foody/shared/widgets/text_field/validation/text_field_validators.dart';
import 'package:foody/presentation/sign_in/widgets/sign_in_gradient_header.dart';
import 'package:foody/presentation/sign_in/widgets/sign_in_form_card.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  late final String? Function(String?) _passwordValidator;
  late final String? Function(String?) _emailValidator;

  @override
  void initState() {
    super.initState();
    // Initialize validators with localized messages
    final l10n = S.current;
    _passwordValidator = Validators.passwordWithMessages(
      requiredMessage: l10n.commonThisFieldIsRequired,
      minLengthMessage: l10n.commonPasswordMustBeAtLeast8Characters,
    );
    _emailValidator = Validators.emailWithMessages(
      requiredMessage: l10n.commonThisFieldIsRequired,
      invalidMessage: l10n.commonInvalidEmail,
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


  Future<void> _handleSignIn(SignInViewModel viewModel) async {
    if (_formKey.currentState?.validate() ?? false) {
      final result = await viewModel.signIn(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );

      if (!mounted) return;
      ApiResponseHandler.handle(context: context, result: result, onSuccess: (_){
        if (!mounted) return;
        NavigationUtils.pushReplacementNamed(context, Routes.main);
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
            resizeToAvoidBottomInset: true,
            body: SafeArea(
              bottom: false,
              child: Stack(
                children: [
                  const SignInGradientHeader(),
                  SignInFormCard(
                    formKey: _formKey,
                    emailController: _emailController,
                    passwordController: _passwordController,
                    emailValidator: _emailValidator,
                    passwordValidator: _passwordValidator,
                    viewModel: viewModel,
                    isLoading: isLoading,
                    onSignIn: () => _handleSignIn(viewModel),
                    onForgotPassword: () {
                      // TODO: Navigate to forgot password screen
                    },
                    onSignUp: () {
                      NavigationUtils.pushNamed(context, Routes.signUp);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

