import 'package:pickle/controllers/faqs_controller.dart';
import 'package:pickle/extensions/extensions.dart';
import 'package:pickle/services/theme/app_style.dart';
import 'package:pickle/utils/mixins/ui_mixin.dart';
import 'package:pickle/views/layouts/layout.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

class FAQsPage extends StatefulWidget {
  const FAQsPage({Key? key}) : super(key: key);

  @override
  State<FAQsPage> createState() => _FAQsPageState();
}

class _FAQsPageState extends State<FAQsPage>
    with SingleTickerProviderStateMixin, UIMixin {
  late FAQsController controller;

  @override
  void initState() {
    super.initState();
    controller = FxControllerStore.putOrFind(FAQsController());
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: FxBuilder(
        controller: controller,
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: FxSpacing.x(flexSpacing),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FxText.titleMedium(
                      "faqs".tr(),
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    FxBreadcrumb(
                      children: [
                        FxBreadcrumbItem(
                            name: 'extra_pages'.tr().capitalizeWords),
                        FxBreadcrumbItem(name: 'faqs'.tr(), active: true),
                      ],
                    ),
                  ],
                ),
              ),
              FxSpacing.height(40),
              Column(
                children: [
                  Icon(
                    Icons.question_answer_outlined,
                    size: 36,
                  ),
                  FxSpacing.height(12),
                  FxText.labelLarge(
                    "frequently_asked_questions".tr().capitalizeWords,
                    fontSize: 20,
                  ),
                  FxSpacing.height(12),
                  SizedBox(
                    width: 400,
                    child: FxText.bodySmall(
                      controller.dummyTexts[7],
                      maxLines: 2,
                    ),
                  ),
                  FxSpacing.height(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FxButton(
                        onPressed: () {},
                        elevation: 0,
                        padding: FxSpacing.xy(20, 16),
                        backgroundColor: contentTheme.success,
                        borderRadiusAll: AppStyle.buttonRadius.medium,
                        child: Row(
                          children: [
                            Icon(
                              Icons.phone_outlined,
                              size: 14,
                              color: contentTheme.onSuccess,
                            ),
                            FxSpacing.width(10),
                            FxText.bodySmall(
                              'contact_us'.tr().capitalizeWords,
                              color: contentTheme.onSuccess,
                            ),
                          ],
                        ),
                      ),
                      FxSpacing.width(16),
                      FxButton(
                        onPressed: () {},
                        elevation: 0,
                        padding: FxSpacing.xy(20, 16),
                        backgroundColor: contentTheme.primary,
                        borderRadiusAll: AppStyle.buttonRadius.medium,
                        child: Row(
                          children: [
                            Icon(
                              Icons.email_outlined,
                              size: 14,
                              color: contentTheme.onPrimary,
                            ),
                            FxSpacing.width(12),
                            FxText.bodySmall(
                              'email_us_your_question'.tr(),
                              color: contentTheme.onSuccess,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  FxSpacing.height(48),
                  Padding(
                    padding: FxSpacing.all(16),
                    child: FxFlex(
                      wrapAlignment: WrapAlignment.center,
                      wrapCrossAlignment: WrapCrossAlignment.center,
                      children: [
                        FxFlexItem(
                            sizes: "lg-5 md-12",
                            child: Column(
                              children: [
                                buildFAQItem("what_is_lorem_ipsum?".tr(),
                                    controller.dummyTexts[1]),
                                FxSpacing.height(28),
                                buildFAQItem("why_use_lorem_ipsum?".tr(),
                                    controller.dummyTexts[1]),
                                FxSpacing.height(28),
                                buildFAQItem("how_many_variations_exist?".tr(),
                                    controller.dummyTexts[1]),
                                FxSpacing.height(28),
                                buildFAQItem("What_is_lorem_ipsum?".tr(),
                                    controller.dummyTexts[1]),
                              ],
                            )),
                        FxFlexItem(
                            sizes: "lg-5 md-12",
                            child: Column(
                              children: [
                                buildFAQItem("is_safe_use_lorem_ipsum?".tr(),
                                    controller.dummyTexts[1]),
                                FxSpacing.height(28),
                                buildFAQItem("when_can_be_used?".tr(),
                                    controller.dummyTexts[1]),
                                FxSpacing.height(28),
                                buildFAQItem(
                                    "license_&_copyright".tr().capitalizeWords,
                                    controller.dummyTexts[1]),
                                FxSpacing.height(28),
                                buildFAQItem("is_safe_use_lorem_ipsum?".tr(),
                                    controller.dummyTexts[1]),
                              ],
                            )),
                      ],
                    ),
                  ),
                ],
              )
            ],
          );
        },
      ),
    );
  }

  Widget buildFAQItem(String title, String description) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FxContainer.rounded(
          height: 30,
          width: 30,
          paddingAll: 0,
          color: contentTheme.primary.withOpacity(0.12),
          child: Center(
            child: FxText(
              'Q',
              color: contentTheme.primary,
              fontWeight: 600,
            ),
          ),
        ),
        FxSpacing.width(16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FxText.labelLarge(
                title,
              ),
              FxSpacing.height(4),
              FxText.bodySmall(
                description,
                maxLines: 2,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
