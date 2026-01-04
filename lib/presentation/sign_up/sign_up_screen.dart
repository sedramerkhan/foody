import 'package:foody/common_imports.dart';
import 'package:foody/presentation/sign_up/sign_up_view_model.dart';
import 'package:foody/presentation/sign_up/widgets/sign_up_gradient_header.dart';
import 'package:foody/presentation/sign_up/widgets/sign_up_form_card.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  late final String? Function(String?) _passwordValidator;
  late final String? Function(String?) _usernameValidator;
  late final String? Function(String?) _emailValidator;
  late final String? Function(String?) _phoneValidator;

  @override
  void initState() {
    super.initState();
    // Initialize validators with localized messages
    final l10n = S.current;
    _passwordValidator = Validators.passwordWithMessages(
      requiredMessage: l10n.commonThisFieldIsRequired,
      minLengthMessage: l10n.commonPasswordMustBeAtLeast8Characters,
    );
    _usernameValidator = Validators.compose([
      Validators.requiredWithMessage(l10n.commonThisFieldIsRequired),
      Validators.minLength(3, message: 'Username must be at least 3 characters'),
      Validators.pattern(
        RegExp(r'^[a-zA-Z0-9_]+$'),
        'Username can only contain letters, numbers, and underscores',
      ),
    ]);
    _emailValidator = Validators.emailWithMessages(
      requiredMessage: l10n.commonThisFieldIsRequired,
      invalidMessage: l10n.commonInvalidEmail,
    );
    _phoneValidator = Validators.phone;
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _handleSignUp(SignUpViewModel viewModel) async {
    if (_formKey.currentState?.validate() ?? false) {

      
      final result = await viewModel.signUp(
        username: _usernameController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text,
        phone: _phoneController.text.trim(),
        address: _addressController.text.trim(),
      );


      if (!mounted) {
        return;
      }
      ApiResponseHandler.handle(context: context, result: result, onSuccess: (_){
        if (!mounted) {
          return;
        }
        NavigationUtils.pushNamedAndRemoveUntil(context, Routes.main,(route)=> false);
      });
    } else {
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<SignUpViewModel>(context);

    // Listen to sign-up response changes
    return ValueListenableBuilder<ApiResponse<Map<String, dynamic>>>(
      valueListenable: viewModel.signUpResponse,
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
                  const SignUpGradientHeader(),
                  SignUpFormCard(
                    formKey: _formKey,
                    usernameController: _usernameController,
                    emailController: _emailController,
                    phoneController: _phoneController,
                    addressController: _addressController,
                    passwordController: _passwordController,
                    confirmPasswordController: _confirmPasswordController,
                    usernameValidator: _usernameValidator,
                    emailValidator: _emailValidator,
                    phoneValidator: _phoneValidator,
                    passwordValidator: _passwordValidator,
                    viewModel: viewModel,
                    isLoading: isLoading,
                    onSignUp: () => _handleSignUp(viewModel),
                    onSignIn: () {
                      NavigationUtils.pushReplacementNamed(context, Routes.signIn);
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

