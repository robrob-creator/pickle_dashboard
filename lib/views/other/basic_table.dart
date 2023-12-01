import 'package:pickle/controllers/other/basic_table_controller.dart';
import 'package:pickle/extensions/string.dart';
import 'package:pickle/images.dart';
import 'package:pickle/utils/mixins/ui_mixin.dart';
import 'package:pickle/views/layouts/layout.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

class BasicTablesPage extends StatefulWidget {
  const BasicTablesPage({super.key});

  @override
  _BasicTablesPageState createState() => _BasicTablesPageState();
}

class _BasicTablesPageState extends State<BasicTablesPage>
    with SingleTickerProviderStateMixin, UIMixin {
  late BasicTableController controller;

  @override
  void initState() {
    super.initState();
    controller = FxControllerStore.putOrFind(BasicTableController());
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
        child: FxBuilder<BasicTableController>(
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
                          "basic_tables".tr().capitalizeWords,
                          fontSize: 18,
                          fontWeight: 600,
                        ),
                        FxBreadcrumb(
                          children: [
                            FxBreadcrumbItem(name: 'ui'.tr()),
                            FxBreadcrumbItem(
                                name: 'basic_table'.tr().capitalizeWords,
                                active: true),
                          ],
                        ),
                      ],
                    ),
                  ),
                  FxSpacing.height(flexSpacing),
                  FxContainer.bordered(
                    margin: FxSpacing.x(flexSpacing),
                    child: SingleChildScrollView(
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
                                'code'.tr(),
                                color: contentTheme.primary,
                              )),
                              DataColumn(
                                  label: FxText.labelLarge(
                                'price'.tr(),
                                color: contentTheme.primary,
                              )),
                              DataColumn(
                                  label: FxText.labelLarge(
                                'qty'.tr(),
                                color: contentTheme.primary,
                              )),
                              DataColumn(
                                  label: FxText.labelLarge(
                                'action'.tr(),
                                color: contentTheme.primary,
                              )),
                            ],
                            rows: controller.datas
                                .mapIndexed((index, data) => DataRow(cells: [
                                      DataCell(
                                          FxText.bodyMedium('#${data.id}')),
                                      DataCell(SizedBox(
                                        width: 300,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            FxContainer.none(
                                                borderRadiusAll: 20,
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                child: Image.asset(
                                                    Images.squareImages[index %
                                                        Images.squareImages
                                                            .length],
                                                    height: 40,
                                                    fit: BoxFit.cover,
                                                    width: 40)),
                                            FxSpacing.width(16),
                                            FxText.labelLarge(
                                                data.name.toString()),
                                          ],
                                        ),
                                      )),
                                      DataCell(FxText.bodyMedium(
                                          '${data.code.capitalize}')),
                                      DataCell(FxText.bodyMedium(
                                          '\$${data.amount}')),
                                      DataCell(
                                          FxText.bodyMedium('${data.qty}')),
                                      DataCell(Align(
                                        alignment: Alignment.center,
                                        child: FxContainer.bordered(
                                          onTap: () => {},
                                          padding: FxSpacing.xy(6, 6),
                                          borderColor: contentTheme.primary
                                              .withAlpha(40),
                                          child: Icon(
                                            Icons.edit_outlined,
                                            size: 14,
                                            color: contentTheme.primary,
                                          ),
                                        ),
                                      )),
                                      // DataCell(FxText.bodyMedium('${DateTime.tryParse('2022-11-26T15:56:14Z')}')),
                                    ]))
                                .toList()),
                      ),
                    ),
                  )
                ],
              );
            }));
  }
}
