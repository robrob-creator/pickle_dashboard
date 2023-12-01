import 'package:pickle/controllers/my_controller.dart';
import 'package:pickle/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

class ResetPasswordController extends MyController {
  FxFormValidator basicValidator = FxFormValidator();

  bool showPassword = false, loading = false;

  bool confirmPassword = false;

  @override
  void initState() {
    super.initState();
    basicValidator.addField(
      'password',
      required: true,
      validators: [
        FxLengthValidator(min: 6, max: 10),
      ],
      controller: TextEditingController(),
    );
    basicValidator.addField(
      'confirm_password',
      required: true,
      label: "Confirm password",
      validators: [
        FxLengthValidator(min: 6, max: 10),
      ],
      controller: TextEditingController(),
    );
  }

  Future<void> onLogin() async {
    if (basicValidator.validateForm()) {
      loading = true;
      update();
      var errors = await AuthService.loginUser(basicValidator.getData());
      if (errors != null) {
        basicValidator.addErrors(errors);
        basicValidator.validateForm();
        basicValidator.clearErrors();
      }
      FxRouter.pushNamed(context, '/starter');
      loading = false;
      update();
    }
  }

  void onChangeShowPassword() {
    showPassword = !showPassword;
    update();
  }

  void onResetPasswordPassword() {
    confirmPassword = !confirmPassword;
    update();
  }

  @override
  String getTag() {
    return "reset_password";
  }
}
