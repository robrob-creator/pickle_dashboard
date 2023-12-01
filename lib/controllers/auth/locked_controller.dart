import 'package:pickle/controllers/my_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutx/flutx.dart';

class LockedController extends MyController {
  FxFormValidator basicValidator = FxFormValidator();

  bool showPassword = false, loading = false;

  @override
  void initState() {
    super.initState();

    basicValidator.addField(
      'password',
      required: true,
      label: 'Password',
      validators: [FxLengthValidator(min: 6, max: 10)],
      controller: TextEditingController(),
    );
  }

  void onShowPassword() {
    showPassword = !showPassword;
    update();
  }

  // Services
  Future<void> onLock() async {
    if (basicValidator.validateForm()) {
      loading = true;
      update();
      await Future.delayed(Duration(seconds: 1));
      FxRouter.pushNamed(context, '/dashboard');

      loading = false;
      update();
    }
  }

  @override
  String getTag() {
    return "locked_controller";
  }
}
