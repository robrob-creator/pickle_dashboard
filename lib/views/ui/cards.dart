import 'package:pickle/controllers/ui/cards_controller.dart';
import 'package:pickle/extensions/extensions.dart';
import 'package:pickle/images.dart';
import 'package:pickle/services/theme/app_style.dart';
import 'package:pickle/utils/mixins/ui_mixin.dart';
import 'package:pickle/views/layouts/layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutx/flutx.dart';
import 'package:pickle/extensions/string.dart';

class CardsPage extends StatefulWidget {
  const CardsPage({super.key});

  @override
  _CardsPageState createState() => _CardsPageState();
}

class _CardsPageState extends State<CardsPage>
    with SingleTickerProviderStateMixin, UIMixin {
  late CardsController controller;

  @override
  void initState() {
    super.initState();
    controller = FxControllerStore.putOrFind(CardsController());
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
        child: FxBuilder<CardsController>(
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
                          "cards".tr(),
                          fontSize: 18,
                          fontWeight: 600,
                        ),
                        FxBreadcrumb(
                          children: [
                            FxBreadcrumbItem(name: 'ui'.tr().toUpperCase()),
                            FxBreadcrumbItem(name: 'cards'.tr(), active: true),
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
                            sizes: "xl-3 md-6 sm-12",
                            child: FxCard(
                              padding: FxSpacing.zero,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Image.asset(
                                    Images.squareImages[0],
                                    height: 250,
                                    fit: BoxFit.cover,
                                  ),
                                  Padding(
                                    padding: FxSpacing.all(16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        FxText.titleMedium(
                                          'card_title'.tr().capitalizeWords,
                                          fontWeight: 600,
                                        ),
                                        FxSpacing.height(8),
                                        FxText.bodySmall(
                                          controller.dummyTexts[0],
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        FxSpacing.height(20),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: FxButton(
                                            onPressed: () {},
                                            elevation: 0,
                                            padding: FxSpacing.xy(20, 16),
                                            backgroundColor:
                                                contentTheme.primary,
                                            borderRadiusAll:
                                                AppStyle.buttonRadius.small,
                                            child: FxText.bodySmall(
                                              'click_me'.tr().capitalizeWords,
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
                            sizes: "xl-3 md-6 sm-12",
                            child: FxCard(
                              padding: FxSpacing.zero,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Image.asset(
                                    Images.landscapeImages[2],
                                    height: 250,
                                    fit: BoxFit.cover,
                                  ),
                                  Padding(
                                    padding: FxSpacing.all(16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        FxText.titleMedium(
                                          'text_actions'.tr().capitalizeWords,
                                          fontWeight: 600,
                                        ),
                                        FxSpacing.height(8),
                                        FxText.bodySmall(
                                          controller.dummyTexts[1],
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        FxSpacing.height(20),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            FxButton.text(
                                              onPressed: () {},
                                              splashColor: Colors.transparent,
                                              padding: FxSpacing.y(16),
                                              child: FxText.bodySmall(
                                                'ok'.tr(),
                                                color: contentTheme.primary,
                                                fontWeight: 600,
                                              ),
                                            ),
                                            // FxSpacing.width(0),
                                            FxButton.text(
                                              onPressed: () {},
                                              splashColor: Colors.transparent,
                                              padding: FxSpacing.y(16),
                                              child: FxText.bodySmall(
                                                'cancel'.tr(),
                                                color: contentTheme.danger,
                                                fontWeight: 600,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )),
                        FxFlexItem(
                            sizes: "xl-3 md-6 sm-12",
                            child: FxCard(
                              padding: FxSpacing.zero,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Image.asset(
                                    Images.landscapeImages[1],
                                    height: 318,
                                    fit: BoxFit.cover,
                                  ),
                                  Padding(
                                    padding: FxSpacing.all(16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        FxText.bodySmall(
                                          controller.dummyTexts[2],
                                          maxLines: 4,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )),
                        FxFlexItem(
                            sizes: "xl-3 md-6 sm-12",
                            child: FxCard(
                              padding: FxSpacing.zero,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Padding(
                                    padding: FxSpacing.all(16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        FxText.titleMedium(
                                          'card_title'.tr().capitalizeWords,
                                          fontWeight: 600,
                                        ),
                                        FxSpacing.height(4),
                                        FxText.bodySmall(
                                          'subtitle_is_more_useful'.tr(),
                                          muted: true,
                                          fontWeight: 600,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Image.asset(
                                    Images.squareImages[8],
                                    height: 202,
                                    fit: BoxFit.cover,
                                  ),
                                  Padding(
                                    padding: FxSpacing.all(16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        FxText.bodySmall(
                                          controller.dummyTexts[3],
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        FxSpacing.height(20),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            FxButton.text(
                                              onPressed: () {},
                                              splashColor: Colors.transparent,
                                              padding: FxSpacing.y(16),
                                              child: FxText.bodySmall(
                                                'oK'.tr(),
                                                color: contentTheme.primary,
                                                fontWeight: 600,
                                              ),
                                            ),
                                            // FxSpacing.width(0),
                                            FxButton.text(
                                              onPressed: () {},
                                              splashColor: Colors.transparent,
                                              padding: FxSpacing.y(16),
                                              child: FxText.bodySmall(
                                                'cancel'.tr(),
                                                color: contentTheme.danger,
                                                fontWeight: 600,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )),
                        FxFlexItem(
                            sizes: "xl-3 md-6 sm-12",
                            child: FxCard(
                              padding: FxSpacing.zero,
                              shadow: FxShadow.none(),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Padding(
                                    padding: FxSpacing.all(16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        FxText.titleMedium(
                                          'no_shadow'.tr().capitalizeWords,
                                          fontWeight: 600,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Image.asset(
                                    Images.squareImages[3],
                                    height: 220,
                                    fit: BoxFit.cover,
                                  ),
                                  Padding(
                                    padding: FxSpacing.all(16),
                                    child: FxText.bodySmall(
                                      controller.dummyTexts[4],
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                ],
                              ),
                            )),
                        FxFlexItem(
                            sizes: "xl-3 md-6 sm-12",
                            child: FxCard.bordered(
                              padding: FxSpacing.zero,
                              shadow: FxShadow.none(),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Padding(
                                    padding: FxSpacing.all(16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        FxText.titleMedium(
                                          'bordered'.tr(),
                                          fontWeight: 600,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Image.asset(
                                    Images.squareImages[8],
                                    height: 220,
                                    fit: BoxFit.cover,
                                  ),
                                  Padding(
                                    padding: FxSpacing.all(16),
                                    child: FxText.bodySmall(
                                      controller.dummyTexts[5],
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                ],
                              ),
                            )),
                        FxFlexItem(
                            sizes: "xl-3 md-6 sm-12",
                            child: FxCard(
                              padding: FxSpacing.zero,
                              shadow: FxShadow(elevation: 1),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Padding(
                                    padding: FxSpacing.all(16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        FxText.titleMedium(
                                          '${'shadow'.tr()}: 1',
                                          fontWeight: 600,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Image.asset(
                                    Images.squareImages[9],
                                    height: 220,
                                    fit: BoxFit.cover,
                                  ),
                                  Padding(
                                    padding: FxSpacing.all(16),
                                    child: FxText.bodySmall(
                                      controller.dummyTexts[6],
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                ],
                              ),
                            )),
                        FxFlexItem(
                            sizes: "xl-3 md-6 sm-12",
                            child: FxCard(
                              padding: FxSpacing.zero,
                              shadow: FxShadow(elevation: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Padding(
                                    padding: FxSpacing.all(16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        FxText.titleMedium(
                                          'very_high'.tr().capitalizeWords,
                                          fontWeight: 600,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Image.asset(
                                    Images.squareImages[12],
                                    height: 220,
                                    fit: BoxFit.cover,
                                  ),
                                  Padding(
                                    padding: FxSpacing.all(16),
                                    child: FxText.bodySmall(
                                      controller.dummyTexts[7],
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                  FxSpacing.height(flexSpacing * 2),
                  Padding(
                      padding: FxSpacing.x(flexSpacing / 2),
                      child: FxFlex(
                          wrapAlignment: WrapAlignment.start,
                          wrapCrossAlignment: WrapCrossAlignment.start,
                          children: [
                            FxFlexItem(
                                sizes: "xl-6 sm-12",
                                child: FxContainer.bordered(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  paddingAll: 0,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Container(
                                        color: colorScheme.primary
                                            .withOpacity(0.08),
                                        padding: FxSpacing.xy(flexSpacing, 12),
                                        child: FxText.titleMedium(
                                          "card_customizer"
                                              .tr()
                                              .capitalizeWords,
                                          fontWeight: 600,
                                          color: colorScheme.primary,
                                        ),
                                      ),
                                      Padding(
                                        padding: FxSpacing.xy(flexSpacing, 16),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 140,
                                                  child: FxText.bodyMedium(
                                                    "shadow_position"
                                                        .tr()
                                                        .capitalizeWords,
                                                    fontWeight: 600,
                                                  ),
                                                ),
                                                FxSpacing.width(16),
                                                PopupMenuButton(
                                                    key: controller
                                                        .shadowPositionKey,
                                                    onSelected: controller
                                                        .onChangePosition,
                                                    itemBuilder:
                                                        (BuildContext context) {
                                                      return FxShadowPosition
                                                          .values
                                                          .map((position) {
                                                        return PopupMenuItem(
                                                          value: position,
                                                          height: 32,
                                                          child:
                                                              FxText.bodySmall(
                                                            position
                                                                .humanReadable,
                                                            color: theme
                                                                .colorScheme
                                                                .onBackground,
                                                            fontWeight: 600,
                                                          ),
                                                        );
                                                      }).toList();
                                                    },
                                                    color:
                                                        theme.cardTheme.color,
                                                    child: FxContainer.bordered(
                                                      padding:
                                                          FxSpacing.xy(12, 8),
                                                      child: Row(
                                                        children: <Widget>[
                                                          FxText.labelMedium(
                                                            controller
                                                                .shadowPosition
                                                                .humanReadable,
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
                                                  width: 120,
                                                  child: FxText.bodyMedium(
                                                    "shadow_size"
                                                        .tr()
                                                        .capitalizeWords,
                                                    fontWeight: 600,
                                                  ),
                                                ),
                                                FxSpacing.width(16),
                                                Slider(
                                                  value: controller
                                                      .shadowElevation,
                                                  min: 0,
                                                  max: 40,
                                                  divisions: 40,
                                                  label: controller
                                                      .shadowElevation
                                                      .floor()
                                                      .toString(),
                                                  onChanged: controller
                                                      .onChangeElevation,
                                                ),
                                              ],
                                            ),
                                            FxSpacing.height(12),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: 130,
                                                  child: FxText.bodyMedium(
                                                    "shadow_color"
                                                        .tr()
                                                        .capitalizeWords,
                                                    fontWeight: 600,
                                                  ),
                                                ),
                                                FxSpacing.width(16),
                                                BlockPicker(
                                                  pickerColor:
                                                      controller.shadowColor,
                                                  onColorChanged:
                                                      controller.onChangeColor,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                            FxFlexItem(
                                sizes: "xl-4 md-6 sm-12",
                                child: Padding(
                                  padding: FxSpacing.x(40),
                                  child: FxCard(
                                    padding: FxSpacing.zero,
                                    shadow: FxShadow(
                                      elevation: controller.shadowElevation,
                                      position: controller.shadowPosition,
                                      color:
                                          controller.shadowColor.withAlpha(100),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Padding(
                                          padding: FxSpacing.all(16),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              FxText.titleMedium(
                                                'result'.tr(),
                                                fontWeight: 600,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Image.asset(
                                          Images.squareImages[12],
                                          height: 220,
                                          fit: BoxFit.cover,
                                        ),
                                        Padding(
                                          padding: FxSpacing.all(16),
                                          child: FxText.bodySmall(
                                            controller.dummyTexts[7],
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )),
                          ])),
                  FxSpacing.height(flexSpacing * 2),
                ],
              );
            }));
  }
}
