import 'package:pickle/controllers/auth/locked_controller.dart';
import 'package:pickle/extensions/extensions.dart';
import 'package:pickle/images.dart';
import 'package:pickle/utils/mixins/ui_mixin.dart';
import 'package:pickle/views/layouts/auth_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

class LockedPage extends StatefulWidget {
  const LockedPage({Key? key}) : super(key: key);

  @override
  State<LockedPage> createState() => _LockedPageState();
}

class _LockedPageState extends State<LockedPage>
    with SingleTickerProviderStateMixin, UIMixin {
  late LockedController controller;

  @override
  void initState() {
    super.initState();
    controller = FxControllerStore.putOrFind(LockedController());
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      Images.logoIcon,
                      height: 28,
                    ),
                  ),
                  FxSpacing.height(16),
                  Center(
                    child: FxText.titleLarge(
                      "locked".tr(),
                      fontWeight: 700,
                    ),
                  ),
                  FxSpacing.height(8),
                  Center(
                    child: FxText(
                      "hello_den,_enter_your_password_to_unlock_the_screen!"
                          .tr(),
                    ),
                  ),
                  FxSpacing.height(16),
                  Center(
                    child: FxContainer.none(
                      borderRadiusAll: 26,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Image.asset(
                        Images.avatars[0],
                        height: 44,
                        width: 44,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  FxSpacing.height(8),
                  Center(
                    child: FxText(
                      "den".tr(),
                      fontWeight: 700,
                    ),
                  ),
                  FxSpacing.height(16),
                  FxText.labelMedium(
                    "password".tr(),
                    fontWeight: 600,
                  ),
                  FxSpacing.height(8),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    controller:
                        controller.basicValidator.getController('password'),
                    validator:
                        controller.basicValidator.getValidation('password'),
                    obscureText: !controller.showPassword,
                    decoration: InputDecoration(
                        suffixIcon: InkWell(
                          onTap: controller.onShowPassword,
                          child: Icon(
                            controller.showPassword
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            size: 20,
                          ),
                        ),
                        prefixIcon: Icon(Icons.lock_outline, size: 18),
                        hintText: "Password",
                        hintStyle: FxTextStyle.bodySmall(xMuted: true),
                        border: outlineInputBorder,
                        contentPadding: FxSpacing.all(12),
                        isCollapsed: true,
                        floatingLabelBehavior: FloatingLabelBehavior.never),
                  ),
                  FxSpacing.height(16),
                  Center(
                    child: FxButton.rounded(
                      onPressed: controller.onLock,
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
                            'unlock'.tr(),
                            color: contentTheme.onPrimary,
                          ),
                        ],
                      ),
                    ),
                  ),
                  FxSpacing.height(16),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
