import 'package:pickle/controllers/forms/basic_controller.dart';
import 'package:pickle/controllers/forms/validation_controller.dart';
import 'package:pickle/extensions/string.dart';
import 'package:pickle/services/theme/app_style.dart';
import 'package:pickle/utils/mixins/ui_mixin.dart';
import 'package:pickle/views/layouts/layout.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

class ValidationFormsPage extends StatefulWidget {
  const ValidationFormsPage({super.key});

  @override
  _ValidationFormsPageState createState() => _ValidationFormsPageState();
}

class _ValidationFormsPageState extends State<ValidationFormsPage>
    with SingleTickerProviderStateMixin, UIMixin {
  late ValidationFormsController controller;

  @override
  void initState() {
    super.initState();
    controller = FxControllerStore.putOrFind(ValidationFormsController());
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: FxBuilder<ValidationFormsController>(
          controller: controller,
          builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: FxSpacing.x(flexSpacing),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FxText.titleMedium(
                        "validation_forms".tr().capitalizeWords,
                        fontSize: 18,
                        fontWeight: 600,
                      ),
                      FxBreadcrumb(
                        children: [
                          FxBreadcrumbItem(name: 'forms'.tr()),
                          FxBreadcrumbItem(
                              name: 'validation'.tr(), active: true),
                        ],
                      ),
                    ],
                  ),
                ),
                FxSpacing.height(flexSpacing),
                Padding(
                  padding: FxSpacing.x(flexSpacing / 2),
                  child: FxFlex(
                    wrapAlignment: WrapAlignment.start,
                    wrapCrossAlignment: WrapCrossAlignment.start,
                    children: [
                      FxFlexItem(
                          sizes: "lg-6 md-12",
                          child: FxContainer.bordered(
                            paddingAll: flexSpacing,
                            child: Form(
                              key: controller.basicValidator.formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FxText.labelMedium(
                                    "full_name".tr().capitalizeWords,
                                  ),
                                  FxSpacing.height(8),
                                  TextFormField(
                                    validator: controller.basicValidator
                                        .getValidation('full_name'),
                                    controller: controller.basicValidator
                                        .getController('full_name'),
                                    decoration: InputDecoration(
                                        hintText: "Denish Navadiya",
                                        hintStyle:
                                            FxTextStyle.bodySmall(xMuted: true),
                                        border: outlineInputBorder,
                                        enabledBorder: outlineInputBorder,
                                        focusedBorder: focusedInputBorder,
                                        contentPadding: FxSpacing.all(16),
                                        isCollapsed: true,
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.never),
                                  ),
                                  FxSpacing.height(16),
                                  FxText.labelMedium(
                                    "email_address".tr().capitalizeWords,
                                  ),
                                  FxSpacing.height(8),
                                  TextFormField(
                                    validator: controller.basicValidator
                                        .getValidation('email'),
                                    controller: controller.basicValidator
                                        .getController('email'),
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                        hintText: "demo@getappui.com",
                                        hintStyle:
                                            FxTextStyle.bodySmall(xMuted: true),
                                        border: outlineInputBorder,
                                        enabledBorder: outlineInputBorder,
                                        focusedBorder: focusedInputBorder,
                                        prefixIcon: Icon(
                                          Icons.email_outlined,
                                          size: 20,
                                        ),
                                        contentPadding: FxSpacing.all(16),
                                        isCollapsed: true,
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.never),
                                  ),
                                  FxSpacing.height(16),
                                  FxText.labelMedium(
                                    "password".tr(),
                                  ),
                                  FxSpacing.height(8),
                                  TextFormField(
                                    validator: controller.basicValidator
                                        .getValidation('password'),
                                    controller: controller.basicValidator
                                        .getController('password'),
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                        hintText: "****",
                                        hintStyle:
                                            FxTextStyle.bodySmall(xMuted: true),
                                        border: outlineInputBorder,
                                        enabledBorder: outlineInputBorder,
                                        focusedBorder: focusedInputBorder,
                                        prefixIcon: Icon(
                                          Icons.lock_outline,
                                          size: 20,
                                        ),
                                        contentPadding: FxSpacing.all(16),
                                        isCollapsed: true,
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.never),
                                  ),
                                  FxSpacing.height(20),
                                  FxText.labelMedium(
                                    "gender".tr(),
                                  ),
                                  FxSpacing.height(8),
                                  DropdownButtonFormField<Gender>(
                                      dropdownColor: colorScheme.background,
                                      menuMaxHeight: 200,
                                      items: Gender.values
                                          .map((gender) =>
                                              DropdownMenuItem<Gender>(
                                                  value: gender,
                                                  child: FxText.labelMedium(
                                                    gender.name.capitalize,
                                                  )))
                                          .toList(),
                                      icon: Icon(
                                        Icons.expand_more,
                                        size: 20,
                                      ),
                                      decoration: InputDecoration(
                                          hintText: "Select gender",
                                          hintStyle: FxTextStyle.bodySmall(
                                              xMuted: true),
                                          border: outlineInputBorder,
                                          enabledBorder: outlineInputBorder,
                                          focusedBorder: focusedInputBorder,
                                          contentPadding: FxSpacing.all(16),
                                          isCollapsed: true,
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.never),
                                      onChanged: controller.basicValidator
                                          .onChanged<Object?>('gender'),
                                      validator: controller.basicValidator
                                          .getValidation<Gender?>('gender')),
                                  FxSpacing.height(20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      FxButton(
                                        onPressed: controller.onResetBasicForm,
                                        elevation: 0,
                                        padding: FxSpacing.xy(20, 16),
                                        backgroundColor: contentTheme.secondary,
                                        borderRadiusAll:
                                            AppStyle.buttonRadius.medium,
                                        child: FxText.bodySmall(
                                          'clear'.tr(),
                                          color: contentTheme.onSecondary,
                                        ),
                                      ),
                                      FxSpacing.width(16),
                                      FxButton(
                                        onPressed: controller.onSubmitBasicForm,
                                        elevation: 0,
                                        padding: FxSpacing.xy(20, 16),
                                        backgroundColor: contentTheme.primary,
                                        borderRadiusAll:
                                            AppStyle.buttonRadius.medium,
                                        child: FxText.bodySmall(
                                          'submit'.tr(),
                                          color: contentTheme.onPrimary,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}
