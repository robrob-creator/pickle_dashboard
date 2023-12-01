import 'package:pickle/controllers/my_controller.dart';
import 'package:pickle/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

class WizardController extends MyController {
  int selectedTab = 0;

  PageController pageController = PageController();

  FxFormValidator step1Validator = FxFormValidator();
  FxFormValidator step2Validator = FxFormValidator();

  bool showPassword = false,
      loading = false,
      checked = true,
      enableValidation = true;
  DateTime? selectedDateTime;

  WizardController() {
    step1Validator.addField('username',
        required: true, label: "Username", controller: TextEditingController());

    step1Validator.addField('email',
        required: true,
        label: "Email",
        validators: [FxEmailValidator()],
        controller: TextEditingController());

    step1Validator.addField('password',
        required: true,
        label: "Password",
        validators: [FxLengthValidator(min: 6, max: 10)],
        controller: TextEditingController());

    step2Validator.addField('first_name',
        required: true,
        label: "First name",
        controller: TextEditingController());

    step2Validator.addField('last_name',
        required: true,
        label: "Last name",
        controller: TextEditingController());

    step2Validator.addField('phone_number',
        required: true,
        label: "Phone number",
        validators: [FxLengthValidator(required: true, min: 10, max: 12)],
        controller: TextEditingController());
  }

  @override
  void onReady() {
    super.onReady();
    pageController.jumpToPage(selectedTab);
  }

  void changePage(int page) {
    pageController.animateToPage(page,
        duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  void onChangedValidation(bool? validation) {
    enableValidation = validation ?? enableValidation;
    update();
  }

  void onChangePage(int page) {
    selectedTab = page;
    update();
  }

  void onNext() {
    if (enableValidation) {
      if (selectedTab == 0 && step1Validator.validateForm()) {
        changePage(selectedTab + 1);
      }
      if (selectedTab == 1 && step2Validator.validateForm()) {
        changePage(selectedTab + 1);
      }
    } else {
      changePage(selectedTab + 1);
    }
  }

  void onPrev() {
    changePage(selectedTab - 1);
  }

  void onFinish() {}

  void onChangeShowPassword() {
    showPassword = !showPassword;
    update();
  }

  void onChangedChecked(bool? value) {
    checked = value ?? checked;
    update();
  }

  Future<void> pickDateTime() async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: selectedDateTime ?? DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
          context: context,
          initialTime: selectedDateTime?.timeOfDay ?? TimeOfDay.now());
      if (pickedTime != null) {
        selectedDateTime = pickedDate.applied(pickedTime);
        update();
      }
    }
  }

  @override
  String getTag() {
    return "wizard_controller";
  }
}
