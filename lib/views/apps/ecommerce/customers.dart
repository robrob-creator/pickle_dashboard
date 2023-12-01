import 'package:feather_icons/feather_icons.dart';
import 'package:pickle/controllers/apps/ecommerce/customers_controller.dart';
import 'package:pickle/extensions/extensions.dart';
import 'package:pickle/images.dart';
import 'package:pickle/services/theme/app_style.dart';
import 'package:pickle/utils/mixins/ui_mixin.dart';
import 'package:pickle/utils/utils.dart';
import 'package:pickle/views/layouts/layout.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

class CustomersPage extends StatefulWidget {
  const CustomersPage({Key? key}) : super(key: key);

  @override
  State<CustomersPage> createState() => _CustomersPageState();
}

class _CustomersPageState extends State<CustomersPage>
    with SingleTickerProviderStateMixin, UIMixin {
  late CustomersController controller;

  @override
  void initState() {
    super.initState();
    controller = FxControllerStore.putOrFind(CustomersController());
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: FxBuilder<CustomersController>(
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
                      "customers".tr(),
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    FxBreadcrumb(
                      children: [
                        FxBreadcrumbItem(name: 'ecommerce'.tr()),
                        FxBreadcrumbItem(name: 'customers'.tr(), active: true),
                      ],
                    ),
                  ],
                ),
              ),
              FxSpacing.height(flexSpacing),
              Padding(
                padding: FxSpacing.x(flexSpacing),
                child: FxCard(
                  shadow: FxShadow(
                      elevation: 0.5, position: FxShadowPosition.bottom),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: FxContainer.none(
                      borderRadiusAll: 4,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          FxButton(
                            onPressed: controller.goToDashboard,
                            elevation: 0,
                            padding: FxSpacing.xy(20, 16),
                            backgroundColor: contentTheme.primary,
                            borderRadiusAll: AppStyle.buttonRadius.medium,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  FeatherIcons.monitor,
                                  size: 18,
                                  color: contentTheme.onPrimary,
                                ),
                                FxSpacing.width(8),
                                FxText.labelMedium(
                                  'dashboard'.tr(),
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
                                sortColumnIndex: 1,
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
                                    ),
                                  ),
                                  DataColumn(
                                    label: FxText.labelLarge(
                                      'name'.tr(),
                                      color: contentTheme.primary,
                                    ),
                                  ),
                                  DataColumn(
                                    label: FxText.labelLarge(
                                      'phone'.tr(),
                                      color: contentTheme.primary,
                                    ),
                                  ),
                                  DataColumn(
                                    label: FxText.labelLarge(
                                      'balance'.tr(),
                                      color: contentTheme.primary,
                                    ),
                                  ),
                                  DataColumn(
                                    label: FxText.labelLarge(
                                      'orders'.tr(),
                                      color: contentTheme.primary,
                                    ),
                                  ),
                                  DataColumn(
                                    label: FxText.labelLarge(
                                      'last_order_at'.tr().capitalizeWords,
                                      color: contentTheme.primary,
                                    ),
                                  ),
                                  DataColumn(
                                      label: FxText.labelLarge(
                                    'action'.tr(),
                                    color: contentTheme.primary,
                                  ))
                                ],
                                rows: controller.customers
                                    .mapIndexed(
                                      (index, data) => DataRow(
                                        cells: [
                                          DataCell(
                                              FxText.bodyMedium("#${data.id}")),
                                          DataCell(
                                            SizedBox(
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
                                                      Images.avatars[index %
                                                          Images
                                                              .avatars.length],
                                                      height: 40,
                                                      width: 40,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  FxSpacing.width(15),
                                                  FxText.labelLarge(
                                                    data.firstName.toString(),
                                                  ),
                                                  FxSpacing.width(5),
                                                  FxText.labelLarge(
                                                    data.lastName.toString(),
                                                    // muted: true,
                                                    // letterSpacing: 0,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          DataCell(FxText.bodyMedium(
                                              '${data.phoneNumber}')),
                                          DataCell(FxText.bodyMedium(
                                              '\$${data.balance}')),
                                          DataCell(FxText.bodyMedium(
                                              '${data.ordersCount}')),
                                          DataCell(Row(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              FxText.labelLarge(
                                                  '${Utils.getDateStringFromDateTime(data.lastOrder, showMonthShort: true)}'),
                                              FxSpacing.width(4),
                                              FxText.bodySmall(
                                                '${Utils.getTimeStringFromDateTime(data.lastOrder, showSecond: false)}',
                                                muted: true,
                                                fontWeight: 600,
                                              )
                                            ],
                                          )),
                                          DataCell(
                                            Align(
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
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
