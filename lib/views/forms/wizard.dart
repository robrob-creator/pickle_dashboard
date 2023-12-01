import 'package:feather_icons/feather_icons.dart';
import 'package:pickle/app_constant.dart';
import 'package:pickle/controllers/forms/wizard_controller.dart';
import 'package:pickle/extensions/extensions.dart';
import 'package:pickle/utils/mixins/ui_mixin.dart';
import 'package:pickle/views/layouts/layout.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

class WizardPage extends StatefulWidget {
  const WizardPage({super.key});

  @override
  _WizardPageState createState() => _WizardPageState();
}

class _WizardPageState extends State<WizardPage>
    with SingleTickerProviderStateMixin, UIMixin {
  late WizardController controller;
  int currentStep = 0;

  @override
  void initState() {
    super.initState();
    controller = FxControllerStore.putOrFind(WizardController());
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: FxBuilder<WizardController>(
          controller: controller,
          builder: (controller) {
            return Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: FxSpacing.x(flexSpacing),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FxText.titleMedium(
                        "wizard".tr(),
                        fontSize: 18,
                        fontWeight: 600,
                      ),
                      FxBreadcrumb(
                        children: [
                          FxBreadcrumbItem(name: 'forms'.tr()),
                          FxBreadcrumbItem(name: 'wizard'.tr(), active: true),
                        ],
                      ),
                    ],
                  ),
                ),
                FxSpacing.height(flexSpacing),
                Center(
                  child: GestureDetector(
                    onTap: () => {
                      controller
                          .onChangedValidation(!controller.enableValidation)
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Checkbox(
                          onChanged: controller.onChangedValidation,
                          value: controller.enableValidation,
                          activeColor: theme.colorScheme.primary,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          visualDensity: getCompactDensity,
                        ),
                        FxSpacing.width(16),
                        FxText.labelMedium(
                            "enable_validation".tr().capitalizeWords)
                      ],
                    ),
                  ),
                ),
                FxSpacing.height(flexSpacing),
                Padding(
                  padding: FxSpacing.x(flexSpacing / 2),
                  child: FxFlex(
                    children: [
                      FxFlexItem(
                          sizes: "lg-6 md-12",
                          child: FxContainer.bordered(
                            clipBehavior: Clip.none,
                            paddingAll: flexSpacing,
                            child: Column(
                              children: [
                                Row(
                                  children: getTabs(),
                                ),
                                FxSpacing.height(32),
                                SizedBox(
                                  height: 376,
                                  child: PageView(
                                    pageSnapping: true,
                                    controller: controller.pageController,
                                    onPageChanged: controller.onChangePage,
                                    children: getContents(),
                                  ),
                                ),
                              ],
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

  List<Widget> getContents() {
    step1() {
      return Form(
        key: controller.step1Validator.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FxText.labelMedium(
              "username".tr(),
            ),
            FxSpacing.height(8),
            TextFormField(
              validator: controller.step1Validator.getValidation('username'),
              controller: controller.step1Validator.getController('username'),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: "username".tr(),
                  hintStyle: FxTextStyle.bodySmall(xMuted: true),
                  border: outlineInputBorder,
                  enabledBorder: outlineInputBorder,
                  focusedBorder: focusedInputBorder,
                  prefixIcon: Icon(
                    FeatherIcons.user,
                    size: 16,
                  ),
                  contentPadding: FxSpacing.all(16),
                  isCollapsed: true,
                  floatingLabelBehavior: FloatingLabelBehavior.never),
            ),
            FxSpacing.height(16),
            FxText.labelMedium(
              "email_address".tr().capitalizeWords,
            ),
            FxSpacing.height(8),
            TextFormField(
              validator: controller.step1Validator.getValidation('email'),
              controller: controller.step1Validator.getController('email'),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: "Email Address",
                  hintStyle: FxTextStyle.bodySmall(xMuted: true),
                  border: outlineInputBorder,
                  enabledBorder: outlineInputBorder,
                  focusedBorder: focusedInputBorder,
                  prefixIcon: Icon(
                    FeatherIcons.mail,
                    size: 16,
                  ),
                  contentPadding: FxSpacing.all(16),
                  isCollapsed: true,
                  floatingLabelBehavior: FloatingLabelBehavior.never),
            ),
            FxSpacing.height(16),
            FxText.labelMedium(
              "password".tr(),
            ),
            FxSpacing.height(8),
            TextFormField(
              validator: controller.step1Validator.getValidation('password'),
              controller: controller.step1Validator.getController('password'),
              keyboardType: TextInputType.visiblePassword,
              obscureText: !controller.showPassword,
              decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: FxTextStyle.bodySmall(xMuted: true),
                  border: outlineInputBorder,
                  enabledBorder: outlineInputBorder,
                  focusedBorder: focusedInputBorder,
                  prefixIcon: Icon(
                    FeatherIcons.lock,
                    size: 16,
                  ),
                  suffixIcon: InkWell(
                    onTap: controller.onChangeShowPassword,
                    child: Icon(
                      controller.showPassword
                          ? FeatherIcons.eye
                          : FeatherIcons.eyeOff,
                      size: 18,
                    ),
                  ),
                  contentPadding: FxSpacing.all(16),
                  isCollapsed: true,
                  floatingLabelBehavior: FloatingLabelBehavior.never),
            ),
            FxSpacing.height(28),
            Align(
              alignment: Alignment.centerRight,
              child: FxButton.rounded(
                onPressed: () {
                  controller.onNext();
                },
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
                      'next'.tr(),
                      color: contentTheme.onPrimary,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    step2() {
      return Form(
        key: controller.step2Validator.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                        validator: controller.step2Validator
                            .getValidation('first_name'),
                        controller: controller.step2Validator
                            .getController('first_name'),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: "First Name",
                          labelStyle: FxTextStyle.bodySmall(xMuted: true),
                          border: outlineInputBorder,
                          enabledBorder: outlineInputBorder,
                          focusedBorder: focusedInputBorder,
                          prefixIcon: Icon(
                            Icons.person_outline,
                            size: 20,
                          ),
                          contentPadding: FxSpacing.all(16),
                          isCollapsed: true,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
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
                        validator: controller.step2Validator
                            .getValidation('last_name'),
                        controller: controller.step2Validator
                            .getController('last_name'),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: "Last Name",
                          labelStyle: FxTextStyle.bodySmall(xMuted: true),
                          border: outlineInputBorder,
                          enabledBorder: outlineInputBorder,
                          focusedBorder: focusedInputBorder,
                          prefixIcon: Icon(
                            Icons.person_outline,
                            size: 20,
                          ),
                          contentPadding: FxSpacing.all(16),
                          isCollapsed: true,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            FxSpacing.height(20),
            FxText.labelMedium(
              "phone_number".tr().capitalizeWords,
            ),
            FxSpacing.height(4),
            TextFormField(
              validator:
                  controller.step2Validator.getValidation('phone_number'),
              controller:
                  controller.step2Validator.getController('phone_number'),
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: "Phone Number",
                labelStyle: FxTextStyle.bodySmall(xMuted: true),
                border: outlineInputBorder,
                enabledBorder: outlineInputBorder,
                focusedBorder: focusedInputBorder,
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
              "date_of_birth".tr(),
            ),
            FxSpacing.height(4),
            FxButton.outlined(
              onPressed: () {
                controller.pickDateTime();
              },
              borderColor: colorScheme.primary,
              padding: FxSpacing.xy(16, 16),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    Icons.event_available_outlined,
                    color: colorScheme.primary,
                    size: 16,
                  ),
                  FxSpacing.width(10),
                  FxText.labelMedium(
                      controller.selectedDateTime != null
                          ? "${dateFormatter.format(controller.selectedDateTime!)} ${timeFormatter.format(controller.selectedDateTime!)}"
                          : "select_date_&_time".tr().capitalizeWords,
                      fontWeight: 600,
                      color: colorScheme.primary),
                ],
              ),
            ),
            FxSpacing.height(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FxButton.text(
                  onPressed: () {
                    controller.onPrev();
                  },
                  elevation: 0,
                  padding: FxSpacing.xy(16, 12),
                  splashColor: contentTheme.secondary.withAlpha(40),
                  child: FxText.bodySmall(
                    'prev'.tr(),
                    color: contentTheme.secondary,
                  ),
                ),
                FxSpacing.width(8),
                FxButton.rounded(
                  onPressed: () {
                    controller.onNext();
                  },
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
                        'next'.tr(),
                        color: contentTheme.onPrimary,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    step3() {
      return Column(
        children: [
          Icon(
            Icons.check_circle_outline_rounded,
            size: 44,
            color: contentTheme.primary,
          ),
          FxSpacing.height(32),
          FxText("your_registration_process_is_finished".tr()),
          FxSpacing.height(32),
          Row(
            children: [
              Checkbox(
                onChanged: controller.onChangedChecked,
                value: controller.checked,
                activeColor: theme.colorScheme.primary,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: getCompactDensity,
              ),
              FxSpacing.width(16),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: "i_agree_with ".tr(),
                  ),
                  TextSpan(
                      text: "terms_&_conditions".tr(),
                      style: FxTextStyle.bodyMedium(
                          color: contentTheme.success, fontWeight: 600)),
                ], style: FxTextStyle.bodyMedium(fontWeight: 600)),
              )
            ],
          ),
          FxSpacing.height(32),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FxButton.text(
                onPressed: () {
                  controller.onPrev();
                },
                elevation: 0,
                padding: FxSpacing.xy(16, 12),
                splashColor: contentTheme.secondary.withAlpha(40),
                child: FxText.bodySmall(
                  'prev'.tr(),
                  color: contentTheme.secondary,
                ),
              ),
              FxSpacing.width(8),
              FxButton.rounded(
                onPressed: () {
                  controller.onFinish();
                },
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
                      'finish'.tr(),
                      color: contentTheme.onPrimary,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      );
    }

    return [step1(), step2(), step3()];
  }

  List<Widget> getTabs() {
    return [
      Expanded(
          child: FxContainer(
        padding: FxSpacing.y(12),
        onTap: () => controller.changePage(0),
        color: controller.selectedTab == 0
            ? contentTheme.primary.withAlpha(40)
            : null,
        child: FxText.labelMedium("account".tr(),
            textAlign: TextAlign.center,
            fontWeight: controller.selectedTab == 0 ? 700 : 600,
            color: controller.selectedTab == 0 ? contentTheme.primary : null),
      )),
      FxSpacing.width(20),
      Expanded(
          child: FxContainer(
        padding: FxSpacing.y(12),
        onTap: () => controller.changePage(1),
        color: controller.selectedTab == 1
            ? contentTheme.primary.withAlpha(40)
            : null,
        child: FxText.labelMedium("profile".tr(),
            textAlign: TextAlign.center,
            fontWeight: controller.selectedTab == 1 ? 700 : 600,
            color: controller.selectedTab == 1 ? contentTheme.primary : null),
      )),
      FxSpacing.width(20),
      Expanded(
          child: FxContainer(
        padding: FxSpacing.y(12),
        onTap: () => controller.changePage(2),
        color: controller.selectedTab == 2
            ? contentTheme.primary.withAlpha(40)
            : null,
        child: FxText.labelMedium("complete".tr(),
            textAlign: TextAlign.center,
            fontWeight: controller.selectedTab == 2 ? 700 : 600,
            color: controller.selectedTab == 2 ? contentTheme.primary : null),
      )),
    ];
  }
}
