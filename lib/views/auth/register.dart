import 'package:pickle/controllers/auth/register_controller.dart';
import 'package:pickle/extensions/extensions.dart';
import 'package:pickle/utils/mixins/ui_mixin.dart';
import 'package:pickle/views/layouts/auth_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
    with SingleTickerProviderStateMixin, UIMixin {
  late RegisterController controller;

  @override
  void initState() {
    super.initState();
    controller = FxControllerStore.putOrFind(RegisterController());
  }

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      child: FxBuilder<RegisterController>(
        controller: controller,
        builder: (controller) {
          return Padding(
            padding: FxSpacing.all(flexSpacing),
            child: Form(
              key: controller.basicValidator.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: FxText.titleLarge(
                    "register".tr(),
                    fontWeight: 700,
                  )),
                  FxSpacing.height(10),
                  Center(
                      child: FxText.bodySmall(
                    "don't_have_an_account?_create_your_\naccount,_it_takes_less_than_a_minute"
                        .tr(),
                    muted: true,
                  )),
                  FxSpacing.height(45),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FxText.labelMedium(
                              "first_name".tr().capitalizeWords,
                            ),
                            FxSpacing.height(4),
                            TextFormField(
                              validator: controller.basicValidator
                                  .getValidation('first_name'),
                              controller: controller.basicValidator
                                  .getController('first_name'),
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelText: "First Name",
                                labelStyle: FxTextStyle.bodySmall(xMuted: true),
                                border: outlineInputBorder,
                                prefixIcon: Icon(
                                  Icons.person_outline,
                                  size: 20,
                                ),
                                contentPadding: FxSpacing.all(16),
                                isCollapsed: true,
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                              ),
                            ),
                          ],
                        ),
                      ),
                      FxSpacing.width(20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FxText.labelMedium(
                              "last_name".tr().capitalizeWords,
                            ),
                            FxSpacing.height(4),
                            TextFormField(
                              validator: controller.basicValidator
                                  .getValidation('last_name'),
                              controller: controller.basicValidator
                                  .getController('last_name'),
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelText: "Last Name",
                                labelStyle: FxTextStyle.bodySmall(xMuted: true),
                                border: outlineInputBorder,
                                prefixIcon: Icon(
                                  Icons.person_outline,
                                  size: 20,
                                ),
                                contentPadding: FxSpacing.all(16),
                                isCollapsed: true,
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  FxSpacing.height(20),
                  FxText.labelMedium(
                    "email_address".tr().capitalizeWords,
                  ),
                  FxSpacing.height(4),
                  TextFormField(
                    validator: controller.basicValidator.getValidation('email'),
                    controller:
                        controller.basicValidator.getController('email'),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "Email Address",
                      labelStyle: FxTextStyle.bodySmall(xMuted: true),
                      border: outlineInputBorder,
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        size: 20,
                      ),
                      contentPadding: FxSpacing.all(16),
                      isCollapsed: true,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                    ),
                  ),
                  FxSpacing.height(20),
                  FxText.labelMedium(
                    "email_password".tr().capitalizeWords,
                  ),
                  FxSpacing.height(4),
                  TextFormField(
                    validator:
                        controller.basicValidator.getValidation('password'),
                    controller:
                        controller.basicValidator.getController('password'),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: !controller.showPassword,
                    decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: FxTextStyle.bodySmall(xMuted: true),
                        border: outlineInputBorder,
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          size: 20,
                        ),
                        suffixIcon: InkWell(
                          onTap: controller.onChangeShowPassword,
                          child: Icon(
                            controller.showPassword
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            size: 20,
                          ),
                        ),
                        contentPadding: FxSpacing.all(16),
                        isCollapsed: true,
                        floatingLabelBehavior: FloatingLabelBehavior.never),
                  ),
                  FxSpacing.height(30),
                  Center(
                    child: FxButton.rounded(
                      onPressed: controller.onLogin,
                      elevation: 0,
                      padding: FxSpacing.xy(20, 16),
                      backgroundColor: contentTheme.primary,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          controller.loading
                              ? SizedBox(
                                  height: 14,
                                  width: 14,
                                  child: CircularProgressIndicator(
                                    color: colorScheme.onPrimary,
                                    strokeWidth: 1.2,
                                  ),
                                )
                              : Container(),
                          if (controller.loading) FxSpacing.width(16),
                          FxText.bodySmall(
                            'register'.tr(),
                            color: contentTheme.onPrimary,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: FxButton.text(
                      onPressed: controller.gotoLogin,
                      elevation: 0,
                      padding: FxSpacing.x(16),
                      splashColor: contentTheme.secondary.withOpacity(0.1),
                      child: FxText.labelMedium(
                        'already_have_account_?'.tr(),
                        color: contentTheme.secondary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
