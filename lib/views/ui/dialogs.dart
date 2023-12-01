// TODO: === Add Auth dialogs

import 'package:pickle/controllers/ui/dialogs_controller.dart';
import 'package:pickle/extensions/extensions.dart';
import 'package:pickle/services/theme/app_style.dart';
import 'package:pickle/utils/mixins/ui_mixin.dart';
import 'package:pickle/views/layouts/layout.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

class DialogsPage extends StatefulWidget {
  const DialogsPage({super.key});

  @override
  _DialogsPageState createState() => _DialogsPageState();
}

class _DialogsPageState extends State<DialogsPage>
    with SingleTickerProviderStateMixin, UIMixin {
  late DialogsController controller;

  @override
  void initState() {
    super.initState();
    controller = FxControllerStore.putOrFind(DialogsController());
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
        child: FxBuilder<DialogsController>(
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
                          "dialogs".tr(),
                          fontSize: 18,
                          fontWeight: 600,
                        ),
                        FxBreadcrumb(
                          children: [
                            FxBreadcrumbItem(name: 'ui'.tr().toUpperCase()),
                            FxBreadcrumbItem(
                                name: 'dialogs'.tr(), active: true),
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
                                    'type_/_size'.tr().capitalizeWords,
                                    fontWeight: 600,
                                    letterSpacing: 0,
                                  ),
                                  FxSpacing.height(16),
                                  Wrap(
                                    spacing: flexSpacing / 2,
                                    runSpacing: flexSpacing / 2,
                                    children: [
                                      FxButton(
                                        onPressed: _showAlertDialog,
                                        elevation: 0,
                                        padding: FxSpacing.xy(20, 16),
                                        backgroundColor: contentTheme.primary,
                                        borderRadiusAll:
                                            AppStyle.buttonRadius.medium,
                                        child: FxText.bodySmall(
                                          'alert'.tr(),
                                          color: contentTheme.onPrimary,
                                        ),
                                      ),
                                      FxButton(
                                        onPressed: _showStandardDialog,
                                        elevation: 0,
                                        padding: FxSpacing.xy(20, 16),
                                        backgroundColor: contentTheme.success,
                                        borderRadiusAll:
                                            AppStyle.buttonRadius.medium,
                                        child: FxText.bodySmall(
                                          'standard'.tr(),
                                          color: contentTheme.onSuccess,
                                        ),
                                      ),
                                      FxButton(
                                        onPressed: _showFullWidthDialog,
                                        elevation: 0,
                                        padding: FxSpacing.xy(20, 16),
                                        backgroundColor: contentTheme.warning,
                                        borderRadiusAll:
                                            AppStyle.buttonRadius.medium,
                                        child: FxText.bodySmall(
                                          'full_width'.tr().capitalizeWords,
                                          color: contentTheme.onWarning,
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
                                    'positions'.tr(),
                                    fontWeight: 600,
                                    letterSpacing: 0,
                                  ),
                                  FxSpacing.height(16),
                                  Wrap(
                                    spacing: flexSpacing / 2,
                                    runSpacing: flexSpacing / 2,
                                    children: [
                                      FxButton(
                                        onPressed: _showLeftDialog,
                                        elevation: 0,
                                        padding: FxSpacing.xy(20, 16),
                                        backgroundColor: contentTheme.primary,
                                        borderRadiusAll:
                                            AppStyle.buttonRadius.medium,
                                        child: FxText.bodySmall(
                                          'left'.tr(),
                                          color: contentTheme.onPrimary,
                                        ),
                                      ),
                                      FxButton(
                                        onPressed: _showTopDialog,
                                        elevation: 0,
                                        padding: FxSpacing.xy(20, 16),
                                        backgroundColor: contentTheme.success,
                                        borderRadiusAll:
                                            AppStyle.buttonRadius.medium,
                                        child: FxText.bodySmall(
                                          'top'.tr(),
                                          color: contentTheme.onSuccess,
                                        ),
                                      ),
                                      FxButton(
                                        onPressed: _showRightDialog,
                                        elevation: 0,
                                        padding: FxSpacing.xy(20, 16),
                                        backgroundColor: contentTheme.warning,
                                        borderRadiusAll:
                                            AppStyle.buttonRadius.medium,
                                        child: FxText.bodySmall(
                                          'right'.tr(),
                                          color: contentTheme.onWarning,
                                        ),
                                      ),
                                      FxButton(
                                        onPressed: _showBottomDialog,
                                        elevation: 0,
                                        padding: FxSpacing.xy(20, 16),
                                        backgroundColor: contentTheme.info,
                                        borderRadiusAll:
                                            AppStyle.buttonRadius.medium,
                                        child: FxText.bodySmall(
                                          'bottom'.tr(),
                                          color: contentTheme.onInfo,
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
                                    'other'.tr(),
                                    fontWeight: 600,
                                    letterSpacing: 0,
                                  ),
                                  FxSpacing.height(16),
                                  Wrap(
                                    spacing: flexSpacing / 2,
                                    runSpacing: flexSpacing / 2,
                                    children: [
                                      FxButton(
                                        onPressed: _showStaticDialog,
                                        elevation: 0,
                                        padding: FxSpacing.xy(20, 16),
                                        backgroundColor: contentTheme.primary,
                                        borderRadiusAll:
                                            AppStyle.buttonRadius.medium,
                                        child: FxText.bodySmall(
                                          'static'.tr(),
                                          color: contentTheme.onPrimary,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
              );
            }));
  }

  void _showAlertDialog() {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: FxText.labelLarge("confirmation?".tr()),
            content: FxText.bodySmall(
                "are_you_sure,_you_want_to_delete_history?".tr()),
            actions: [
              FxButton.rounded(
                onPressed: () {
                  Navigator.pop(context);
                },
                elevation: 0,
                padding: FxSpacing.xy(20, 16),
                backgroundColor: colorScheme.secondaryContainer,
                child: FxText.labelMedium(
                  "close".tr(),
                  color: colorScheme.onSecondaryContainer,
                ),
              ),
              FxButton.rounded(
                onPressed: () {
                  Navigator.pop(context);
                },
                elevation: 0,
                padding: FxSpacing.xy(20, 16),
                backgroundColor: colorScheme.primary,
                child: FxText.labelMedium(
                  "save".tr(),
                  color: colorScheme.onPrimary,
                ),
              ),
            ],
          );
        });
  }

  void _showStandardDialog() {
    showDialog(
        context: context,
        builder: (_) {
          return Dialog(
            child: SizedBox(
              width: 400,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: FxSpacing.all(16),
                    child:
                        FxText.labelLarge('dialog_title'.tr().capitalizeWords),
                  ),
                  Divider(height: 0, thickness: 1),
                  Padding(
                    padding: FxSpacing.all(16),
                    child: FxText.bodySmall(controller.dummyTexts[0]),
                  ),
                  Divider(height: 0, thickness: 1),
                  Padding(
                    padding: FxSpacing.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FxButton.rounded(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          elevation: 0,
                          padding: FxSpacing.xy(20, 16),
                          backgroundColor: colorScheme.secondaryContainer,
                          child: FxText.labelMedium(
                            "close".tr(),
                            color: colorScheme.onSecondaryContainer,
                          ),
                        ),
                        FxSpacing.width(16),
                        FxButton.rounded(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          elevation: 0,
                          padding: FxSpacing.xy(20, 16),
                          backgroundColor: colorScheme.primary,
                          child: FxText.labelMedium(
                            "save".tr(),
                            color: colorScheme.onPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void _showFullWidthDialog() {
    showDialog(
        context: context,
        builder: (_) {
          return Dialog(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: FxSpacing.all(16),
                  child: FxText.labelLarge('dialog_title'.tr().capitalizeWords),
                ),
                Divider(height: 0, thickness: 1),
                Padding(
                  padding: FxSpacing.all(16),
                  child: FxText.bodySmall(controller.dummyTexts[1]),
                ),
                Divider(height: 0, thickness: 1),
                Padding(
                  padding: FxSpacing.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FxButton.rounded(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        elevation: 0,
                        padding: FxSpacing.xy(20, 16),
                        backgroundColor: colorScheme.secondaryContainer,
                        child: FxText.labelMedium(
                          "close".tr(),
                          color: colorScheme.onSecondaryContainer,
                        ),
                      ),
                      FxSpacing.width(16),
                      FxButton.rounded(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        elevation: 0,
                        padding: FxSpacing.xy(20, 16),
                        backgroundColor: colorScheme.primary,
                        child: FxText.labelMedium(
                          "save".tr(),
                          color: colorScheme.onPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  void _showRightDialog() {
    showDialog(
        context: context,
        builder: (_) {
          return Dialog(
            insetPadding: FxSpacing.fromLTRB(
                MediaQuery.of(context).size.width - 350, 0, 0, 0),
            child: SizedBox(
              width: 300,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: FxSpacing.all(16),
                    child:
                        FxText.labelLarge('right_dialog'.tr().capitalizeWords),
                  ),
                  Divider(height: 0, thickness: 1),
                  Padding(
                    padding: FxSpacing.all(16),
                    child: FxText.bodySmall(
                      controller.dummyTexts[2],
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Divider(height: 0, thickness: 1),
                  Padding(
                    padding: FxSpacing.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FxButton.rounded(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          elevation: 0,
                          padding: FxSpacing.xy(20, 16),
                          backgroundColor: colorScheme.secondaryContainer,
                          child: FxText.labelMedium(
                            "close".tr(),
                            color: colorScheme.onSecondaryContainer,
                          ),
                        ),
                        FxSpacing.width(16),
                        FxButton.rounded(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          elevation: 0,
                          padding: FxSpacing.xy(20, 16),
                          backgroundColor: colorScheme.primary,
                          child: FxText.labelMedium(
                            "save".tr(),
                            color: colorScheme.onPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void _showBottomDialog() {
    showDialog(
        context: context,
        builder: (_) {
          return Dialog(
            insetPadding: FxSpacing.fromLTRB(
                0, MediaQuery.of(context).size.height - 350, 0, 0),
            child: SizedBox(
              width: 300,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: FxSpacing.all(16),
                    child:
                        FxText.labelLarge('bottom_dialog'.tr().capitalizeWords),
                  ),
                  Divider(height: 0, thickness: 1),
                  Padding(
                    padding: FxSpacing.all(16),
                    child: FxText.bodySmall(
                      controller.dummyTexts[3],
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Divider(height: 0, thickness: 1),
                  Padding(
                    padding: FxSpacing.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FxButton.rounded(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          elevation: 0,
                          padding: FxSpacing.xy(20, 16),
                          backgroundColor: colorScheme.secondaryContainer,
                          child: FxText.labelMedium(
                            "close".tr(),
                            color: colorScheme.onSecondaryContainer,
                          ),
                        ),
                        FxSpacing.width(16),
                        FxButton.rounded(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          elevation: 0,
                          padding: FxSpacing.xy(20, 16),
                          backgroundColor: colorScheme.primary,
                          child: FxText.labelMedium(
                            "save".tr(),
                            color: colorScheme.onPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void _showTopDialog() {
    showDialog(
        context: context,
        builder: (_) {
          return Dialog(
            insetPadding: FxSpacing.fromLTRB(
                0, 0, 0, MediaQuery.of(context).size.height - 350),
            child: SizedBox(
              width: 300,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: FxSpacing.all(16),
                    child: FxText.labelLarge('top_dialog'.tr().capitalizeWords),
                  ),
                  Divider(height: 0, thickness: 1),
                  Padding(
                    padding: FxSpacing.all(16),
                    child: FxText.bodySmall(
                      controller.dummyTexts[4],
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Divider(height: 0, thickness: 1),
                  Padding(
                    padding: FxSpacing.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FxButton.rounded(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          elevation: 0,
                          padding: FxSpacing.xy(20, 16),
                          backgroundColor: colorScheme.secondaryContainer,
                          child: FxText.labelMedium(
                            "close".tr(),
                            color: colorScheme.onSecondaryContainer,
                          ),
                        ),
                        FxSpacing.width(16),
                        FxButton.rounded(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          elevation: 0,
                          padding: FxSpacing.xy(20, 16),
                          backgroundColor: colorScheme.primary,
                          child: FxText.labelMedium(
                            "save".tr(),
                            color: colorScheme.onPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void _showLeftDialog() {
    showDialog(
        context: context,
        builder: (_) {
          return Dialog(
            insetPadding: FxSpacing.fromLTRB(
                0, 0, MediaQuery.of(context).size.width - 350, 0),
            child: SizedBox(
              width: 300,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: FxSpacing.all(16),
                    child: FxText.labelLarge('left_dialog'.tr()),
                  ),
                  Divider(height: 0, thickness: 1),
                  Padding(
                    padding: FxSpacing.all(16),
                    child: FxText.bodySmall(
                      controller.dummyTexts[5],
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Divider(height: 0, thickness: 1),
                  Padding(
                    padding: FxSpacing.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FxButton.rounded(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          elevation: 0,
                          padding: FxSpacing.xy(20, 16),
                          backgroundColor: colorScheme.secondaryContainer,
                          child: FxText.labelMedium(
                            "close".tr(),
                            color: colorScheme.onSecondaryContainer,
                          ),
                        ),
                        FxSpacing.width(16),
                        FxButton.rounded(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          elevation: 0,
                          padding: FxSpacing.xy(20, 16),
                          backgroundColor: colorScheme.primary,
                          child: FxText.labelMedium(
                            "save".tr(),
                            color: colorScheme.onPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void _showStaticDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return Dialog(
            child: SizedBox(
              width: 400,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: FxSpacing.all(16),
                    child: Row(
                      children: [
                        Expanded(
                            child: FxText.labelLarge(
                                'static_dialog'.tr().capitalizeWords)),
                        InkWell(
                            onTap: () => Navigator.pop(context),
                            child: Icon(
                              Icons.close_outlined,
                              size: 20,
                              color: colorScheme.onBackground.withOpacity(0.5),
                            ))
                      ],
                    ),
                  ),
                  Divider(height: 0, thickness: 1),
                  Padding(
                    padding: FxSpacing.all(16),
                    child: FxText.bodySmall(controller.dummyTexts[0]),
                  ),
                  Divider(height: 0, thickness: 1),
                  Padding(
                    padding: FxSpacing.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FxButton.rounded(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          elevation: 0,
                          padding: FxSpacing.xy(20, 16),
                          backgroundColor: colorScheme.secondaryContainer,
                          child: FxText.labelMedium(
                            "close".tr(),
                            color: colorScheme.onSecondaryContainer,
                          ),
                        ),
                        FxSpacing.width(16),
                        FxButton.rounded(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          elevation: 0,
                          padding: FxSpacing.xy(20, 16),
                          backgroundColor: colorScheme.primary,
                          child: FxText.labelMedium(
                            "save".tr(),
                            color: colorScheme.onPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
