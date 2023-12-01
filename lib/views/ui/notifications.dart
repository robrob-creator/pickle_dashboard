import 'package:pickle/controllers/ui/notifications_controller.dart';
import 'package:pickle/extensions/string.dart';
import 'package:pickle/services/theme/admin_theme.dart';
import 'package:pickle/services/theme/app_style.dart';
import 'package:pickle/utils/mixins/ui_mixin.dart';
import 'package:pickle/views/layouts/layout.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage>
    with SingleTickerProviderStateMixin, UIMixin {
  late NotificationsController controller;

  @override
  void initState() {
    super.initState();
    controller = NotificationsController(this);
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
        child: FxBuilder<NotificationsController>(
            controller: controller,
            builder: (controller) {
              return Column(
                children: [
                  Padding(
                    padding: FxSpacing.x(flexSpacing),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FxText.titleMedium(
                          "notifications".tr(),
                          fontSize: 18,
                          fontWeight: 600,
                        ),
                        FxBreadcrumb(
                          children: [
                            FxBreadcrumbItem(name: 'ui'.tr().toUpperCase()),
                            FxBreadcrumbItem(
                                name: 'notifications'.tr(), active: true),
                          ],
                        ),
                      ],
                    ),
                  ),
                  FxSpacing.height(flexSpacing),
                  Padding(
                    padding: FxSpacing.x(flexSpacing / 2),
                    child: FxFlex(
                      children: [
                        FxFlexItem(
                            sizes: "lg-8 md-12",
                            child: FxContainer.bordered(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              paddingAll: 0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Container(
                                    color:
                                        colorScheme.primary.withOpacity(0.08),
                                    padding: FxSpacing.xy(flexSpacing, 12),
                                    child: FxText.titleMedium(
                                      "${controller.showBanner ? "${"banner".tr()}" : "${"toast".tr()}"} Customizer",
                                      fontWeight: 600,
                                      color: colorScheme.primary,
                                    ),
                                  ),
                                  Padding(
                                      padding: FxSpacing.xy(flexSpacing, 16),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          FxText.labelLarge(
                                            "type".tr(),
                                          ),
                                          FxSpacing.height(8),
                                          Wrap(
                                            spacing: 16,
                                            runSpacing: 4,
                                            children: [
                                              InkWell(
                                                onTap: () => controller
                                                    .setBannerType(false),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Radio<bool>(
                                                      value: false,
                                                      activeColor:
                                                          contentTheme.primary,
                                                      groupValue:
                                                          controller.showBanner,
                                                      onChanged: (_) =>
                                                          controller
                                                              .setBannerType(
                                                                  false),
                                                      visualDensity:
                                                          getCompactDensity,
                                                      materialTapTargetSize:
                                                          MaterialTapTargetSize
                                                              .shrinkWrap,
                                                    ),
                                                    FxSpacing.width(8),
                                                    FxText.labelMedium(
                                                        "toast".tr())
                                                  ],
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () => controller
                                                    .setBannerType(true),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Radio<bool>(
                                                      value: true,
                                                      activeColor:
                                                          contentTheme.primary,
                                                      groupValue:
                                                          controller.showBanner,
                                                      onChanged: (_) =>
                                                          controller
                                                              .setBannerType(
                                                                  true),
                                                      visualDensity:
                                                          getCompactDensity,
                                                      materialTapTargetSize:
                                                          MaterialTapTargetSize
                                                              .shrinkWrap,
                                                    ),
                                                    FxSpacing.width(8),
                                                    FxText.labelMedium(
                                                        "banner".tr())
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          FxSpacing.height(20),
                                          FxText.labelLarge(
                                            "title_text".tr().capitalizeWords,
                                          ),
                                          FxSpacing.height(8),
                                          TextFormField(
                                            controller:
                                                controller.toastTitleController,
                                            decoration: InputDecoration(
                                                labelText: "toast_text"
                                                    .tr()
                                                    .capitalizeWords,

                                                // border: outlineInputBorder,
                                                // enabledBorder: outlineInputBorder,

                                                contentPadding:
                                                    FxSpacing.all(16),
                                                isCollapsed: true,
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior
                                                        .never),
                                          ),
                                          FxSpacing.height(20),
                                          FxText.labelLarge(
                                            "color_variant"
                                                .tr()
                                                .capitalizeWords,
                                          ),
                                          FxSpacing.height(8),
                                          Wrap(
                                              spacing: 16,
                                              runSpacing: 4,
                                              children: ContentThemeColor.values
                                                  .map(
                                                    (color) => InkWell(
                                                      onTap: () => controller
                                                          .onChangeColor(color),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Radio<
                                                              ContentThemeColor>(
                                                            value: color,
                                                            activeColor:
                                                                controller
                                                                    .selectedColor
                                                                    .color,
                                                            groupValue: controller
                                                                .selectedColor,
                                                            onChanged: controller
                                                                .onChangeColor,
                                                            visualDensity:
                                                                getCompactDensity,
                                                            materialTapTargetSize:
                                                                MaterialTapTargetSize
                                                                    .shrinkWrap,
                                                          ),
                                                          FxSpacing.width(8),
                                                          FxText.labelMedium(
                                                              color.name
                                                                  .capitalize)
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                  .toList()),
                                          FxSpacing.height(20),
                                          if (!controller.showBanner) ...[
                                            FxText.labelLarge(
                                              "floating_type"
                                                  .tr()
                                                  .capitalizeWords,
                                            ),
                                            FxSpacing.height(8),
                                            Wrap(
                                                spacing: 16,
                                                children: SnackBarBehavior
                                                    .values
                                                    .map(
                                                      (behavior) => InkWell(
                                                        onTap: () => controller
                                                            .onChangeBehavior(
                                                                behavior),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Radio<
                                                                SnackBarBehavior>(
                                                              value: behavior,
                                                              activeColor: theme
                                                                  .colorScheme
                                                                  .primary,
                                                              groupValue: controller
                                                                  .selectedBehavior,
                                                              onChanged: controller
                                                                  .onChangeBehavior,
                                                              visualDensity:
                                                                  getCompactDensity,
                                                              materialTapTargetSize:
                                                                  MaterialTapTargetSize
                                                                      .shrinkWrap,
                                                            ),
                                                            FxSpacing.width(8),
                                                            FxText.labelMedium(
                                                                behavior.name
                                                                    .capitalize)
                                                          ],
                                                        ),
                                                      ),
                                                    )
                                                    .toList()),
                                            FxSpacing.height(20),
                                          ],
                                          FxText.labelLarge(
                                            "actions".tr(),
                                          ),
                                          FxSpacing.height(8),
                                          CheckboxListTile(
                                              value: controller.showCloseIcon,
                                              onChanged: controller
                                                  .onChangeShowCloseIcon,
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .leading,
                                              visualDensity: getCompactDensity,
                                              contentPadding: FxSpacing.zero,
                                              dense: true,
                                              title: FxText.bodyMedium(
                                                  "show_close_icon"
                                                      .tr()
                                                      .capitalizeWords)),
                                          if (!controller.showBanner)
                                            CheckboxListTile(
                                                value: controller.showOkAction,
                                                onChanged: controller
                                                    .onChangeShowOkAction,
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .leading,
                                                visualDensity:
                                                    getCompactDensity,
                                                contentPadding: FxSpacing.zero,
                                                dense: true,
                                                title: FxText.bodyMedium(
                                                    "show_ok_action"
                                                        .tr()
                                                        .capitalizeWords)),
                                          if (controller.showBanner)
                                            CheckboxListTile(
                                                value:
                                                    controller.showLeadingIcon,
                                                onChanged: controller
                                                    .onChangeShowLeadingIcon,
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .leading,
                                                visualDensity:
                                                    getCompactDensity,
                                                contentPadding: FxSpacing.zero,
                                                dense: true,
                                                title: FxText.bodyMedium(
                                                    "show_leading_icon"
                                                        .tr()
                                                        .capitalizeWords)),
                                          FxSpacing.height(20),
                                          FxText.labelLarge(
                                            "timeout".tr(),
                                          ),
                                          FxSpacing.height(8),
                                          SwitchListTile(
                                              value: controller.sticky,
                                              onChanged:
                                                  controller.onChangeSticky,
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .leading,
                                              visualDensity: getCompactDensity,
                                              contentPadding: FxSpacing.zero,
                                              dense: true,
                                              title: FxText.bodyMedium(
                                                  "${"infinite".tr()} (∞)")),
                                          FxSpacing.height(20),
                                          Center(
                                            child: FxButton(
                                              onPressed: controller.show,
                                              elevation: 0,
                                              padding: FxSpacing.xy(20, 16),
                                              backgroundColor:
                                                  contentTheme.primary,
                                              borderRadiusAll:
                                                  AppStyle.buttonRadius.medium,
                                              child: FxText.bodySmall(
                                                'show'.tr(),
                                                color: contentTheme.onPrimary,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )),
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
}
