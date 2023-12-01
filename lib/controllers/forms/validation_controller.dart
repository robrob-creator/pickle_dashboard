import 'package:pickle/controllers/my_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutx/flutx.dart';

import 'package:pickle/controllers/forms/basic_controller.dart';

class GenderValidator extends FxFieldValidatorRule<Gender> {
  @override
  String? validate(Gender? value, bool required, Map<String, dynamic> data) {
    return null;
  }
}

class ValidationFormsController extends MyController {
  FxFormValidator basicValidator = FxFormValidator();

  ValidationFormsController() {
    basicValidator.addField('full_name',
        required: true,
        label: "Full Name",
        controller: TextEditingController());

    basicValidator.addField('email',
        required: true,
        label: "Email",
        validators: [FxEmailValidator()],
        controller: TextEditingController());

    basicValidator.addField('password',
        required: true,
        label: "Password",
        validators: [FxLengthValidator(min: 6, max: 10)],
        controller: TextEditingController());

    basicValidator.addField(
      'gender',
      required: true,
      label: "Gender",
      validators: [GenderValidator()],
    );
  }

  void onSubmitBasicForm() {
    basicValidator.validateForm();
  }

  void onResetBasicForm() {
    basicValidator.resetForm();
  }

  @override
  String getTag() {
    return "validation_form_controller";
  }
}
