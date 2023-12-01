import 'package:pickle/controllers/ui/buttons_controller.dart';
import 'package:pickle/extensions/string.dart';
import 'package:pickle/services/theme/app_style.dart';
import 'package:pickle/utils/mixins/ui_mixin.dart';
import 'package:pickle/views/layouts/layout.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

class ButtonsPage extends StatefulWidget {
  const ButtonsPage({super.key});

  @override
  _ButtonsPageState createState() => _ButtonsPageState();
}

class _ButtonsPageState extends State<ButtonsPage>
    with SingleTickerProviderStateMixin, UIMixin {
  late ButtonsController controller;

  @override
  void initState() {
    super.initState();
    controller = FxControllerStore.putOrFind(ButtonsController());
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: FxBuilder<ButtonsController>(
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
                      "buttons".tr(),
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    FxBreadcrumb(
                      children: [
                        FxBreadcrumbItem(name: 'ui'.tr().toUpperCase()),
                        FxBreadcrumbItem(name: 'buttons'.tr(), active: true),
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FxText.titleMedium(
                                'elevated_button'.tr().capitalizeWords,
                                fontWeight: 600,
                                letterSpacing: 0,
                              ),
                              FxSpacing.height(16),
                              Wrap(
                                spacing: 12,
                                runSpacing: 12,
                                children: [
                                  FxButton(
                                    onPressed: () {},
                                    elevation: 6,
                                    padding: FxSpacing.xy(20, 16),
                                    backgroundColor: contentTheme.primary,
                                    borderRadiusAll:
                                        AppStyle.buttonRadius.medium,
                                    child: FxText.bodySmall(
                                      'primary'.tr(),
                                      color: contentTheme.onPrimary,
                                    ),
                                  ),
                                  FxButton(
                                    onPressed: () {},
                                    elevation: 6,
                                    padding: FxSpacing.xy(20, 16),
                                    backgroundColor: contentTheme.secondary,
                                    borderRadiusAll:
                                        AppStyle.buttonRadius.medium,
                                    child: FxText.bodySmall(
                                      'secondary'.tr(),
                                      color: contentTheme.onSecondary,
                                    ),
                                  ),
                                  FxButton(
                                    onPressed: () {},
                                    elevation: 6,
                                    padding: FxSpacing.xy(20, 16),
                                    backgroundColor: contentTheme.success,
                                    borderRadiusAll:
                                        AppStyle.buttonRadius.medium,
                                    child: FxText.bodySmall(
                                      'success'.tr(),
                                      color: contentTheme.onSuccess,
                                    ),
                                  ),
                                  FxButton(
                                    onPressed: () {},
                                    elevation: 6,
                                    padding: FxSpacing.xy(20, 16),
                                    backgroundColor: contentTheme.warning,
                                    borderRadiusAll:
                                        AppStyle.buttonRadius.medium,
                                    child: FxText.bodySmall(
                                      'warning'.tr(),
                                      color: contentTheme.onWarning,
                                      fontWeight: 600,
                                    ),
                                  ),
                                  FxButton(
                                    onPressed: () {},
                                    elevation: 6,
                                    padding: FxSpacing.xy(20, 16),
                                    backgroundColor: contentTheme.info,
                                    borderRadiusAll:
                                        AppStyle.buttonRadius.medium,
                                    child: FxText.bodySmall(
                                      'info'.tr(),
                                      color: contentTheme.onInfo,
                                    ),
                                  ),
                                  FxButton(
                                    onPressed: () {},
                                    elevation: 6,
                                    padding: FxSpacing.xy(20, 16),
                                    backgroundColor: contentTheme.danger,
                                    borderRadiusAll:
                                        AppStyle.buttonRadius.medium,
                                    child: FxText.bodySmall(
                                      'danger'.tr(),
                                      color: contentTheme.onDanger,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )),
                    FxFlexItem(
                        sizes: "lg-6 md-12",
                        child: FxContainer.bordered(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FxText.titleMedium(
                                'elevated_rounded_button'.tr().capitalizeWords,
                                fontWeight: 600,
                                letterSpacing: 0,
                              ),
                              FxSpacing.height(16),
                              Wrap(
                                spacing: 12,
                                runSpacing: 12,
                                children: [
                                  FxButton(
                                    onPressed: () {},
                                    elevation: 6,
                                    padding: FxSpacing.xy(20, 16),
                                    backgroundColor: contentTheme.primary,
                                    borderRadiusAll: 20,
                                    child: FxText.bodySmall(
                                      'primary'.tr(),
                                      color: contentTheme.onPrimary,
                                    ),
                                  ),
                                  FxButton(
                                    onPressed: () {},
                                    elevation: 6,
                                    padding: FxSpacing.xy(20, 16),
                                    backgroundColor: contentTheme.secondary,
                                    borderRadiusAll: 20,
                                    child: FxText.bodySmall(
                                      'secondary'.tr(),
                                      color: contentTheme.onSecondary,
                                    ),
                                  ),
                                  FxButton(
                                    onPressed: () {},
                                    elevation: 6,
                                    padding: FxSpacing.xy(20, 16),
                                    backgroundColor: contentTheme.success,
                                    borderRadiusAll: 20,
                                    child: FxText.bodySmall(
                                      'success'.tr(),
                                      color: contentTheme.onSuccess,
                                    ),
                                  ),
                                  FxButton(
                                    onPressed: () {},
                                    elevation: 6,
                                    padding: FxSpacing.xy(20, 16),
                                    backgroundColor: contentTheme.warning,
                                    borderRadiusAll: 20,
                                    child: FxText.bodySmall(
                                      'warning'.tr(),
                                      color: contentTheme.onWarning,
                                      fontWeight: 600,
                                    ),
                                  ),
                                  FxButton(
                                    onPressed: () {},
                                    elevation: 6,
                                    padding: FxSpacing.xy(20, 16),
                                    backgroundColor: contentTheme.info,
                                    borderRadiusAll: 20,
                                    child: FxText.bodySmall(
                                      'info'.tr(),
                                      color: contentTheme.onInfo,
                                    ),
                                  ),
                                  FxButton(
                                    onPressed: () {},
                                    elevation: 6,
                                    padding: FxSpacing.xy(20, 16),
                                    backgroundColor: contentTheme.danger,
                                    borderRadiusAll: 20,
                                    child: FxText.bodySmall(
                                      'danger'.tr(),
                                      color: contentTheme.onDanger,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )),
                    FxFlexItem(
                        sizes: "lg-6 md-12",
                        child: FxContainer.bordered(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FxText.titleMedium(
                                'flat_button'.tr().capitalizeWords,
                                fontWeight: 600,
                                letterSpacing: 0,
                              ),
                              FxSpacing.height(16),
                              Wrap(
                                spacing: 12,
                                runSpacing: 12,
                                children: [
                                  FxButton(
                                    onPressed: () {},
                                    elevation: 0,
                                    padding: FxSpacing.xy(20, 16),
                                    backgroundColor: contentTheme.primary,
                                    borderRadiusAll:
                                        AppStyle.buttonRadius.medium,
                                    child: FxText.bodySmall(
                                      'primary'.tr(),
                                      color: contentTheme.onPrimary,
                                    ),
                                  ),
                                  FxButton(
                                    onPressed: () {},
                                    elevation: 0,
                                    padding: FxSpacing.xy(20, 16),
                                    backgroundColor: contentTheme.secondary,
                                    borderRadiusAll:
                                        AppStyle.buttonRadius.medium,
                                    child: FxText.bodySmall(
                                      'secondary'.tr(),
                                      color: contentTheme.onSecondary,
                                    ),
                                  ),
                                  FxButton(
                                    onPressed: () {},
                                    elevation: 0,
                                    padding: FxSpacing.xy(20, 16),
                                    backgroundColor: contentTheme.success,
                                    borderRadiusAll:
                                        AppStyle.buttonRadius.medium,
                                    child: FxText.bodySmall(
                                      'success'.tr(),
                                      color: contentTheme.onSuccess,
                                    ),
                                  ),
                                  FxButton(
                                    onPressed: () {},
                                    elevation: 0,
                                    padding: FxSpacing.xy(20, 16),
                                    backgroundColor: contentTheme.warning,
                                    borderRadiusAll:
                                        AppStyle.buttonRadius.medium,
                                    child: FxText.bodySmall(
                                      'warning'.tr(),
                                      color: contentTheme.onWarning,
                                      fontWeight: 600,
                                    ),
                                  ),
                                  FxButton(
                                    onPressed: () {},
                                    elevation: 0,
                                    padding: FxSpacing.xy(20, 16),
                                    backgroundColor: contentTheme.info,
                                    borderRadiusAll:
                                        AppStyle.buttonRadius.medium,
                                    child: FxText.bodySmall(
                                      'info'.tr(),
                                      color: contentTheme.onInfo,
                                    ),
                                  ),
                                  FxButton(
                                    onPressed: () {},
                                    elevation: 0,
                                    padding: FxSpacing.xy(20, 16),
                                    backgroundColor: contentTheme.danger,
                                    borderRadiusAll:
                                        AppStyle.buttonRadius.medium,
                                    child: FxText.bodySmall(
                                      'danger'.tr(),
                                      color: contentTheme.onDanger,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )),
                    FxFlexItem(
                        sizes: "lg-6 md-12",
                        child: FxContainer.bordered(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FxText.titleMedium(
                                'rounded_button'.tr().capitalizeWords,
                                fontWeight: 600,
                                letterSpacing: 0,
                              ),
                              FxSpacing.height(16),
                              Wrap(
                                spacing: 12,
                                runSpacing: 12,
                                children: [
                                  FxButton(
                                    onPressed: () {},
                                    elevation: 0,
                                    padding: FxSpacing.xy(20, 16),
                                    // padding: FxSpacing.xy(12, 8),

                                    backgroundColor: contentTheme.primary,
                                    borderRadiusAll: 20,
                                    child: FxText.bodySmall(
                                      'primary'.tr(),
                                      color: contentTheme.onPrimary,
                                    ),
                                  ),
                                  FxButton(
                                    onPressed: () {},
                                    elevation: 0,
                                    padding: FxSpacing.xy(20, 16),
                                    backgroundColor: contentTheme.secondary,
                                    borderRadiusAll: 20,
                                    child: FxText.bodySmall(
                                      'secondary'.tr(),
                                      color: contentTheme.onSecondary,
                                    ),
                                  ),
                                  FxButton(
                                    onPressed: () {},
                                    elevation: 0,
                                    padding: FxSpacing.xy(20, 16),
                                    backgroundColor: contentTheme.success,
                                    borderRadiusAll: 20,
                                    child: FxText.bodySmall(
                                      'success'.tr(),
                                      color: contentTheme.onSuccess,
                                    ),
                                  ),
                                  FxButton(
                                    onPressed: () {},
                                    elevation: 0,
                                    padding: FxSpacing.xy(20, 16),
                                    backgroundColor: contentTheme.warning,
                                    borderRadiusAll: 20,
                                    child: FxText.bodySmall(
                                      'warning'.tr(),
                                      color: contentTheme.onWarning,
                                      fontWeight: 600,
                                    ),
                                  ),
                                  FxButton(
                                    onPressed: () {},
                                    elevation: 0,
                                    padding: FxSpacing.xy(20, 16),
                                    backgroundColor: contentTheme.info,
                                    borderRadiusAll: 20,
                                    child: FxText.bodySmall(
                                      'info'.tr(),
                                      color: contentTheme.onInfo,
                                    ),
                                  ),
                                  FxButton(
                                    onPressed: () {},
                                    elevation: 0,
                                    padding: FxSpacing.xy(20, 16),
                                    backgroundColor: contentTheme.danger,
                                    borderRadiusAll: 20,
                                    child: FxText.bodySmall(
                                      'danger'.tr(),
                                      color: contentTheme.onDanger,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )),
                    FxFlexItem(
                        sizes: "lg-6 md-12",
                        child: FxContainer.bordered(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FxText.titleMedium(
                                'outline_button'.tr().capitalizeWords,
                                fontWeight: 600,
                                letterSpacing: 0,
                              ),
                              FxSpacing.height(16),
                              Wrap(
                                spacing: 12,
                                runSpacing: 12,
                                children: [
                                  FxButton.outlined(
                                    onPressed: () {},
                                    elevation: 0,
                                    padding: FxSpacing.xy(20, 16),
                                    borderColor: contentTheme.primary,
                                    splashColor:
                                        contentTheme.primary.withOpacity(0.1),
                                    borderRadiusAll:
                                        AppStyle.buttonRadius.medium,
                                    child: FxText.bodySmall(
                                      'primary'.tr(),
                                      color: contentTheme.primary,
                                    ),
                                  ),
                                  FxButton.outlined(
                                    onPressed: () {},
                                    elevation: 0,
                                    padding: FxSpacing.xy(20, 16),
                                    borderColor: contentTheme.secondary,
                                    splashColor:
                                        contentTheme.secondary.withOpacity(0.1),
                                    borderRadiusAll:
                                        AppStyle.buttonRadius.medium,
                                    child: FxText.bodySmall(
                                      'secondary'.tr(),
                                      color: contentTheme.secondary,
                                    ),
                                  ),
                                  FxButton.outlined(
                                    onPressed: () {},
                                    elevation: 0,
                                    padding: FxSpacing.xy(20, 16),
                                    borderColor: contentTheme.success,
                                    splashColor:
                                        contentTheme.success.withOpacity(0.1),
                                    borderRadiusAll:
                                        AppStyle.buttonRadius.medium,
                                    child: FxText.bodySmall(
                                      'success'.tr(),
                                      color: contentTheme.success,
                                    ),
                                  ),
                                  FxButton.outlined(
                                    onPressed: () {},
                                    elevation: 0,
                                    padding: FxSpacing.xy(20, 16),
                                    borderColor: contentTheme.warning,
                                    splashColor:
                                        contentTheme.warning.withOpacity(0.1),
                                    borderRadiusAll:
                                        AppStyle.buttonRadius.medium,
                                    child: FxText.bodySmall(
                                      'warning'.tr(),
                                      color: contentTheme.warning,
                                    ),
                                  ),
                                  FxButton.outlined(
                                    onPressed: () {},
                                    elevation: 0,
                                    padding: FxSpacing.xy(20, 16),
                                    borderColor: contentTheme.info,
                                    splashColor:
                                        contentTheme.info.withOpacity(0.1),
                                    borderRadiusAll:
                                        AppStyle.buttonRadius.medium,
                                    child: FxText.bodySmall(
                                      'info'.tr(),
                                      color: contentTheme.info,
                                    ),
                                  ),
                                  FxButton.outlined(
                                    onPressed: () {},
                                    elevation: 0,
                                    padding: FxSpacing.xy(20, 16),
                                    borderColor: contentTheme.danger,
                                    splashColor:
                                        contentTheme.danger.withOpacity(0.1),
                                    borderRadiusAll:
                                        AppStyle.buttonRadius.medium,
                                    child: FxText.bodySmall(
                                      'danger'.tr(),
                                      color: contentTheme.danger,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )),
                    FxFlexItem(
                        sizes: "lg-6 md-12",
                        child: FxContainer.bordered(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FxText.titleMedium(
                                'outline_rounded_button'.tr().capitalizeWords,
                                fontWeight: 600,
                                letterSpacing: 0,
                              ),
                              FxSpacing.height(16),
                              Wrap(
                                spacing: 12,
                                runSpacing: 12,
                                children: [
                                  FxButton.outlined(
                                    onPressed: () {},
                                    elevation: 0,
                                    padding: FxSpacing.xy(20, 16),
                                    borderColor: contentTheme.primary,
                                    splashColor:
                                        contentTheme.primary.withOpacity(0.1),
                                    borderRadiusAll: 20,
                                    child: FxText.bodySmall(
                                      'primary'.tr(),
                                      color: contentTheme.primary,
                                    ),
                                  ),
                                  FxButton.outlined(
                                    onPressed: () {},
                                    elevation: 0,
                                    padding: FxSpacing.xy(20, 16),
                                    borderColor: contentTheme.secondary,
                                    splashColor:
                                        contentTheme.secondary.withOpacity(0.1),
                                    borderRadiusAll: 20,
                                    child: FxText.bodySmall(
                                      'secondary'.tr(),
                                      color: contentTheme.secondary,
                                    ),
                                  ),
                                  FxButton.outlined(
                                    onPressed: () {},
                                    elevation: 0,
                                    padding: FxSpacing.xy(20, 16),
                                    borderColor: contentTheme.success,
                                    splashColor:
                                        contentTheme.success.withOpacity(0.1),
                                    borderRadiusAll: 20,
                                    child: FxText.bodySmall(
                                      'success'.tr(),
                                      color: contentTheme.success,
                                    ),
                                  ),
                                  FxButton.outlined(
                                    onPressed: () {},
                                    elevation: 0,
                                    padding: FxSpacing.xy(20, 16),
                                    borderColor: contentTheme.warning,
                                    splashColor:
                                        contentTheme.warning.withOpacity(0.1),
                                    borderRadiusAll: 20,
                                    child: FxText.bodySmall(
                                      'warning'.tr(),
                                      color: contentTheme.warning,
                                    ),
                                  ),
                                  FxButton.outlined(
                                    onPressed: () {},
                                    elevation: 0,
                                    padding: FxSpacing.xy(20, 16),
                                    borderColor: contentTheme.info,
                                    splashColor:
                                        contentTheme.info.withOpacity(0.1),
                                    borderRadiusAll: 20,
                                    child: FxText.bodySmall(
                                      'info'.tr(),
                                      color: contentTheme.info,
                                    ),
                                  ),
                                  FxButton.outlined(
                                    onPressed: () {},
                                    elevation: 0,
                                    padding: FxSpacing.xy(20, 16),
                                    borderColor: contentTheme.danger,
                                    splashColor:
                                        contentTheme.danger.withOpacity(0.1),
                                    borderRadiusAll: 20,
                                    child: FxText.bodySmall(
                                      'danger'.tr(),
                                      color: contentTheme.danger,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )),
                    FxFlexItem(
                        sizes: "lg-6 md-12",
                        child: FxContainer.bordered(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FxText.titleMedium(
                                'soft_button'.tr().capitalizeWords,
                                fontWeight: 600,
                                letterSpacing: 0,
                              ),
                              FxSpacing.height(16),
                              Wrap(
                                spacing: 12,
                                runSpacing: 12,
                                children: [
                                  FxButton(
                                    onPressed: () {},
                                    elevation: 0,
                                    padding: FxSpacing.xy(20, 16),
                                    borderColor: contentTheme.primary,
                                    backgroundColor:
                                        contentTheme.primary.withOpacity(0.12),
                                    splashColor:
                                        contentTheme.primary.withOpacity(0.2),
                                    borderRadiusAll:
                                        AppStyle.buttonRadius.medium,
                                    child: FxText.bodySmall(
                                      'primary'.tr(),
                                      color: contentTheme.primary,
                                    ),
                                  ),
                                  FxButton(
                                    onPressed: () {},
                                    elevation: 0,
                                    padding: FxSpacing.xy(20, 16),
                                    borderColor: contentTheme.secondary,
                                    backgroundColor: contentTheme.secondary
                                        .withOpacity(0.12),
                                    splashColor:
                                        contentTheme.secondary.withOpacity(0.2),
                                    borderRadiusAll:
                                        AppStyle.buttonRadius.medium,
                                    child: FxText.bodySmall(
                                      'secondary'.tr(),
                                      color: contentTheme.secondary,
                                    ),
                                  ),
                                  FxButton(
                                    onPressed: () {},
                                    elevation: 0,
                                    padding: FxSpacing.xy(20, 16),
                                    borderColor: contentTheme.success,
                                    backgroundColor:
                                        contentTheme.success.withOpacity(0.12),
                                    splashColor:
                                        contentTheme.success.withOpacity(0.2),
                                    borderRadiusAll:
                                        AppStyle.buttonRadius.medium,
                                    child: FxText.bodySmall(
                                      'success'.tr(),
                                      color: contentTheme.success,
                                    ),
                                  ),
                                  FxButton(
                                    onPressed: () {},
                                    elevation: 0,
                                    padding: FxSpacing.xy(20, 16),
                                    borderColor: contentTheme.warning,
                                    backgroundColor:
                                        contentTheme.warning.withOpacity(0.12),
                                    splashColor:
                                        contentTheme.warning.withOpacity(0.2),
                                    borderRadiusAll:
                                        AppStyle.buttonRadius.medium,
                                    child: FxText.bodySmall(
                                      'warning'.tr(),
                                      color: contentTheme.warning,
                                    ),
                                  ),
                                  FxButton(
                                    onPressed: () {},
                                    elevation: 0,
                                    padding: FxSpacing.xy(20, 16),
                                    borderColor: contentTheme.info,
                                    backgroundColor:
                                        contentTheme.info.withOpacity(0.12),
                                    splashColor:
                                        contentTheme.info.withOpacity(0.2),
                                    borderRadiusAll:
                                        AppStyle.buttonRadius.medium,
                                    child: FxText.bodySmall(
                                      'info'.tr(),
                                      color: contentTheme.info,
                                    ),
                                  ),
                                  FxButton(
                                    onPressed: () {},
                                    elevation: 0,
                                    padding: FxSpacing.xy(20, 16),
                                    borderColor: contentTheme.danger,
                                    backgroundColor:
                                        contentTheme.danger.withOpacity(0.12),
                                    splashColor:
                                        contentTheme.danger.withOpacity(0.2),
                                    borderRadiusAll:
                                        AppStyle.buttonRadius.medium,
                                    child: FxText.bodySmall(
                                      'danger'.tr(),
                                      color: contentTheme.danger,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )),
                    FxFlexItem(
                        sizes: "lg-6 md-12",
                        child: FxContainer.bordered(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FxText.titleMedium(
                                'soft_rounded_button'.tr().capitalizeWords,
                                fontWeight: 600,
                                letterSpacing: 0,
                              ),
                              FxSpacing.height(16),
                              Wrap(
                                spacing: 12,
                                runSpacing: 12,
                                children: [
                                  FxButton(
                                    onPressed: () {},
                                    elevation: 0,
                                    padding: FxSpacing.xy(20, 16),
                                    borderColor: contentTheme.primary,
                                    backgroundColor:
                                        contentTheme.primary.withOpacity(0.12),
                                    splashColor:
                                        contentTheme.primary.withOpacity(0.2),
                                    borderRadiusAll: 20,
                                    child: FxText.bodySmall(
                                      'primary'.tr(),
                                      color: contentTheme.primary,
                                    ),
                                  ),
                                  FxButton(
                                    onPressed: () {},
                                    elevation: 0,
                                    padding: FxSpacing.xy(20, 16),
                                    borderColor: contentTheme.secondary,
                                    backgroundColor: contentTheme.secondary
                                        .withOpacity(0.12),
                                    splashColor:
                                        contentTheme.secondary.withOpacity(0.2),
                                    borderRadiusAll: 20,
                                    child: FxText.bodySmall(
                                      'secondary'.tr(),
                                      color: contentTheme.secondary,
                                    ),
                                  ),
                                  FxButton(
                                    onPressed: () {},
                                    elevation: 0,
                                    padding: FxSpacing.xy(20, 16),
                                    borderColor: contentTheme.success,
                                    backgroundColor:
                                        contentTheme.success.withOpacity(0.12),
                                    splashColor:
                                        contentTheme.success.withOpacity(0.2),
                                    borderRadiusAll: 20,
                                    child: FxText.bodySmall(
                                      'success'.tr(),
                                      color: contentTheme.success,
                                    ),
                                  ),
                                  FxButton(
                                    onPressed: () {},
                                    elevation: 0,
                                    padding: FxSpacing.xy(20, 16),
                                    borderColor: contentTheme.warning,
                                    backgroundColor:
                                        contentTheme.warning.withOpacity(0.12),
                                    splashColor:
                                        contentTheme.warning.withOpacity(0.2),
                                    borderRadiusAll: 20,
                                    child: FxText.bodySmall(
                                      'warning'.tr(),
                                      color: contentTheme.warning,
                                    ),
                                  ),
                                  FxButton(
                                    onPressed: () {},
                                    elevation: 0,
                                    padding: FxSpacing.xy(20, 16),
                                    borderColor: contentTheme.info,
                                    backgroundColor:
                                        contentTheme.info.withOpacity(0.12),
                                    splashColor:
                                        contentTheme.info.withOpacity(0.2),
                                    borderRadiusAll: 20,
                                    child: FxText.bodySmall(
                                      'info'.tr(),
                                      color: contentTheme.info,
                                    ),
                                  ),
                                  FxButton(
                                    onPressed: () {},
                                    elevation: 0,
                                    padding: FxSpacing.xy(20, 16),
                                    borderColor: contentTheme.danger,
                                    backgroundColor:
                                        contentTheme.danger.withOpacity(0.12),
                                    splashColor:
                                        contentTheme.danger.withOpacity(0.2),
                                    borderRadiusAll: 20,
                                    child: FxText.bodySmall(
                                      'danger'.tr(),
                                      color: contentTheme.danger,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )),
                    FxFlexItem(
                        sizes: "lg-6 md-12",
                        child: FxContainer.bordered(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FxText.titleMedium(
                                'text_button'.tr().capitalizeWords,
                                fontWeight: 600,
                                letterSpacing: 0,
                              ),
                              FxSpacing.height(16),
                              Wrap(
                                spacing: 12,
                                runSpacing: 12,
                                children: [
                                  FxButton.text(
                                    onPressed: () {},
                                    elevation: 6,
                                    padding: FxSpacing.xy(20, 16),
                                    child: FxText.bodySmall(
                                      'primary'.tr(),
                                      color: contentTheme.primary,
                                    ),
                                  ),
                                  FxButton.text(
                                    onPressed: () {},
                                    padding: FxSpacing.xy(20, 16),
                                    splashColor:
                                        contentTheme.secondary.withOpacity(0.1),
                                    child: FxText.bodySmall(
                                      'secondary'.tr(),
                                      color: contentTheme.secondary,
                                    ),
                                  ),
                                  FxButton.text(
                                    onPressed: () {},
                                    padding: FxSpacing.xy(20, 16),
                                    splashColor:
                                        contentTheme.success.withOpacity(0.1),
                                    child: FxText.bodySmall(
                                      'success'.tr(),
                                      color: contentTheme.success,
                                    ),
                                  ),
                                  FxButton.text(
                                    onPressed: () {},
                                    padding: FxSpacing.xy(20, 16),
                                    splashColor:
                                        contentTheme.warning.withOpacity(0.1),
                                    child: FxText.bodySmall(
                                      'warning'.tr(),
                                      color: contentTheme.warning,
                                    ),
                                  ),
                                  FxButton.text(
                                    onPressed: () {},
                                    padding: FxSpacing.xy(20, 16),
                                    splashColor:
                                        contentTheme.info.withOpacity(0.1),
                                    child: FxText.bodySmall('Info',
                                        color: contentTheme.info),
                                  ),
                                  FxButton.text(
                                    onPressed: () {},
                                    padding: FxSpacing.xy(20, 16),
                                    splashColor:
                                        contentTheme.danger.withOpacity(0.1),
                                    child: FxText.bodySmall(
                                      'danger'.tr(),
                                      color: contentTheme.danger,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )),
                    FxFlexItem(
                        sizes: "lg-6 md-12",
                        child: FxContainer.bordered(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FxText.titleMedium(
                                'text_rounded_button'.tr().capitalizeWords,
                                fontWeight: 600,
                                letterSpacing: 0,
                              ),
                              FxSpacing.height(16),
                              Wrap(
                                spacing: 12,
                                runSpacing: 12,
                                children: [
                                  FxButton.text(
                                    onPressed: () {},
                                    padding: FxSpacing.xy(20, 16),
                                    borderRadiusAll: 20,
                                    child: FxText.bodySmall(
                                      'primary'.tr(),
                                      color: contentTheme.primary,
                                    ),
                                  ),
                                  FxButton.text(
                                    onPressed: () {},
                                    padding: FxSpacing.xy(20, 16),
                                    borderRadiusAll: 20,
                                    splashColor:
                                        contentTheme.secondary.withOpacity(0.1),
                                    child: FxText.bodySmall(
                                      'secondary'.tr(),
                                      color: contentTheme.secondary,
                                    ),
                                  ),
                                  FxButton.text(
                                    onPressed: () {},
                                    padding: FxSpacing.xy(20, 16),
                                    borderRadiusAll: 20,
                                    splashColor:
                                        contentTheme.success.withOpacity(0.1),
                                    child: FxText.bodySmall(
                                      'success'.tr(),
                                      color: contentTheme.success,
                                    ),
                                  ),
                                  FxButton.text(
                                    onPressed: () {},
                                    padding: FxSpacing.xy(20, 16),
                                    borderRadiusAll: 20,
                                    splashColor:
                                        contentTheme.warning.withOpacity(0.1),
                                    child: FxText.bodySmall(
                                      'warning'.tr(),
                                      color: contentTheme.warning,
                                    ),
                                  ),
                                  FxButton.text(
                                    onPressed: () {},
                                    padding: FxSpacing.xy(20, 16),
                                    borderRadiusAll: 20,
                                    splashColor:
                                        contentTheme.info.withOpacity(0.1),
                                    child: FxText.bodySmall(
                                      'info'.tr(),
                                      color: contentTheme.info,
                                    ),
                                  ),
                                  FxButton.text(
                                    onPressed: () {},
                                    padding: FxSpacing.xy(20, 16),
                                    borderRadiusAll: 20,
                                    splashColor:
                                        contentTheme.danger.withOpacity(0.1),
                                    child: FxText.bodySmall(
                                      'danger'.tr(),
                                      color: contentTheme.danger,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )),
                    FxFlexItem(
                        sizes: "lg-6 md-12",
                        child: FxContainer.bordered(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FxText.titleMedium(
                                'sized_button'.tr().capitalizeWords,
                                fontWeight: 600,
                                letterSpacing: 0,
                              ),
                              FxSpacing.height(16),
                              Wrap(
                                spacing: 12,
                                runSpacing: 12,
                                crossAxisAlignment: WrapCrossAlignment.start,
                                runAlignment: WrapAlignment.start,
                                alignment: WrapAlignment.start,
                                children: [
                                  FxButton(
                                    onPressed: () {},
                                    elevation: 0,
                                    padding: FxSpacing.xy(8, 6),
                                    backgroundColor: contentTheme.primary,
                                    borderRadiusAll:
                                        AppStyle.buttonRadius.medium,
                                    child: FxText.labelSmall(
                                      'small'.tr(),
                                      color: contentTheme.onPrimary,
                                    ),
                                  ),
                                  FxButton(
                                    onPressed: () {},
                                    elevation: 0,
                                    padding: FxSpacing.xy(20, 16),
                                    backgroundColor: contentTheme.primary,
                                    borderRadiusAll:
                                        AppStyle.buttonRadius.medium,
                                    child: FxText.bodySmall(
                                      'medium'.tr(),
                                      color: contentTheme.onPrimary,
                                    ),
                                  ),
                                  FxButton(
                                    onPressed: () {},
                                    elevation: 0,
                                    padding: FxSpacing.xy(40, 24),
                                    backgroundColor: contentTheme.primary,
                                    borderRadiusAll:
                                        AppStyle.buttonRadius.medium,
                                    child: FxText.bodySmall(
                                      'large'.tr(),
                                      color: contentTheme.onPrimary,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )),
                    FxFlexItem(
                      sizes: "lg-6 md-12",
                      child: FxContainer.bordered(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FxText.titleMedium(
                              'button_group'.tr().capitalizeWords,
                              fontWeight: 600,
                              letterSpacing: 0,
                            ),
                            FxSpacing.height(16),
                            ToggleButtons(
                              splashColor: colorScheme.primary.withAlpha(48),
                              color: colorScheme.onBackground,
// fillColor: colorScheme.primary.withAlpha(48),
                              selectedBorderColor:
                                  colorScheme.primary.withAlpha(48),
                              borderRadius: BorderRadius.all(Radius.circular(
                                  AppStyle.containerRadius.small)),
                              isSelected: controller.selected,
                              onPressed: controller.onSelect,
                              children: <Widget>[
                                MSIcon(
                                  'light_mode',
                                  color: colorScheme.primary,
                                  size: 24,
                                ),
                                MSIcon(
                                  'dark_mode',
                                  color: colorScheme.primary,
                                  size: 24,
                                ),
                                MSIcon(
                                  'nights_stay',
                                  color: colorScheme.primary,
                                  size: 24,
                                ),
                              ],
                            ),
                            FxSpacing.height(16),
                            ToggleButtons(
                              splashColor: colorScheme.primary.withAlpha(48),
                              color: colorScheme.onBackground,
                              selectedBorderColor:
                                  colorScheme.primary.withAlpha(48),
                              borderRadius: BorderRadius.all(Radius.circular(
                                  AppStyle.containerRadius.small)),
                              isSelected: controller.selected,
                              onPressed: controller.onSelect,
                              children: <Widget>[
                                Padding(
                                  padding: FxSpacing.x(16),
                                  child: Row(
                                    children: [
                                      MSIcon(
                                        'light_mode',
                                        color: colorScheme.primary,
                                        size: 20,
                                      ),
                                      FxSpacing.width(12),
                                      FxText.labelLarge(
                                        'light'.tr(),
                                        color: colorScheme.primary,
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: FxSpacing.x(16),
                                  child: Row(
                                    children: [
                                      MSIcon(
                                        'dark_mode',
                                        color: colorScheme.primary,
                                        size: 20,
                                      ),
                                      FxSpacing.width(12),
                                      FxText.labelLarge(
                                        'dark'.tr(),
                                        color: colorScheme.primary,
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: FxSpacing.x(16),
                                  child: Row(
                                    children: [
                                      MSIcon(
                                        'nights_stay',
                                        color: colorScheme.primary,
                                        size: 20,
                                      ),
                                      FxSpacing.width(12),
                                      FxText.labelLarge(
                                        'system'.tr(),
                                        color: colorScheme.primary,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
