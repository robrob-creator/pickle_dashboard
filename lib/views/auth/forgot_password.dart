import 'package:pickle/controllers/auth/forgot_password_controller.dart';
import 'package:pickle/extensions/extensions.dart';
import 'package:pickle/utils/mixins/ui_mixin.dart';
import 'package:pickle/views/layouts/auth_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage>
    with SingleTickerProviderStateMixin, UIMixin {
  late ForgotPasswordController controller;

  @override
  void initState() {
    super.initState();
    controller = FxControllerStore.putOrFind(ForgotPasswordController());
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
                      "forgot_password".tr().capitalizeWords,
                      fontWeight: 700,
                    ),
                  ),
                  FxSpacing.height(10),
                  Center(
                    child: FxText.bodySmall(
                      "enter_your_email_address_and_we'll_send_you_an_\nemail_with_instructions_to_reset_your_password."
                          .tr(),
                      muted: true,
                    ),
                  ),
                  FxSpacing.height(45),
                  FxText.labelMedium("email_address".tr().capitalizeWords),
                  FxSpacing.height(4),
                  TextFormField(
                    validator: controller.basicValidator.getValidation('email'),
                    controller:
                        controller.basicValidator.getController('email'),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "email_address".tr().capitalizeWords,
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
                  FxSpacing.height(28),
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
                            'forgot_password'.tr().capitalizeWords,
                            color: contentTheme.onPrimary,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: FxButton.text(
                      onPressed: controller.gotoLogIn,
                      elevation: 0,
                      padding: FxSpacing.x(16),
                      splashColor: contentTheme.secondary.withOpacity(0.1),
                      child: FxText.labelMedium(
                        'back_to_log_in'.tr(),
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
