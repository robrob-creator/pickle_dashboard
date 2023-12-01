import 'package:pickle/controllers/my_controller.dart';
import 'package:pickle/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

class ForgotPasswordController extends MyController {
  FxFormValidator basicValidator = FxFormValidator();
  bool showPassword = false, loading = false;

  @override
  void initState() {
    super.initState();
    basicValidator.addField(
      'email',
      required: true,
      label: "Email",
      validators: [FxEmailValidator()],
      controller: TextEditingController(),
    );
  }

  Future<void> onLogin() async {
    if (basicValidator.validateForm()) {
      loading = true;
      update();
      var errors = await AuthService.loginUser(basicValidator.getData());
      if (errors != null) {
        basicValidator.validateForm();
        basicValidator.clearErrors();
      }
      FxRouter.pushNamed(context, '/auth/reset_password');
      loading = false;
      update();
    }
  }

  void gotoLogIn() {
    FxRouter.pushNamed(context, '/auth/login');
  }

  @override
  String getTag() {
    return "forgot_password";
  }
}
