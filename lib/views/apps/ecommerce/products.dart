import 'package:feather_icons/feather_icons.dart';
import 'package:pickle/controllers/apps/ecommerce/products_controller.dart';
import 'package:pickle/extensions/extensions.dart';
import 'package:pickle/images.dart';
import 'package:pickle/services/theme/app_style.dart';
import 'package:pickle/utils/mixins/ui_mixin.dart';
import 'package:pickle/utils/utils.dart';
import 'package:pickle/views/layouts/layout.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

class EcommerceProductsPage extends StatefulWidget {
  const EcommerceProductsPage({super.key});

  @override
  _EcommerceProductsPageState createState() => _EcommerceProductsPageState();
}

class _EcommerceProductsPageState extends State<EcommerceProductsPage>
    with SingleTickerProviderStateMixin, UIMixin {
  late EcommerceProductsController controller;

  @override
  void initState() {
    super.initState();
    controller = FxControllerStore.putOrFind(EcommerceProductsController());
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
        child: FxBuilder<EcommerceProductsController>(
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
                          "products".tr(),
                          fontSize: 18,
                          fontWeight: 600,
                        ),
                        FxBreadcrumb(
                          children: [
                            FxBreadcrumbItem(name: 'ecommerce'.tr()),
                            FxBreadcrumbItem(
                                name: 'products'.tr(), active: true),
                          ],
                        ),
                      ],
                    ),
                  ),
                  FxSpacing.height(flexSpacing),
                  FxCard(
                      shadow: FxShadow(
                          elevation: 0.5, position: FxShadowPosition.bottom),
                      margin: FxSpacing.x(flexSpacing),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          FxButton(
                            onPressed: controller.goToCreateProduct,
                            elevation: 0,
                            padding: FxSpacing.xy(20, 16),
                            backgroundColor: contentTheme.primary,
                            borderRadiusAll: AppStyle.buttonRadius.medium,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.add_outlined,
                                  size: 20,
                                  color: contentTheme.onPrimary,
                                ),
                                FxSpacing.width(8),
                                FxText.labelMedium(
                                  'create_product'.tr().capitalizeWords,
                                  color: contentTheme.onPrimary,
                                ),
                              ],
                            ),
                          ),
                          FxSpacing.height(16),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: FxContainer.none(
                              borderRadiusAll: 4,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: DataTable(
                                  sortAscending: true,
                                  onSelectAll: (_) => {},
                                  headingRowColor: MaterialStatePropertyAll(
                                      contentTheme.primary.withAlpha(40)),
                                  dataRowHeight: 60,
                                  showBottomBorder: false,
                                  columns: [
                                    DataColumn(
                                        label: FxText.labelLarge(
                                      'id'.tr(),
                                      color: contentTheme.primary,
                                    )),
                                    DataColumn(
                                        label: FxText.labelLarge(
                                      'name'.tr(),
                                      color: contentTheme.primary,
                                    )),
                                    DataColumn(
                                        label: FxText.labelLarge(
                                      'price'.tr(),
                                      color: contentTheme.primary,
                                    )),
                                    DataColumn(
                                        label: FxText.labelLarge(
                                      'rating'.tr(),
                                      color: contentTheme.primary,
                                    )),
                                    DataColumn(
                                        label: FxText.labelLarge(
                                      'sku'.tr(),
                                      color: contentTheme.primary,
                                    )),
                                    DataColumn(
                                        label: FxText.labelLarge(
                                      'stock'.tr(),
                                      color: contentTheme.primary,
                                    )),
                                    DataColumn(
                                        label: FxText.labelLarge(
                                      'orders'.tr(),
                                      color: contentTheme.primary,
                                    )),
                                    DataColumn(
                                        label: FxText.labelLarge(
                                      'created_at'.tr().capitalizeWords,
                                      color: contentTheme.primary,
                                    )),
                                    DataColumn(
                                        label: FxText.labelLarge(
                                      'action'.tr(),
                                      color: contentTheme.primary,
                                    )),
                                  ],
                                  rows: controller.products
                                      .mapIndexed((index, data) =>
                                          DataRow(cells: [
                                            DataCell(FxText.bodyMedium(
                                                '#${data.id}')),
                                            DataCell(SizedBox(
                                              width: 300,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  FxContainer.none(
                                                      borderRadiusAll: 20,
                                                      clipBehavior: Clip
                                                          .antiAliasWithSaveLayer,
                                                      child: Image.asset(
                                                        Images.squareImages[
                                                            index %
                                                                Images
                                                                    .squareImages
                                                                    .length],
                                                        height: 40,
                                                        width: 40,
                                                        fit: BoxFit.cover,
                                                      )),
                                                  FxSpacing.width(16),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      FxText.labelLarge(
                                                          data.name.toString()),
                                                      FxText.labelSmall(
                                                        data.category
                                                            .toString(),
                                                        muted: true,
                                                        letterSpacing: 0,
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            )),
                                            DataCell(FxText.bodyMedium(
                                                '\$${data.price}')),
                                            DataCell(Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(
                                                  Icons.star_outline_rounded,
                                                  color:
                                                      AppColors.ratingStarColor,
                                                  size: 20,
                                                ),
                                                FxSpacing.width(4),
                                                FxText.bodySmall(
                                                    '${data.rating} (${data.ratingCount})')
                                              ],
                                            )),
                                            DataCell(FxText.bodyMedium(
                                                '${data.sku}')),
                                            DataCell(FxText.bodyMedium(
                                                '${data.stock}')),
                                            DataCell(FxText.bodyMedium(
                                                '${data.ordersCount}')),
                                            DataCell(Row(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                FxText.labelLarge(
                                                    '${Utils.getDateStringFromDateTime(data.createdAt, showMonthShort: true)}'),
                                                FxSpacing.width(4),
                                                FxText.bodySmall(
                                                  '${Utils.getTimeStringFromDateTime(data.createdAt, showSecond: false)}',
                                                  muted: true,
                                                  fontWeight: 600,
                                                )
                                              ],
                                            )),
                                            DataCell(Align(
                                              alignment: Alignment.center,
                                              child: FxContainer.bordered(
                                                onTap: () => {},
                                                padding: FxSpacing.xy(6, 6),
                                                borderColor: contentTheme
                                                    .primary
                                                    .withAlpha(40),
                                                child: Icon(
                                                  FeatherIcons.edit2,
                                                  size: 12,
                                                  color: contentTheme.primary,
                                                ),
                                              ),
                                            )),
                                            // DataCell(FxText.bodyMedium('${DateTime.tryParse('2022-11-26T15:56:14Z')}')),
                                          ]))
                                      .toList()),
                            ),
                          ),
                        ],
                      )),
                ],
              );
            }));
  }
}
