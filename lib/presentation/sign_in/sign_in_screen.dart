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
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  ApiResponse<Map<String, dynamic>>? _lastResponse;
  late final String? Function(String?) _passwordValidator;

  @override
  void initState() {
    super.initState();
    // Initialize password validator with localized messages
    final l10n = S.current;
    _passwordValidator = Validators.passwordWithMessages(
      requiredMessage: l10n.commonThisFieldIsRequired,
      minLengthMessage: l10n.commonPasswordMustBeAtLeast8Characters,
    );
  }

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
                    usernameController: _usernameController,
                    passwordController: _passwordController,
                    passwordValidator: _passwordValidator,
                    viewModel: viewModel,
                    isLoading: isLoading,
                    onSignIn: () => _handleSignIn(viewModel),
                    onForgotPassword: () {
                      // TODO: Navigate to forgot password screen
                    },
                    onSignUp: () {
                      // TODO: Navigate to sign up screen
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

