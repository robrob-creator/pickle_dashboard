import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:pickle/controllers/dashboard_controller.dart';
import 'package:pickle/extensions/extensions.dart';
import 'package:pickle/models/test.dart';
import 'package:pickle/services/theme/app_style.dart';
import 'package:pickle/utils/mixins/ui_mixin.dart';
import 'package:pickle/views/layouts/layout.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
// import 'dart:developer' as dev;

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  CustomerPageState createState() => CustomerPageState();
}

class CustomerPageState extends State<DashboardPage>
    with SingleTickerProviderStateMixin, UIMixin {
  late DashboardController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  NumberFormat formatter = NumberFormat.decimalPatternDigits(
    locale: 'en_us',
    decimalDigits: 2,
  );
  TextEditingController keywordController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController orController = TextEditingController();
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    controller = FxControllerStore.putOrFind(DashboardController());
  }

  @override
  Widget build(BuildContext context) {
    void showDialogWithListView(BuildContext context, List<TestSteps>? step) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: RichText(
              text: TextSpan(
                text: 'Steps Result: ',
                children: [
                  TextSpan(
                    text: step
                                ?.map((e) => e.result?.status?.toLowerCase())
                                .contains("failed") ==
                            true
                        ? "Failed"
                        : "Passed",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: step
                                    ?.map(
                                        (e) => e.result?.status?.toLowerCase())
                                    .contains("failed") ==
                                true
                            ? Colors.red
                            : Colors.green),
                  )
                ],
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.black.withOpacity(0.7)),
              ),
            ),
            content: Container(
              width: MediaQuery.of(context).size.width * 0.4,
              child: ListView.builder(
                itemCount: step?.length, // replace with your actual list length
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(
                        'Line ${step?[index].line}: ${step?[index].name}'), // replace with your actual data
                    subtitle: Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Status: ',
                            style: DefaultTextStyle.of(context).style,
                            children: <TextSpan>[
                              TextSpan(
                                text:
                                    '${step?[index].result?.status?.toLowerCase() == "failed" ? "Failed" : "Passed"}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: step?[index]
                                                .result
                                                ?.status
                                                ?.toLowerCase() ==
                                            "failed"
                                        ? Colors.red
                                        : Colors.green),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    Future<void> pickDirectoryAndDownloadJson(
        BuildContext context, String jsonString) async {
      try {
        // Pick a directory
        final result = await FilePicker.platform.getDirectoryPath();

        if (result == null) {
          // User canceled the picking
          return;
        }

        // Your JSON data (replace this with your actual JSON data)

        // Create a File instance with the desired file name in the selected directory
        final file = File('$result/data.json');

        // Write the JSON string to the file
        await file.writeAsString(jsonString);

        // Show a message to the user
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('JSON file downloaded successfully'),
          ),
        );
      } catch (e) {
        print('Error downloading JSON: $e');
        // Handle the error, show a message to the user, etc.
      }
    }

    return Layout(
      child: FxBuilder<DashboardController>(
          controller: controller,
          builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: FxSpacing.x(flexSpacing),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Icon(
                          Icons.receipt_long,
                          size: 30,
                          color: AppTheme.primaryColor,
                        ),
                      ),
                      FxText.titleMedium(
                        "Tests".tr(),
                        fontSize: 18,
                        fontWeight: 700,
                        color: AppTheme.primaryColor,
                      ),
                    ],
                  ),
                ),
                FxSpacing.height(flexSpacing),
                // if (controller.studentSectionList != null)
                FxCard(
                    shadow: FxShadow(
                        elevation: 0.5, position: FxShadowPosition.bottom),
                    margin: FxSpacing.x(flexSpacing),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        FxSpacing.height(20),
                        controller.isLoading
                            ? Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: Opacity(
                                      opacity: 0.5,
                                      child: Lottie.asset(
                                        'assets/lottie/pickle.json', // Replace with your Lottie animation file path
                                        width: 400,
                                        height: 400,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  Align(
                                      alignment: Alignment.center,
                                      child: SizedBox(
                                        width: 400,
                                        height: 400,
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(100),
                                            child: SizedBox(
                                                height: 50,
                                                width: 50,
                                                child:
                                                    CircularProgressIndicator()),
                                          ),
                                        ),
                                      )),
                                ],
                              )
                            : FxContainer.none(
                                child: Scrollbar(
                                  thickness: 10,
                                  controller: scrollController,
                                  trackVisibility: true,
                                  thumbVisibility: true,
                                  child: SingleChildScrollView(
                                    controller: scrollController,
                                    scrollDirection: Axis.horizontal,
                                    child: FxContainer.bordered(
                                      borderRadiusAll: 4,
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                FxSpacing.height(30),
                                                // FxButton(
                                                //   onPressed: scanQR,
                                                //   elevation: 0,
                                                //   padding: FxSpacing.xy(25, 20),
                                                //   backgroundColor: contentTheme.primary,
                                                //   borderRadiusAll:
                                                //       AppStyle.buttonRadius.medium,
                                                //   child: Row(
                                                //     mainAxisSize: MainAxisSize.min,
                                                //     children: [
                                                //       Icon(
                                                //         Icons.qr_code,
                                                //         size: 20,
                                                //         color: contentTheme.onPrimary,
                                                //       ),
                                                //       FxSpacing.width(8),
                                                //       FxText.labelMedium(
                                                //         'Scan QR'.tr().capitalizeWords,
                                                //         color: contentTheme.onPrimary,
                                                //       ),
                                                //     ],
                                                //   ),
                                                // ),
                                              ],
                                            ),
                                            Form(
                                              child: Wrap(
                                                spacing: 16.0,
                                                runSpacing: 8.0,
                                                alignment: WrapAlignment.start,
                                                direction: Axis.horizontal,
                                                children: [
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SizedBox(
                                                        width: 450,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            FxText.labelMedium(
                                                                "Feature Tag"),
                                                            SizedBox(
                                                              height: 8,
                                                            ),
                                                            TextFormField(
                                                              decoration: InputDecoration(
                                                                  hintText:
                                                                      "Enter Tag",
                                                                  hintStyle: FxTextStyle
                                                                      .bodySmall(
                                                                          xMuted:
                                                                              true),
                                                                  border:
                                                                      outlineInputBorder,
                                                                  enabledBorder:
                                                                      outlineInputBorder,
                                                                  focusedBorder:
                                                                      focusedInputBorder,
                                                                  contentPadding:
                                                                      FxSpacing
                                                                          .all(
                                                                              16),
                                                                  isCollapsed:
                                                                      true,
                                                                  floatingLabelBehavior:
                                                                      FloatingLabelBehavior
                                                                          .never),
                                                              onChanged:
                                                                  (newValue) {
                                                                var params = {
                                                                  "tags":
                                                                      newValue
                                                                };
                                                                controller
                                                                    .addParams(
                                                                        params);
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      FxSpacing.height(30),
                                                      FxButton(
                                                        onPressed: () async {
                                                          await controller
                                                              .getTests();
                                                        },
                                                        elevation: 0,
                                                        padding: FxSpacing.xy(
                                                            25, 20),
                                                        backgroundColor:
                                                            contentTheme
                                                                .primary,
                                                        borderRadiusAll:
                                                            AppStyle
                                                                .buttonRadius
                                                                .medium,
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            FxSpacing.width(8),
                                                            FxText.labelMedium(
                                                              'Query Filter'
                                                                  .tr()
                                                                  .capitalizeWords,
                                                              color: contentTheme
                                                                  .onPrimary,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      FxSpacing.height(30),
                                                      FxButton(
                                                        onPressed: () async {
                                                          var params = {
                                                            "pageSize": "100"
                                                          };
                                                          controller.addParams(
                                                              params);
                                                          await controller
                                                              .getTests();
                                                        },
                                                        padding:
                                                            FxSpacing.all(20),
                                                        backgroundColor:
                                                            contentTheme
                                                                .primary,
                                                        borderRadiusAll:
                                                            AppStyle
                                                                .buttonRadius
                                                                .medium,
                                                        child:
                                                            FxText.labelMedium(
                                                          'Display all'
                                                              .tr()
                                                              .capitalizeWords,
                                                          color: contentTheme
                                                              .onPrimary,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            FxSpacing.height(30),
                                            Wrap(
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    FxButton.medium(
                                                      onPressed: () async {
                                                        await controller
                                                            .getTests();
                                                      },
                                                      backgroundColor:
                                                          contentTheme.primary,
                                                      borderRadiusAll: AppStyle
                                                          .buttonRadius.medium,
                                                      child: Text(
                                                        "Refresh",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 16,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    FxButton.medium(
                                                      onPressed: () {
                                                        List<dynamic>
                                                            listElements =
                                                            controller
                                                                .listElements;
                                                        String json =
                                                            jsonEncode(
                                                                listElements);
                                                        pickDirectoryAndDownloadJson(
                                                            context, json);
                                                      },
                                                      backgroundColor:
                                                          contentTheme.primary,
                                                      borderRadiusAll: AppStyle
                                                          .buttonRadius.medium,
                                                      child: Text(
                                                        "Export",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            FxSpacing.height(16),
                                            Center(
                                              child: DataTable(
                                                sortAscending: true,
                                                onSelectAll: (_) => {},
                                                headingRowColor:
                                                    MaterialStatePropertyAll(
                                                        contentTheme.primary
                                                            .withAlpha(40)),
                                                dataRowMaxHeight: 80,
                                                showBottomBorder: false,
                                                columns: [
                                                  DataColumn(
                                                      label: FxText.labelLarge(
                                                    'Results'.tr(),
                                                    color: contentTheme.primary,
                                                  )),
                                                  DataColumn(
                                                      label: FxText.labelLarge(
                                                    'Line'.tr(),
                                                    color: contentTheme.primary,
                                                  )),
                                                  DataColumn(
                                                      label: FxText.labelLarge(
                                                    'Scenario'.tr(),
                                                    color: contentTheme.primary,
                                                  )),
                                                  DataColumn(
                                                      label: FxText.labelLarge(
                                                    'Type'.tr(),
                                                    color: contentTheme.primary,
                                                  )),
                                                  DataColumn(
                                                      label: FxText.labelLarge(
                                                    'Feature Tags'.tr(),
                                                    color: contentTheme.primary,
                                                  )),
                                                  DataColumn(
                                                      label: FxText.labelLarge(
                                                    'Case Tags'.tr(),
                                                    color: contentTheme.primary,
                                                  )),
                                                  DataColumn(
                                                      label: FxText.labelLarge(
                                                    'Select'.tr(),
                                                    color: contentTheme.primary,
                                                  )),
                                                ],
                                                rows: controller
                                                            .tests
                                                            .data
                                                            ?.list
                                                            ?.isNotEmpty ==
                                                        true
                                                    ? controller
                                                            .tests.data?.list
                                                            ?.map(
                                                                (e) => DataRow(
                                                                        cells: [
                                                                          DataCell(
                                                                              SizedBox(
                                                                            width:
                                                                                100,
                                                                            child:
                                                                                Column(
                                                                              children: [
                                                                                Row(
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: const EdgeInsets.all(8.0),
                                                                                      child: Icon(
                                                                                        Icons.circle,
                                                                                        color: e.elements?.firstOrNull?.steps?.map((e) => e.result?.status?.toLowerCase()).contains("failed") == true ? Colors.red : Colors.green,
                                                                                      ),
                                                                                    ),
                                                                                    FxText.bodyMedium("${e.elements?.firstOrNull?.steps?.map((e) => e.result?.status?.toLowerCase()).contains("failed") == true ? "Failed" : "Passed"} "),
                                                                                  ],
                                                                                ),
                                                                                TextButton(child: Text("View"), onPressed: () => showDialogWithListView(context, e.elements?.firstOrNull?.steps)),
                                                                              ],
                                                                            ),
                                                                          )),
                                                                          DataCell(
                                                                              SizedBox(
                                                                            width:
                                                                                50,
                                                                            child:
                                                                                FxText.bodyMedium("${e.elements?.firstOrNull?.line} "),
                                                                          )),
                                                                          DataCell(
                                                                              SizedBox(
                                                                            width:
                                                                                200,
                                                                            child:
                                                                                FxText.bodyMedium(e.elements?.firstOrNull?.name ?? 'N/A'),
                                                                          )),
                                                                          DataCell(
                                                                              SizedBox(
                                                                            width:
                                                                                100,
                                                                            child:
                                                                                Row(
                                                                              children: [
                                                                                FxText.bodyMedium(e.elements?.firstOrNull?.type ?? 'N/A'),
                                                                              ],
                                                                            ),
                                                                          )),
                                                                          DataCell(
                                                                              SizedBox(
                                                                            width:
                                                                                100,
                                                                            child:
                                                                                SelectableText(e.tags?.join(',') ?? 'N/A'),
                                                                          )),
                                                                          DataCell(
                                                                              SizedBox(
                                                                            width:
                                                                                100,
                                                                            child:
                                                                                Row(
                                                                              children: [
                                                                                FxText.bodyMedium(e.elements?.firstOrNull?.tags?.map((e) => e.name).join(',') ?? 'N/A'),
                                                                              ],
                                                                            ),
                                                                          )),
                                                                          DataCell(
                                                                              SizedBox(
                                                                            width:
                                                                                100,
                                                                            child:
                                                                                Row(
                                                                              children: [
                                                                                Checkbox(
                                                                                    value: e.elements?.every((element) => controller.listElements.firstOrNull?.elements?.contains(element) ?? false) ?? false,
                                                                                    onChanged: (value) {
                                                                                      if (value == true && controller.listElements.isEmpty) {
                                                                                        controller.addListElemet(e);
                                                                                        log("1");
                                                                                        log(controller.listElements.toString());
                                                                                        return;
                                                                                      }
                                                                                      if (value == true && controller.listElements.isNotEmpty) {
                                                                                        controller.addElemet(e.elements ?? []);
                                                                                        log("2");
                                                                                        log(controller.listElements.toString());
                                                                                        return;
                                                                                      }
                                                                                      if (value == false && controller.listElements.isNotEmpty) {
                                                                                        log("3");

                                                                                        controller.removeElementById(e.elements?.firstOrNull?.id ?? "");
                                                                                        log("3");

                                                                                        return;
                                                                                      } else {
                                                                                        controller.removeById(e.id ?? '');
                                                                                        log("4");
                                                                                        log(controller.listElements.toString());
                                                                                        return;
                                                                                      }
                                                                                    })
                                                                              ],
                                                                            ),
                                                                          )),
                                                                        ]))
                                                            .toList() ??
                                                        [] // Use an empty list as a default value if controller.billingListis null
                                                    : [
                                                        DataRow(
                                                          cells: [
                                                            DataCell(SizedBox(
                                                              width: 100,
                                                            )),
                                                            DataCell(SizedBox(
                                                              width: 100,
                                                            )),
                                                            DataCell(SizedBox(
                                                              width: 100,
                                                            )),
                                                            DataCell(SizedBox(
                                                              width: 100,
                                                            )),
                                                            DataCell(SizedBox(
                                                              width: 100,
                                                            )),
                                                            DataCell(SizedBox(
                                                              width: 100,
                                                            )),
                                                            DataCell(SizedBox(
                                                              width: 100,
                                                            )),
                                                          ],
                                                        ),
                                                      ],
                                              ),
                                            ),
                                          ]),
                                    ),
                                  ),
                                ),
                              ),
                      ],
                    ))
              ],
            );
          }),
    );
  }

  // void _onQRViewCreated(QRViewController controllerX) {
  //   setState(() {
  //     qrController = controllerX;
  //   });
  //   controllerX.scannedDataStream.listen((scanData) {
  //     dev.log(scanData.code ?? 'mo data');
  //     controller.setQRText(scanData.code ?? '');
  //     Navigator.pop(context);

  //     return;
  //   });
  // }

  @override
  void dispose() {
    super.dispose();
  }
}
