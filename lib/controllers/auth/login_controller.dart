import 'package:pickle/controllers/my_controller.dart';
import 'package:pickle/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

class LoginController extends MyController {
  //Variables
  FxFormValidator basicValidator = FxFormValidator();

  bool showPassword = false, loading = false;

  final String _dummyEmail = "tester@gmail.com";
  final String _dummyPassword = "1234567";

  @override
  void initState() {
    super.initState();
    basicValidator.addField('email',
        required: true,
        label: "Email",
        validators: [FxEmailValidator()],
        controller: TextEditingController(text: _dummyEmail));

    basicValidator.addField('password',
        required: true,
        label: "Password",
        validators: [FxLengthValidator(min: 6, max: 10)],
        controller: TextEditingController(text: _dummyPassword));
  }

  // UI
  void onChangeShowPassword() {
    showPassword = !showPassword;
    update();
  }

  // Services
  Future<void> onLogin() async {
    if (basicValidator.validateForm()) {
      loading = true;
      update();
      var errors = await AuthService.loginUser(basicValidator.getData());
      if (errors != null) {
        basicValidator.addErrors(errors);
        basicValidator.validateForm();
        basicValidator.clearErrors();
      } else {
        String nextUrl = Uri.parse(ModalRoute.of(context)?.settings.name ?? "")
                .queryParameters['next'] ??
            "/dashboard";
        FxRouter.pushReplacementNamed(
          context,
          nextUrl,
        );
      }
      loading = false;
      update();
    }
  }

  void logout() {
    // Perform logout logic here
    // For example, clear user session, navigate to login screen, etc.
  }

  // Navigation
  void goToForgotPassword() {
    FxRouter.pushNamed(context, '/auth/forgot_password');
  }

  void gotoRegister() {
    FxRouter.pushNamed(context, '/auth/register');
  }

  @override
  String getTag() {
    return "login_controller";
  }
}
