import 'package:pickle/controllers/ui/tabs_controller.dart';
import 'package:pickle/extensions/extensions.dart';
import 'package:pickle/utils/mixins/ui_mixin.dart';
import 'package:pickle/views/layouts/layout.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({super.key});

  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage>
    with TickerProviderStateMixin, UIMixin {
  late TabsController controller;

  @override
  void initState() {
    super.initState();
    controller = FxControllerStore.putOrFind(TabsController(this));
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<TabsController>(
        controller: controller,
        builder: (controller) {
          return Layout(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Padding(
                  padding: FxSpacing.x(flexSpacing),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FxText.titleMedium(
                        "tabs".tr(),
                        fontSize: 18,
                        fontWeight: 600,
                      ),
                      FxBreadcrumb(
                        children: [
                          FxBreadcrumbItem(name: 'ui'.tr().toUpperCase()),
                          FxBreadcrumbItem(name: 'tabs'.tr(), active: true),
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
                                    "default_tabs".tr().capitalizeWords,
                                    fontWeight: 600,
                                  ),
                                  FxSpacing.height(28),
                                  TabBar(
                                    controller: controller.defaultTabController,
                                    isScrollable: true,
                                    tabs: [
                                      Tab(
                                        icon: FxText.bodyMedium(
                                          "home".tr(),
                                          fontWeight:
                                              controller.defaultIndex == 0
                                                  ? 600
                                                  : 500,
                                          color: controller.defaultIndex == 0
                                              ? contentTheme.primary
                                              : null,
                                        ),
                                      ),
                                      Tab(
                                        icon: FxText.bodyMedium(
                                          "profile".tr(),
                                          fontWeight:
                                              controller.defaultIndex == 1
                                                  ? 600
                                                  : 500,
                                          color: controller.defaultIndex == 1
                                              ? contentTheme.primary
                                              : null,
                                        ),
                                      ),
                                      Tab(
                                        icon: FxText.bodyMedium(
                                          "messages".tr(),
                                          fontWeight:
                                              controller.defaultIndex == 2
                                                  ? 600
                                                  : 500,
                                          color: controller.defaultIndex == 2
                                              ? contentTheme.primary
                                              : null,
                                        ),
                                      ),
                                    ],
                                    // controller: _tabController,
                                    indicatorSize: TabBarIndicatorSize.tab,
                                  ),
                                  FxSpacing.height(16),
                                  SizedBox(
                                    height: 100,
                                    child: TabBarView(
                                      controller:
                                          controller.defaultTabController,
                                      children: [
                                        FxText.bodySmall(
                                            controller.dummyTexts[0]),
                                        FxText.bodySmall(
                                            controller.dummyTexts[1]),
                                        FxText.bodySmall(
                                            controller.dummyTexts[2]),
                                      ],
                                      // controller: _tabController,
                                    ),
                                  ),
                                ],
                              ))),
                          FxFlexItem(
                              sizes: "lg-6 md-12",
                              child: FxContainer.bordered(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FxText.titleMedium(
                                    "full_width".tr().capitalizeWords,
                                    fontWeight: 600,
                                  ),
                                  FxSpacing.height(28),
                                  TabBar(
                                    controller:
                                        controller.fullWidthTabController,
                                    tabs: [
                                      Tab(
                                        icon: FxText.bodyMedium(
                                          "home".tr(),
                                          fontWeight:
                                              controller.fullWidthIndex == 0
                                                  ? 600
                                                  : 500,
                                          color: controller.fullWidthIndex == 0
                                              ? contentTheme.primary
                                              : null,
                                        ),
                                      ),
                                      Tab(
                                        icon: FxText.bodyMedium(
                                          "profile".tr(),
                                          fontWeight:
                                              controller.fullWidthIndex == 1
                                                  ? 600
                                                  : 500,
                                          color: controller.fullWidthIndex == 1
                                              ? contentTheme.primary
                                              : null,
                                        ),
                                      ),
                                      Tab(
                                        icon: FxText.bodyMedium(
                                          "messages".tr(),
                                          fontWeight:
                                              controller.fullWidthIndex == 2
                                                  ? 600
                                                  : 500,
                                          color: controller.fullWidthIndex == 2
                                              ? contentTheme.primary
                                              : null,
                                        ),
                                      ),
                                    ],
                                    // controller: _tabController,
                                    indicatorSize: TabBarIndicatorSize.tab,
                                  ),
                                  FxSpacing.height(16),
                                  SizedBox(
                                    height: 100,
                                    child: TabBarView(
                                      controller:
                                          controller.fullWidthTabController,
                                      children: [
                                        FxText.bodySmall(
                                            controller.dummyTexts[0]),
                                        FxText.bodySmall(
                                            controller.dummyTexts[1]),
                                        FxText.bodySmall(
                                            controller.dummyTexts[2]),
                                      ],
                                      // controller: _tabController,
                                    ),
                                  ),
                                ],
                              ))),
                          FxFlexItem(
                              sizes: "lg-6 md-12",
                              child: FxContainer.bordered(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FxText.titleMedium(
                                    "background_indicator".tr().capitalizeWords,
                                    fontWeight: 600,
                                  ),
                                  FxSpacing.height(28),
                                  TabBar(
                                    controller:
                                        controller.backgroundTabController,
                                    isScrollable: true,
                                    indicator: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: contentTheme.primary),
                                    tabs: [
                                      Tab(
                                        icon: FxText.bodyMedium(
                                          "home".tr(),
                                          fontWeight:
                                              controller.backgroundIndex == 0
                                                  ? 600
                                                  : 500,
                                          color: controller.backgroundIndex == 0
                                              ? contentTheme.onPrimary
                                              : null,
                                        ),
                                      ),
                                      Tab(
                                        icon: FxText.bodyMedium(
                                          "profile".tr(),
                                          fontWeight:
                                              controller.backgroundIndex == 1
                                                  ? 600
                                                  : 500,
                                          color: controller.backgroundIndex == 1
                                              ? contentTheme.onPrimary
                                              : null,
                                        ),
                                      ),
                                      Tab(
                                        icon: FxText.bodyMedium(
                                          "messages".tr(),
                                          fontWeight:
                                              controller.backgroundIndex == 2
                                                  ? 600
                                                  : 500,
                                          color: controller.backgroundIndex == 2
                                              ? contentTheme.onPrimary
                                              : null,
                                        ),
                                      ),
                                    ],
                                    // controller: _tabController,
                                    indicatorSize: TabBarIndicatorSize.tab,
                                  ),
                                  FxSpacing.height(16),
                                  SizedBox(
                                    height: 100,
                                    child: TabBarView(
                                      controller:
                                          controller.backgroundTabController,
                                      children: [
                                        FxText.bodySmall(
                                            controller.dummyTexts[0]),
                                        FxText.bodySmall(
                                            controller.dummyTexts[1]),
                                        FxText.bodySmall(
                                            controller.dummyTexts[2]),
                                      ],
                                      // controller: _tabController,
                                    ),
                                  ),
                                ],
                              ))),
                          FxFlexItem(
                              sizes: "lg-6 md-12",
                              child: FxContainer.bordered(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FxText.titleMedium(
                                    "bordered_indicator".tr().capitalizeWords,
                                    fontWeight: 600,
                                  ),
                                  FxSpacing.height(28),
                                  TabBar(
                                    controller:
                                        controller.borderedTabController,
                                    isScrollable: true,
                                    indicator: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        border: Border.all(
                                            color: contentTheme.primary,
                                            width: 1.2)),
                                    tabs: [
                                      Tab(
                                        icon: FxText.bodyMedium(
                                          "home".tr(),
                                          fontWeight:
                                              controller.borderedIndex == 0
                                                  ? 600
                                                  : 500,
                                          color: controller.borderedIndex == 0
                                              ? contentTheme.primary
                                              : null,
                                        ),
                                      ),
                                      Tab(
                                        icon: FxText.bodyMedium(
                                          "profile".tr(),
                                          fontWeight:
                                              controller.borderedIndex == 1
                                                  ? 600
                                                  : 500,
                                          color: controller.borderedIndex == 1
                                              ? contentTheme.primary
                                              : null,
                                        ),
                                      ),
                                      Tab(
                                        icon: FxText.bodyMedium(
                                          "messages".tr(),
                                          fontWeight:
                                              controller.borderedIndex == 2
                                                  ? 600
                                                  : 500,
                                          color: controller.borderedIndex == 2
                                              ? contentTheme.primary
                                              : null,
                                        ),
                                      ),
                                    ],
                                    // controller: _tabController,
                                    indicatorSize: TabBarIndicatorSize.tab,
                                  ),
                                  FxSpacing.height(16),
                                  SizedBox(
                                    height: 100,
                                    child: TabBarView(
                                      controller:
                                          controller.borderedTabController,
                                      children: [
                                        FxText.bodySmall(
                                            controller.dummyTexts[0]),
                                        FxText.bodySmall(
                                            controller.dummyTexts[1]),
                                        FxText.bodySmall(
                                            controller.dummyTexts[2]),
                                      ],
                                      // controller: _tabController,
                                    ),
                                  ),
                                ],
                              ))),
                          FxFlexItem(
                              sizes: "lg-6 md-12",
                              child: FxContainer.bordered(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FxText.titleMedium(
                                    "soft_indicator".tr().capitalizeWords,
                                    fontWeight: 600,
                                  ),
                                  FxSpacing.height(28),
                                  TabBar(
                                    controller: controller.softTabController,
                                    isScrollable: true,
                                    indicator: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color:
                                            contentTheme.primary.withAlpha(40)),
                                    tabs: [
                                      Tab(
                                        icon: FxText.bodyMedium(
                                          "home".tr(),
                                          fontWeight: controller.softIndex == 0
                                              ? 600
                                              : 500,
                                          color: controller.softIndex == 0
                                              ? contentTheme.primary
                                              : null,
                                        ),
                                      ),
                                      Tab(
                                        icon: FxText.bodyMedium(
                                          "profile".tr(),
                                          fontWeight: controller.softIndex == 1
                                              ? 600
                                              : 500,
                                          color: controller.softIndex == 1
                                              ? contentTheme.primary
                                              : null,
                                        ),
                                      ),
                                      Tab(
                                        icon: FxText.bodyMedium(
                                          "messages".tr(),
                                          fontWeight: controller.softIndex == 2
                                              ? 600
                                              : 500,
                                          color: controller.softIndex == 2
                                              ? contentTheme.primary
                                              : null,
                                        ),
                                      ),
                                    ],
                                    // controller: _tabController,
                                    indicatorSize: TabBarIndicatorSize.tab,
                                  ),
                                  FxSpacing.height(16),
                                  SizedBox(
                                    height: 100,
                                    child: TabBarView(
                                      controller: controller.softTabController,
                                      children: [
                                        FxText.bodySmall(
                                            controller.dummyTexts[0]),
                                        FxText.bodySmall(
                                            controller.dummyTexts[1]),
                                        FxText.bodySmall(
                                            controller.dummyTexts[2]),
                                      ],
                                      // controller: _tabController,
                                    ),
                                  ),
                                ],
                              ))),
                          FxFlexItem(
                              sizes: "lg-6 md-12",
                              child: FxContainer.bordered(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FxText.titleMedium(
                                    "${"custom_indicator".tr()} #1",
                                    fontWeight: 600,
                                  ),
                                  FxSpacing.height(28),
                                  TabBar(
                                    controller: controller.customTabController1,
                                    isScrollable: true,
                                    indicator: FxTabIndicator(
                                      indicatorColor: contentTheme.primary,
                                      indicatorStyle:
                                          FxTabIndicatorStyle.rectangle,
                                      yOffset: 40,
                                    ),
                                    tabs: [
                                      Tab(
                                        icon: FxText.bodyMedium(
                                          "home".tr(),
                                          fontWeight:
                                              controller.customIndex1 == 0
                                                  ? 600
                                                  : 500,
                                          color: controller.customIndex1 == 0
                                              ? contentTheme.primary
                                              : null,
                                        ),
                                      ),
                                      Tab(
                                        icon: FxText.bodyMedium(
                                          "profile".tr(),
                                          fontWeight:
                                              controller.customIndex1 == 1
                                                  ? 600
                                                  : 500,
                                          color: controller.customIndex1 == 1
                                              ? contentTheme.primary
                                              : null,
                                        ),
                                      ),
                                      Tab(
                                        icon: FxText.bodyMedium(
                                          "messages".tr(),
                                          fontWeight:
                                              controller.customIndex1 == 2
                                                  ? 600
                                                  : 500,
                                          color: controller.customIndex1 == 2
                                              ? contentTheme.primary
                                              : null,
                                        ),
                                      ),
                                    ],
                                    // controller: _tabController,
                                    indicatorSize: TabBarIndicatorSize.tab,
                                  ),
                                  FxSpacing.height(16),
                                  SizedBox(
                                    height: 100,
                                    child: TabBarView(
                                      controller:
                                          controller.customTabController1,
                                      children: [
                                        FxText.bodySmall(
                                            controller.dummyTexts[0]),
                                        FxText.bodySmall(
                                            controller.dummyTexts[1]),
                                        FxText.bodySmall(
                                            controller.dummyTexts[2]),
                                      ],
                                      // controller: _tabController,
                                    ),
                                  ),
                                ],
                              ))),
                          // FxFlexItem(
                          //     sizes: "lg-6 md-12",
                          //     child: FxContainer.bordered(
                          //         child: Column(
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       children: [
                          //         FxText.titleMedium(
                          //           "Custom Indicator #2",
                          //           fontWeight: 600,
                          //         ),
                          //         FxSpacing.height(28),
                          //         TabBar(
                          //           controller: controller.customTabController2,
                          //           isScrollable: true,
                          //           physics: NeverScrollableScrollPhysics(),
                          //           indicator: FxTabIndicator(
                          //             indicatorColor: contentTheme.primary,
                          //             indicatorStyle: FxTabIndicatorStyle.circle,
                          //             yOffset: 40
                          //           ),
                          //           tabs: [
                          //             Tab(
                          //               icon: FxText.bodyMedium(
                          //                 "Home",
                          //                 fontWeight: controller.customIndex2 == 0 ? 600 : 500,
                          //                 color: controller.customIndex2 == 0 ? contentTheme.primary : null,
                          //               ),
                          //             ),
                          //             Tab(
                          //               icon: FxText.bodyMedium(
                          //                 "Profile",
                          //                 fontWeight: controller.customIndex2 == 1 ? 600 : 500,
                          //                 color: controller.customIndex2 == 1 ? contentTheme.primary : null,
                          //               ),
                          //             ),
                          //             Tab(
                          //               icon: FxText.bodyMedium(
                          //                 "Messages",
                          //                 fontWeight: controller.customIndex2 == 2 ? 600 : 500,
                          //                 color: controller.customIndex2 == 2 ? contentTheme.primary : null,
                          //               ),
                          //             ),
                          //           ],
                          //           // controller: _tabController,
                          //           indicatorSize: TabBarIndicatorSize.tab,
                          //         ),
                          //         FxSpacing.height(16),
                          //         SizedBox(
                          //           height: 100,
                          //           child: TabBarView(
                          //             controller: controller.customTabController2,
                          //             children: [
                          //               FxText.bodySmall(controller.dummyTexts[0]),
                          //               FxText.bodySmall(controller.dummyTexts[1]),
                          //               FxText.bodySmall(controller.dummyTexts[2]),
                          //             ],
                          //             // controller: _tabController,
                          //           ),
                          //         ),
                          //       ],
                          //     ))),
                        ]))
              ]));
        });
  }
}
