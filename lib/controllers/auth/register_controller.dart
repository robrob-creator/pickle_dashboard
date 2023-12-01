import 'package:pickle/controllers/my_controller.dart';
import 'package:pickle/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutx/flutx.dart';

class RegisterController extends MyController {
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
    basicValidator.addField(
      'first_name',
      required: true,
      label: 'First Name',
      controller: TextEditingController(),
    );
    basicValidator.addField(
      'last_name',
      required: true,
      label: 'Last Name',
      controller: TextEditingController(),
    );
    basicValidator.addField(
      'password',
      required: true,
      validators: [FxLengthValidator(min: 6, max: 10)],
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

  void gotoLogin() {
    FxRouter.pushNamed(context, '/auth/login');
  }

  @override
  String getTag() {
    return "register_controller";
  }
}
