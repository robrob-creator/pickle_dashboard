import 'package:pickle/controllers/auth/reset_password_controller.dart';
import 'package:pickle/extensions/extensions.dart';
import 'package:pickle/utils/mixins/ui_mixin.dart';
import 'package:pickle/views/layouts/auth_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage>
    with SingleTickerProviderStateMixin, UIMixin {
  late ResetPasswordController controller;

  @override
  void initState() {
    super.initState();
    controller = FxControllerStore.putOrFind(ResetPasswordController());
  }

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      child: FxBuilder(
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
                      "reset_password".tr().capitalizeWords,
                      fontWeight: 700,
                    ),
                  ),
                  FxSpacing.height(10),
                  Center(
                    child: FxText.bodySmall(
                      "your_password_will_be_reset".tr(),
                      muted: true,
                    ),
                  ),
                  FxSpacing.height(45),
                  FxText.labelMedium("password".tr()),
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
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                    ),
                  ),
                  FxSpacing.height(15),
                  FxText.labelMedium("confirm_password".tr().capitalizeWords),
                  FxSpacing.height(4),
                  TextFormField(
                    validator: controller.basicValidator
                        .getValidation('confirm_password'),
                    controller: controller.basicValidator
                        .getController('confirm_password'),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: controller.confirmPassword,
                    decoration: InputDecoration(
                      labelText: "Confirm Password",
                      labelStyle: FxTextStyle.bodySmall(xMuted: true),
                      border: outlineInputBorder,
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        size: 20,
                      ),
                      suffixIcon: InkWell(
                        onTap: controller.onResetPasswordPassword,
                        child: Icon(
                          controller.confirmPassword
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          size: 20,
                        ),
                      ),
                      contentPadding: FxSpacing.all(16),
                      isCollapsed: true,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                    ),
                  ),
                  FxSpacing.height(25),
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
                            'confirm'.tr(),
                            color: contentTheme.onPrimary,
                          ),
                        ],
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
