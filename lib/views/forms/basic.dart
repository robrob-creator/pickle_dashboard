import 'package:feather_icons/feather_icons.dart';
import 'package:pickle/app_constant.dart';
import 'package:pickle/controllers/forms/basic_controller.dart';
import 'package:pickle/extensions/date_time_extension.dart';
import 'package:pickle/extensions/string.dart';
import 'package:pickle/services/theme/app_style.dart';
import 'package:pickle/utils/mixins/ui_mixin.dart';
import 'package:pickle/views/layouts/layout.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

class BasicFormsPage extends StatefulWidget {
  const BasicFormsPage({super.key});

  @override
  _BasicFormsPageState createState() => _BasicFormsPageState();
}

class _BasicFormsPageState extends State<BasicFormsPage>
    with SingleTickerProviderStateMixin, UIMixin {
  late BasicFormsController controller;

  @override
  void initState() {
    super.initState();
    controller = FxControllerStore.putOrFind(BasicFormsController());
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: FxBuilder<BasicFormsController>(
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
                        "basic_forms".tr().capitalizeWords,
                        fontSize: 18,
                        fontWeight: 600,
                      ),
                      FxBreadcrumb(
                        children: [
                          FxBreadcrumbItem(name: 'forms'.tr()),
                          FxBreadcrumbItem(name: 'Basic'.tr(), active: true),
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
                            paddingAll: 0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                  color: colorScheme.primary.withOpacity(0.08),
                                  padding: FxSpacing.xy(flexSpacing, 12),
                                  child: Row(
                                    children: [
                                      Icon(
                                        FeatherIcons.toggleRight,
                                        color: colorScheme.primary,
                                        size: 16,
                                      ),
                                      FxSpacing.width(12),
                                      FxText.titleMedium(
                                        "basic_input".tr().capitalizeWords,
                                        fontWeight: 600,
                                        color: colorScheme.primary,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: FxSpacing.all(flexSpacing),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                FxText.labelMedium(
                                                  "first_name"
                                                      .tr()
                                                      .capitalizeWords,
                                                ),
                                                FxSpacing.height(8),
                                                TextFormField(
                                                  decoration: InputDecoration(
                                                      hintText: "First Name",
                                                      hintStyle:
                                                          FxTextStyle.bodySmall(
                                                              xMuted: true),
                                                      border:
                                                          outlineInputBorder,
                                                      enabledBorder:
                                                          outlineInputBorder,
                                                      focusedBorder:
                                                          focusedInputBorder,
                                                      contentPadding:
                                                          FxSpacing.all(16),
                                                      isCollapsed: true,
                                                      floatingLabelBehavior:
                                                          FloatingLabelBehavior
                                                              .never),
                                                ),
                                              ],
                                            ),
                                          ),
                                          FxSpacing.width(16),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                FxText.labelMedium(
                                                  "last_name"
                                                      .tr()
                                                      .capitalizeWords,
                                                ),
                                                FxSpacing.height(8),
                                                TextFormField(
                                                  decoration: InputDecoration(
                                                      hintText: "Last Name",
                                                      hintStyle:
                                                          FxTextStyle.bodySmall(
                                                              xMuted: true),
                                                      border:
                                                          outlineInputBorder,
                                                      enabledBorder:
                                                          outlineInputBorder,
                                                      focusedBorder:
                                                          focusedInputBorder,
                                                      contentPadding:
                                                          FxSpacing.all(16),
                                                      isCollapsed: true,
                                                      floatingLabelBehavior:
                                                          FloatingLabelBehavior
                                                              .never),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      FxSpacing.height(20),
                                      FxText.labelMedium(
                                        "email_address".tr().capitalizeWords,
                                      ),
                                      FxSpacing.height(8),
                                      TextFormField(
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: InputDecoration(
                                            hintText: "demo@getappui.com",
                                            hintStyle: FxTextStyle.bodySmall(
                                                xMuted: true),
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
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        obscureText: !controller.showPassword,
                                        decoration: InputDecoration(
                                            hintText: "Password",
                                            hintStyle: FxTextStyle.bodySmall(
                                                xMuted: true),
                                            border: outlineInputBorder,
                                            enabledBorder: outlineInputBorder,
                                            focusedBorder: focusedInputBorder,
                                            prefixIcon: Icon(
                                              Icons.lock_outline,
                                              size: 20,
                                            ),
                                            suffixIcon: InkWell(
                                              onTap: controller
                                                  .onChangeShowPassword,
                                              child: Icon(
                                                controller.showPassword
                                                    ? Icons.visibility_outlined
                                                    : Icons
                                                        .visibility_off_outlined,
                                                size: 20,
                                              ),
                                            ),
                                            contentPadding: FxSpacing.all(16),
                                            isCollapsed: true,
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.never),
                                      ),
                                      FxSpacing.height(20),
                                      Row(
                                        children: [
                                          FxText.labelLarge("gender".tr()),
                                          FxSpacing.width(16),
                                          Expanded(
                                            child: Wrap(
                                                spacing: 16,
                                                children: Gender.values
                                                    .map(
                                                      (gender) => InkWell(
                                                        onTap: () => controller
                                                            .onChangeGender(
                                                                gender),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Radio<Gender>(
                                                              value: gender,
                                                              activeColor: theme
                                                                  .colorScheme
                                                                  .primary,
                                                              groupValue: controller
                                                                  .selectedGender,
                                                              onChanged: controller
                                                                  .onChangeGender,
                                                              visualDensity:
                                                                  getCompactDensity,
                                                              materialTapTargetSize:
                                                                  MaterialTapTargetSize
                                                                      .shrinkWrap,
                                                            ),
                                                            FxSpacing.width(8),
                                                            FxText.labelMedium(
                                                                gender.name
                                                                    .capitalize)
                                                          ],
                                                        ),
                                                      ),
                                                    )
                                                    .toList()),
                                          )
                                        ],
                                      ),
                                      FxSpacing.height(20),
                                      FxText.labelLarge("other_settings:"
                                          .tr()
                                          .capitalizeWords),
                                      FxSpacing.height(4),
                                      SwitchListTile(
                                          value: controller.publicStatus,
                                          onChanged:
                                              controller.changeAccountStatus,
                                          controlAffinity:
                                              ListTileControlAffinity.leading,
                                          visualDensity: getCompactDensity,
                                          contentPadding: FxSpacing.zero,
                                          title: FxText.bodyMedium(
                                              "set_profile_to_private".tr())),
                                      SwitchListTile(
                                          value: controller.newsletter,
                                          onChanged:
                                              controller.changeNewsletterStatus,
                                          visualDensity: getCompactDensity,
                                          controlAffinity:
                                              ListTileControlAffinity.leading,
                                          contentPadding: FxSpacing.zero,
                                          title: FxText.bodyMedium(
                                              "opt-in_daily_newsletter_at_the_email"
                                                  .tr())),
                                      FxSpacing.height(16),
                                      InkWell(
                                        onTap: () =>
                                            controller.onChangedChecked(
                                                !controller.checked),
                                        child: Row(
                                          children: [
                                            Checkbox(
                                              onChanged:
                                                  controller.onChangedChecked,
                                              value: controller.checked,
                                              activeColor:
                                                  theme.colorScheme.primary,
                                              materialTapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                              visualDensity: getCompactDensity,
                                            ),
                                            FxSpacing.width(16),
                                            RichText(
                                              text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: "i_agree_with".tr(),
                                                    ),
                                                    TextSpan(text: " "),
                                                    TextSpan(
                                                        text:
                                                            "terms_&_conditions"
                                                                .tr(),
                                                        style: FxTextStyle
                                                            .bodyMedium(
                                                                color:
                                                                    contentTheme
                                                                        .success,
                                                                fontWeight:
                                                                    600)),
                                                  ],
                                                  style: FxTextStyle.bodyMedium(
                                                      fontWeight: 600)),
                                            )
                                          ],
                                        ),
                                      ),
                                      FxSpacing.height(8),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: FxButton(
                                          onPressed: () {},
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
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )),
                      FxFlexItem(
                          sizes: "lg-6 md-12",
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FxContainer.bordered(
                                paddingAll: 0,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Container(
                                      color:
                                          colorScheme.primary.withOpacity(0.08),
                                      padding: FxSpacing.xy(flexSpacing, 12),
                                      child: Row(
                                        children: [
                                          Icon(
                                            FeatherIcons.layers,
                                            color: colorScheme.primary,
                                            size: 16,
                                          ),
                                          FxSpacing.width(12),
                                          FxText.titleMedium(
                                            "more_inputs".tr().capitalizeWords,
                                            fontWeight: 600,
                                            color: colorScheme.primary,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: FxSpacing.all(flexSpacing),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          FxText.labelLarge("date_time_pickers"
                                              .tr()
                                              .capitalizeWords),
                                          FxSpacing.height(12),
                                          Wrap(
                                            spacing: 16,
                                            runSpacing: 16,
                                            children: [
                                              FxButton.outlined(
                                                onPressed: () {
                                                  controller.pickDate();
                                                },
                                                borderColor:
                                                    colorScheme.primary,
                                                padding: FxSpacing.xy(16, 16),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    Icon(
                                                      Icons
                                                          .calendar_today_outlined,
                                                      color:
                                                          colorScheme.primary,
                                                      size: 16,
                                                    ),
                                                    FxSpacing.width(10),
                                                    FxText.labelMedium(
                                                        controller.selectedDate !=
                                                                null
                                                            ? dateFormatter
                                                                .format(controller
                                                                    .selectedDate!)
                                                            : "select_date"
                                                                .tr()
                                                                .capitalizeWords,
                                                        fontWeight: 600,
                                                        color: colorScheme
                                                            .primary),
                                                  ],
                                                ),
                                              ),
                                              FxButton.outlined(
                                                onPressed: () {
                                                  controller.pickTime();
                                                },
                                                borderColor:
                                                    colorScheme.primary,
                                                padding: FxSpacing.xy(16, 16),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    Icon(
                                                      Icons
                                                          .watch_later_outlined,
                                                      color:
                                                          colorScheme.primary,
                                                      size: 16,
                                                    ),
                                                    FxSpacing.width(10),
                                                    FxText.labelMedium(
                                                        controller.selectedTime !=
                                                                null
                                                            ? timeFormatter
                                                                .format(DateTime
                                                                        .now()
                                                                    .applied(
                                                                        controller
                                                                            .selectedTime!))
                                                            : "select_time"
                                                                .tr()
                                                                .capitalizeWords,
                                                        fontWeight: 600,
                                                        color: colorScheme
                                                            .primary),
                                                  ],
                                                ),
                                              ),
                                              FxButton.outlined(
                                                onPressed: () {
                                                  controller.pickDateRange();
                                                },
                                                borderColor:
                                                    colorScheme.primary,
                                                padding: FxSpacing.xy(16, 16),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    Icon(
                                                      Icons
                                                          .calendar_month_outlined,
                                                      color:
                                                          colorScheme.primary,
                                                      size: 16,
                                                    ),
                                                    FxSpacing.width(10),
                                                    FxText.labelMedium(
                                                        controller.selectedDateTimeRange !=
                                                                null
                                                            ? "${dateFormatter.format(controller.selectedDateTimeRange!.start)} - ${dateFormatter.format(controller.selectedDateTimeRange!.end)}"
                                                            : "select_range"
                                                                .tr()
                                                                .capitalizeWords,
                                                        fontWeight: 600,
                                                        color: colorScheme
                                                            .primary),
                                                  ],
                                                ),
                                              ),
                                              FxButton.outlined(
                                                onPressed: () {
                                                  controller.pickDateTime();
                                                },
                                                borderColor:
                                                    colorScheme.primary,
                                                padding: FxSpacing.xy(16, 16),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    Icon(
                                                      Icons
                                                          .event_available_outlined,
                                                      color:
                                                          colorScheme.primary,
                                                      size: 16,
                                                    ),
                                                    FxSpacing.width(10),
                                                    FxText.labelMedium(
                                                        controller.selectedDateTime !=
                                                                null
                                                            ? "${dateFormatter.format(controller.selectedDateTime!)} ${timeFormatter.format(controller.selectedDateTime!)}"
                                                            : "select_date_&_time"
                                                                .tr()
                                                                .capitalizeWords,
                                                        fontWeight: 600,
                                                        color: colorScheme
                                                            .primary),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          FxSpacing.height(20),
                                          FxText.labelLarge("sliders".tr()),
                                          FxSpacing.height(8),
                                          Slider(
                                            value: controller.slider1,
                                            onChanged:
                                                controller.onChangeSlider1,
                                            min: 0,
                                            max: 50,
                                          ),
                                          Slider(
                                            value: controller.slider2,
                                            min: 0,
                                            max: 50,
                                            divisions: 50,
                                            label: controller.slider2
                                                .floor()
                                                .toString(),
                                            onChanged:
                                                controller.onChangeSlider2,
                                          ),
                                          RangeSlider(
                                            values: controller.rangeSlider,
                                            min: 0,
                                            max: 50,
                                            divisions: 50,
                                            labels: RangeLabels(
                                                controller.rangeSlider.start
                                                    .floor()
                                                    .toString(),
                                                controller.rangeSlider.end
                                                    .floor()
                                                    .toString()),
                                            onChanged:
                                                controller.onChangeRangeSlider,
                                            activeColor: theme
                                                .sliderTheme.activeTrackColor,
                                            inactiveColor: theme
                                                .sliderTheme.inactiveTrackColor,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              FxSpacing.height(16),
                              FxContainer.bordered(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                paddingAll: 0,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Container(
                                      color:
                                          colorScheme.primary.withOpacity(0.08),
                                      padding: FxSpacing.xy(flexSpacing, 12),
                                      child: Row(
                                        children: [
                                          Icon(
                                            FeatherIcons.settings,
                                            color: colorScheme.primary,
                                            size: 16,
                                          ),
                                          FxSpacing.width(12),
                                          FxText.titleMedium(
                                            "builder".tr(),
                                            fontWeight: 600,
                                            color: colorScheme.primary,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: FxSpacing.all(flexSpacing),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              SizedBox(
                                                  width: 180,
                                                  child: FxText.labelLarge(
                                                      "floating_label_type"
                                                          .tr()
                                                          .capitalizeWords)),
                                              PopupMenuButton(
                                                  onSelected: controller
                                                      .onChangeLabelType,
                                                  itemBuilder:
                                                      (BuildContext context) {
                                                    return FloatingLabelBehavior
                                                        .values
                                                        .map((behavior) {
                                                      return PopupMenuItem(
                                                        value: behavior,
                                                        height: 32,
                                                        child: FxText.bodySmall(
                                                          behavior
                                                              .name.capitalize,
                                                          color: theme
                                                              .colorScheme
                                                              .onBackground,
                                                          fontWeight: 600,
                                                        ),
                                                      );
                                                    }).toList();
                                                  },
                                                  color: theme.cardTheme.color,
                                                  child: FxContainer.bordered(
                                                    padding:
                                                        FxSpacing.xy(12, 8),
                                                    child: Row(
                                                      children: <Widget>[
                                                        FxText.labelMedium(
                                                          controller
                                                              .floatingLabelBehavior
                                                              .name
                                                              .capitalize,
                                                          color: theme
                                                              .colorScheme
                                                              .onBackground,
                                                        ),
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 4),
                                                          child: Icon(
                                                            Icons
                                                                .expand_more_outlined,
                                                            size: 22,
                                                            color: theme
                                                                .colorScheme
                                                                .onBackground,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  )),
                                            ],
                                          ),
                                          FxSpacing.height(8),
                                          Row(
                                            children: [
                                              SizedBox(
                                                  width: 180,
                                                  child: FxText.labelLarge(
                                                      "border_type"
                                                          .tr()
                                                          .capitalizeWords)),
                                              PopupMenuButton(
                                                  onSelected: controller
                                                      .onChangeBorderType,
                                                  itemBuilder:
                                                      (BuildContext context) {
                                                    return TextFieldBorderType
                                                        .values
                                                        .map((borderType) {
                                                      return PopupMenuItem(
                                                        value: borderType,
                                                        height: 32,
                                                        child: FxText.bodySmall(
                                                          borderType
                                                              .name.capitalize,
                                                          color: theme
                                                              .colorScheme
                                                              .onBackground,
                                                          fontWeight: 600,
                                                        ),
                                                      );
                                                    }).toList();
                                                  },
                                                  color: theme.cardTheme.color,
                                                  child: FxContainer.bordered(
                                                    padding:
                                                        FxSpacing.xy(12, 8),
                                                    child: Row(
                                                      children: <Widget>[
                                                        FxText.labelMedium(
                                                          controller.borderType
                                                              .name.capitalize,
                                                          color: theme
                                                              .colorScheme
                                                              .onBackground,
                                                        ),
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 4),
                                                          child: Icon(
                                                            Icons
                                                                .expand_more_outlined,
                                                            size: 22,
                                                            color: theme
                                                                .colorScheme
                                                                .onBackground,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  )),
                                            ],
                                          ),
                                          FxSpacing.height(12),
                                          Row(
                                            children: [
                                              SizedBox(
                                                  width: 180,
                                                  child: FxText.labelLarge(
                                                      "filled".tr())),
                                              Switch(
                                                onChanged: controller
                                                    .onChangedFilledChecked,
                                                value: controller.filled,
                                                activeColor:
                                                    theme.colorScheme.primary,
                                                materialTapTargetSize:
                                                    MaterialTapTargetSize
                                                        .shrinkWrap,
                                                // visualDensity: getCompactDensity,
                                              ),
                                            ],
                                          ),
                                          FxSpacing.height(20),
                                          FxText.labelLarge("output".tr()),
                                          FxSpacing.height(20),
                                          TextFormField(
                                            decoration: InputDecoration(
                                                labelText: "Sample Text Field",
                                                border: controller.inputBorder,
                                                focusedBorder:
                                                    controller.inputBorder,
                                                filled: controller.filled,
                                                enabledBorder:
                                                    controller.inputBorder,
                                                floatingLabelBehavior:
                                                    controller
                                                        .floatingLabelBehavior),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )),
                      // FxFlexItem(
                      //     sizes: "lg-6 md-12",
                      //     child: Column(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      //         FxContainer.bordered(
                      //           clipBehavior: Clip.antiAliasWithSaveLayer,
                      //           paddingAll: 0,
                      //           child: Column(
                      //             crossAxisAlignment: CrossAxisAlignment.stretch,
                      //             children: [
                      //               Container(
                      //                 color: colorScheme.primary.withOpacity(0.08),
                      //                 padding: FxSpacing.xy(flexSpacing, 12),
                      //                 child: FxText.titleMedium(
                      //                   "Boxed",
                      //                   fontWeight: 600,
                      //                   color: colorScheme.primary,
                      //                 ),
                      //               ),
                      //               Padding(
                      //                 padding: FxSpacing.all(flexSpacing),
                      //                 child: Column(
                      //                   children: [
                      //                     TextFormField(
                      //                       decoration: InputDecoration(
                      //                           labelText: "Always Floating",
                      //                           border: outlineInputBorder,
                      //                           floatingLabelBehavior: FloatingLabelBehavior.always),
                      //                     ),
                      //                     FxSpacing.height(16),
                      //                     TextFormField(
                      //                       decoration: InputDecoration(
                      //                           labelText: "Auto Floating",
                      //                           border: outlineInputBorder,
                      //                           floatingLabelBehavior: FloatingLabelBehavior.auto),
                      //                     ),
                      //                     FxSpacing.height(16),
                      //                     TextFormField(
                      //                       decoration: InputDecoration(
                      //                           labelText: "Non Floating",
                      //                           border: outlineInputBorder,
                      //                           floatingLabelBehavior: FloatingLabelBehavior.never),
                      //                     ),
                      //                   ],
                      //                 ),
                      //               )
                      //             ],
                      //           ),
                      //         ),
                      //         FxSpacing.height(24),
                      //         FxContainer.bordered(
                      //           clipBehavior: Clip.antiAliasWithSaveLayer,
                      //           paddingAll: 0,
                      //           child: Column(
                      //             crossAxisAlignment: CrossAxisAlignment.stretch,
                      //             children: [
                      //               Container(
                      //                 color: colorScheme.primary.withOpacity(0.08),
                      //                 padding: FxSpacing.xy(flexSpacing, 12),
                      //                 child: FxText.titleMedium(
                      //                   "Outline",
                      //                   fontWeight: 600,
                      //                   color: colorScheme.primary,
                      //                 ),
                      //               ),
                      //               Padding(
                      //                 padding: FxSpacing.all(flexSpacing),
                      //                 child: Column(
                      //                   children: [
                      //                     TextFormField(
                      //                       decoration: InputDecoration(
                      //                           labelText: "Always Floating",
                      //                           floatingLabelBehavior: FloatingLabelBehavior.always),
                      //                     ),
                      //                     FxSpacing.height(16),
                      //                     TextFormField(
                      //                       decoration: InputDecoration(
                      //                           labelText: "Auto Floating",
                      //                           floatingLabelBehavior: FloatingLabelBehavior.auto),
                      //                     ),
                      //                     FxSpacing.height(16),
                      //                     TextFormField(
                      //                       decoration: InputDecoration(
                      //                           labelText: "Never Floating",
                      //                           floatingLabelBehavior: FloatingLabelBehavior.never),
                      //                     ),
                      //                   ],
                      //                 ),
                      //               )
                      //             ],
                      //           ),
                      //         ),
                      //         FxSpacing.height(24),
                      //         FxContainer.bordered(
                      //           clipBehavior: Clip.antiAliasWithSaveLayer,
                      //           paddingAll: 0,
                      //           child: Column(
                      //             crossAxisAlignment: CrossAxisAlignment.stretch,
                      //             children: [
                      //               Container(
                      //                 color: colorScheme.primary.withOpacity(0.08),
                      //                 padding: FxSpacing.xy(flexSpacing, 12),
                      //                 child: FxText.titleMedium(
                      //                   "Filled Border ",
                      //                   fontWeight: 600,
                      //                   color: colorScheme.primary,
                      //                 ),
                      //               ),
                      //               Padding(
                      //                 padding: FxSpacing.all(flexSpacing),
                      //                 child: Column(
                      //                   children: [
                      //                     TextFormField(
                      //                       decoration: InputDecoration(
                      //                           labelText: "Always Floating",
                      //                           filled: true,
                      //                           floatingLabelBehavior: FloatingLabelBehavior.always),
                      //                     ),
                      //                     FxSpacing.height(20),
                      //                     TextFormField(
                      //                       decoration: InputDecoration(
                      //                           labelText: "Auto Floating",
                      //                           filled: true,
                      //                           floatingLabelBehavior: FloatingLabelBehavior.auto),
                      //                     ),
                      //                     FxSpacing.height(20),
                      //                     TextFormField(
                      //                       decoration: InputDecoration(
                      //                           labelText: "Never Floating",
                      //                           filled: true,
                      //                           floatingLabelBehavior: FloatingLabelBehavior.never),
                      //                     ),
                      //                   ],
                      //                 ),
                      //               )
                      //             ],
                      //           ),
                      //         ),
                      //         FxSpacing.height(24),
                      //         FxContainer.bordered(
                      //           clipBehavior: Clip.antiAliasWithSaveLayer,
                      //           paddingAll: 0,
                      //           child: Column(
                      //             crossAxisAlignment: CrossAxisAlignment.stretch,
                      //             children: [
                      //               Container(
                      //                 color: colorScheme.primary.withOpacity(0.08),
                      //                 padding: FxSpacing.xy(flexSpacing, 12),
                      //                 child: FxText.titleMedium(
                      //                   "Filled",
                      //                   fontWeight: 600,
                      //                   color: colorScheme.primary,
                      //                 ),
                      //               ),
                      //               Padding(
                      //                 padding: FxSpacing.all(flexSpacing),
                      //                 child: Column(
                      //                   children: [
                      //                     TextFormField(
                      //                       decoration: InputDecoration(
                      //                           labelText: "Always Floating",
                      //                           filled: true,
                      //                           border: generateOutlineInputBorder(),
                      //                           enabledBorder: generateOutlineInputBorder(),
                      //                           focusedBorder: generateOutlineInputBorder(),
                      //                           floatingLabelBehavior: FloatingLabelBehavior.always),
                      //                     ),
                      //                     FxSpacing.height(20),
                      //                     TextFormField(
                      //                       decoration: InputDecoration(
                      //                           labelText: "Auto Floating",
                      //                           filled: true,
                      //                           border: generateOutlineInputBorder(),
                      //                           enabledBorder: generateOutlineInputBorder(),
                      //                           focusedBorder: generateOutlineInputBorder(),
                      //                           floatingLabelBehavior: FloatingLabelBehavior.auto),
                      //                     ),
                      //                     FxSpacing.height(20),
                      //                     TextFormField(
                      //                       decoration: InputDecoration(
                      //                           labelText: "Never Floating",
                      //                           filled: true,
                      //                           border: generateOutlineInputBorder(),
                      //                           enabledBorder: generateOutlineInputBorder(),
                      //                           focusedBorder: generateOutlineInputBorder(),
                      //                           floatingLabelBehavior: FloatingLabelBehavior.never),
                      //                     ),
                      //                   ],
                      //                 ),
                      //               )
                      //             ],
                      //           ),
                      //         ),
                      //       ],
                      //     )),
                    ],
                  ),
                ),
                FxSpacing.height(24)
              ],
            );
          }),
    );
  }
}
