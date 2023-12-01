import 'package:pickle/controllers/other/syncfusion_charts_controller.dart';
import 'package:pickle/extensions/extensions.dart';
import 'package:pickle/services/theme/app_style.dart';
import 'package:pickle/utils/mixins/ui_mixin.dart';
import 'package:pickle/views/layouts/layout.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SyncfusionChartsPage extends StatefulWidget {
  const SyncfusionChartsPage({super.key});

  @override
  _SyncfusionChartsPageState createState() => _SyncfusionChartsPageState();
}

class _SyncfusionChartsPageState extends State<SyncfusionChartsPage>
    with SingleTickerProviderStateMixin, UIMixin {
  late SyncfusionChartsController controller;

  @override
  void initState() {
    super.initState();
    controller = FxControllerStore.putOrFind(SyncfusionChartsController());
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
        child: FxBuilder<SyncfusionChartsController>(
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
                          "syncfusion_charts".tr().capitalizeWords,
                          fontSize: 18,
                          fontWeight: 600,
                        ),
                        FxBreadcrumb(
                          children: [
                            FxBreadcrumbItem(name: 'ui'.tr()),
                            FxBreadcrumbItem(name: 'charts'.tr(), active: true),
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
                            sizes: "lg-6 md-12",
                            child: FxContainer.bordered(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 6,
                                        height: 18,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(1)),
                                          color: AppColors.random.color,
                                        ),
                                      ),
                                      FxSpacing.width(12),
                                      FxText.titleMedium(
                                          "area_chart".tr().capitalizeWords,
                                          fontWeight: 600),
                                    ],
                                  ),
                                  FxSpacing.height(16),
                                  _buildDefaultAreaChart(),
                                ],
                              ),
                            )),
                        FxFlexItem(
                            sizes: "lg-6 md-12",
                            child: FxContainer.bordered(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 6,
                                        height: 18,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(1)),
                                          color: AppColors.random.color,
                                        ),
                                      ),
                                      FxSpacing.width(12),
                                      FxText.titleMedium(
                                          "bar_chart".tr().capitalizeWords,
                                          fontWeight: 600),
                                    ],
                                  ),
                                  FxSpacing.height(16),
                                  _buildDefaultBarChart(),
                                ],
                              ),
                            )),
                        FxFlexItem(
                            sizes: "lg-6 md-12",
                            child: FxContainer.bordered(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 6,
                                        height: 18,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(1)),
                                          color: AppColors.random.color,
                                        ),
                                      ),
                                      FxSpacing.width(12),
                                      FxText.titleMedium(
                                          "bubble_chart".tr().capitalizeWords,
                                          fontWeight: 600),
                                    ],
                                  ),
                                  FxSpacing.height(16),
                                  _buildDefaultBubbleChart(),
                                ],
                              ),
                            )),
                        FxFlexItem(
                            sizes: "lg-6 md-12",
                            child: FxContainer.bordered(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 6,
                                        height: 18,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(1)),
                                          color: AppColors.random.color,
                                        ),
                                      ),
                                      FxSpacing.width(12),
                                      FxText.titleMedium(
                                          "column_chart".tr().capitalizeWords,
                                          fontWeight: 600),
                                    ],
                                  ),
                                  FxSpacing.height(16),
                                  _buildDefaultColumnChart(),
                                ],
                              ),
                            )),
                        FxFlexItem(
                            sizes: "lg-6 md-12",
                            child: FxContainer.bordered(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 6,
                                        height: 18,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(1)),
                                          color: AppColors.random.color,
                                        ),
                                      ),
                                      FxSpacing.width(12),
                                      FxText.titleMedium(
                                          "doughnut_chart".tr().capitalizeWords,
                                          fontWeight: 600),
                                    ],
                                  ),
                                  FxSpacing.height(16),
                                  _buildDefaultDoughnutChart(),
                                ],
                              ),
                            )),
                        FxFlexItem(
                            sizes: "lg-6 md-12",
                            child: FxContainer.bordered(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 6,
                                        height: 18,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(1)),
                                          color: AppColors.random.color,
                                        ),
                                      ),
                                      FxSpacing.width(12),
                                      FxText.titleMedium(
                                          "pie_chart".tr().capitalizeWords,
                                          fontWeight: 600),
                                    ],
                                  ),
                                  FxSpacing.height(16),
                                  _buildDefaultPieChart(),
                                ],
                              ),
                            )),
                        FxFlexItem(
                            sizes: "lg-6 md-12",
                            child: FxContainer.bordered(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 6,
                                        height: 18,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(1)),
                                          color: AppColors.random.color,
                                        ),
                                      ),
                                      FxSpacing.width(12),
                                      FxText.titleMedium(
                                          "radial_chart".tr().capitalizeWords,
                                          fontWeight: 600),
                                    ],
                                  ),
                                  FxSpacing.height(16),
                                  _buildDefaultRadialBarChart(),
                                ],
                              ),
                            )),
                        FxFlexItem(
                            sizes: "lg-6 md-12",
                            child: FxContainer.bordered(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 6,
                                        height: 18,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(1)),
                                          color: AppColors.random.color,
                                        ),
                                      ),
                                      FxSpacing.width(12),
                                      FxText.titleMedium(
                                          "pyramid_chart".tr().capitalizeWords,
                                          fontWeight: 600),
                                    ],
                                  ),
                                  FxSpacing.height(16),
                                  _buildDefaultPyramidChart(),
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

  /// ====   Charts   =====

  //Default Area Chart
  SfCartesianChart _buildDefaultAreaChart() {
    List<AreaSeries<ChartSampleData, DateTime>> getDefaultAreaSeries() {
      return <AreaSeries<ChartSampleData, DateTime>>[
        AreaSeries<ChartSampleData, DateTime>(
          dataSource: controller.areaChartData,
          opacity: 0.7,
          name: 'product_a'.tr().capitalizeWords,
          xValueMapper: (ChartSampleData sales, _) => sales.x as DateTime,
          yValueMapper: (ChartSampleData sales, _) => sales.y,
        ),
        AreaSeries<ChartSampleData, DateTime>(
          dataSource: controller.areaChartData,
          opacity: 0.7,
          name: 'product_b',
          xValueMapper: (ChartSampleData sales, _) => sales.x as DateTime,
          yValueMapper: (ChartSampleData sales, _) => sales.secondSeriesYValue,
        )
      ];
    }

    return SfCartesianChart(
      legend: Legend(opacity: 0.7, position: LegendPosition.bottom),
      title: ChartTitle(
          text: 'average_sales_comparison\n'.tr().capitalizeWords,
          textStyle: FxTextStyle.bodySmall()),
      plotAreaBorderWidth: 0,
      primaryXAxis: DateTimeAxis(
          interval: 1,
          intervalType: DateTimeIntervalType.years,
          majorGridLines: const MajorGridLines(width: 0),
          edgeLabelPlacement: EdgeLabelPlacement.shift),
      primaryYAxis: NumericAxis(
          labelFormat: '{value}M',
          //title: AxisTitle(text: 'Revenue in millions'),
          interval: 1,
          axisLine: const AxisLine(width: 0),
          majorTickLines:
              const MajorTickLines(size: 8, color: Colors.transparent)),
      series: getDefaultAreaSeries(),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  SfCartesianChart _buildDefaultBarChart() {
    List<BarSeries<ChartSampleData, String>> getDefaultBarSeries() {
      return <BarSeries<ChartSampleData, String>>[
        BarSeries<ChartSampleData, String>(
            dataSource: controller.barChartData,
            xValueMapper: (ChartSampleData sales, _) => sales.x as String,
            yValueMapper: (ChartSampleData sales, _) => sales.y,
            name: '2015'),
        BarSeries<ChartSampleData, String>(
            dataSource: controller.barChartData,
            xValueMapper: (ChartSampleData sales, _) => sales.x as String,
            yValueMapper: (ChartSampleData sales, _) =>
                sales.secondSeriesYValue,
            name: '2016'),
        BarSeries<ChartSampleData, String>(
            dataSource: controller.barChartData,
            xValueMapper: (ChartSampleData sales, _) => sales.x as String,
            yValueMapper: (ChartSampleData sales, _) => sales.thirdSeriesYValue,
            name: '2017')
      ];
    }

    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(
          text: '${'tourism_-_number'.tr().capitalizeWords}'
              ' ${'of_arrivals'.tr()}'
              '\n',
          textStyle: FxTextStyle.bodySmall()),
      legend: Legend(isVisible: true, position: LegendPosition.bottom),
      primaryXAxis: CategoryAxis(
        majorGridLines: MajorGridLines(width: 0),
      ),
      primaryYAxis: NumericAxis(
        majorGridLines: MajorGridLines(width: 0),
      ),
      series: getDefaultBarSeries(),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  SfCartesianChart _buildDefaultBubbleChart() {
    List<BubbleSeries<ChartSampleData, num>> getDefaultBubbleSeries() {
      return <BubbleSeries<ChartSampleData, num>>[
        BubbleSeries<ChartSampleData, num>(
          opacity: 0.7,
          dataSource: controller.bubbleChartData,
          xValueMapper: (ChartSampleData sales, _) => sales.xValue as num,
          yValueMapper: (ChartSampleData sales, _) => sales.y,
          sizeValueMapper: (ChartSampleData sales, _) => sales.size,
        )
      ];
    }

    return SfCartesianChart(
        plotAreaBorderWidth: 0,
        title: ChartTitle(
            text: 'world_countries_details\n'.tr(),
            textStyle: FxTextStyle.bodySmall()),
        primaryXAxis: NumericAxis(
            majorGridLines: const MajorGridLines(width: 0),
            title: AxisTitle(
                text: 'literacy_rate'.tr(), textStyle: FxTextStyle.bodySmall()),
            minimum: 60,
            maximum: 100),
        primaryYAxis: NumericAxis(
            axisLine: const AxisLine(width: 0),
            majorTickLines:
                const MajorTickLines(size: 8, color: Colors.transparent),
            title: AxisTitle(
                text: 'gdp_growth_rate'.tr(),
                textStyle: FxTextStyle.bodySmall())),
        tooltipBehavior: controller.tooltipBehavior,
        series: getDefaultBubbleSeries());
  }

  SfCartesianChart _buildDefaultColumnChart() {
    List<ColumnSeries<ChartSampleData, String>> getDefaultColumnSeries() {
      return <ColumnSeries<ChartSampleData, String>>[
        ColumnSeries<ChartSampleData, String>(
          dataSource: controller.columnChartData,
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.y,
          dataLabelSettings: DataLabelSettings(
              isVisible: true, textStyle: TextStyle(fontSize: 10)),
        )
      ];
    }

    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(
        text: 'population_growth_of_various_countries\n'.tr(),
        textStyle: FxTextStyle.bodySmall(),
      ),
      primaryXAxis: CategoryAxis(
        majorGridLines: MajorGridLines(width: 0),
      ),
      primaryYAxis: NumericAxis(
          axisLine: AxisLine(width: 0),
          labelFormat: '{value}%',
          majorTickLines: MajorTickLines(size: 8, color: Colors.transparent)),
      series: getDefaultColumnSeries(),
      tooltipBehavior: controller.tooltipBehavior,
    );
  }

  SfCircularChart _buildDefaultDoughnutChart() {
    List<DoughnutSeries<ChartSampleData, String>> getDefaultDoughnutSeries() {
      return <DoughnutSeries<ChartSampleData, String>>[
        DoughnutSeries<ChartSampleData, String>(
            radius: '80%',
            explode: true,
            explodeOffset: '10%',
            dataSource: controller.doughnutChartData,
            xValueMapper: (ChartSampleData data, _) => data.x as String,
            yValueMapper: (ChartSampleData data, _) => data.y,
            dataLabelMapper: (ChartSampleData data, _) => data.text,
            dataLabelSettings: const DataLabelSettings(isVisible: true))
      ];
    }

    return SfCircularChart(
      title: ChartTitle(
          text: 'composition_of_ocean_water'.tr(),
          textStyle: FxTextStyle.bodySmall()),
      legend: Legend(
          isVisible: true,
          overflowMode: LegendItemOverflowMode.wrap,
          position: LegendPosition.bottom),
      series: getDefaultDoughnutSeries(),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  SfCircularChart _buildDefaultPieChart() {
    List<PieSeries<ChartSampleData, String>> getDefaultPieSeries() {
      return <PieSeries<ChartSampleData, String>>[
        PieSeries<ChartSampleData, String>(
            explode: true,
            explodeIndex: 0,
            explodeOffset: '10%',
            dataSource: controller.pieChartData,
            xValueMapper: (ChartSampleData data, _) => data.x as String,
            yValueMapper: (ChartSampleData data, _) => data.y,
            dataLabelMapper: (ChartSampleData data, _) => data.text,
            startAngle: 90,
            endAngle: 90,
            dataLabelSettings: const DataLabelSettings(isVisible: true)),
      ];
    }

    return SfCircularChart(
      title: ChartTitle(
          text: 'sales_by_sales_person'.tr(),
          textStyle: FxTextStyle.bodySmall()),
      legend: Legend(isVisible: true, position: LegendPosition.bottom),
      series: getDefaultPieSeries(),
    );
  }

  SfCircularChart _buildDefaultRadialBarChart() {
    List<RadialBarSeries<ChartSampleData, String>> getRadialBarDefaultSeries() {
      return <RadialBarSeries<ChartSampleData, String>>[
        RadialBarSeries<ChartSampleData, String>(
            maximumValue: 15,
            dataLabelSettings: const DataLabelSettings(
                isVisible: true, textStyle: TextStyle(fontSize: 10.0)),
            dataSource: controller.radialChartData,
            cornerStyle: CornerStyle.bothCurve,
            gap: '10%',
            radius: '90%',
            xValueMapper: (ChartSampleData data, _) => data.x as String,
            yValueMapper: (ChartSampleData data, _) => data.y,
            pointRadiusMapper: (ChartSampleData data, _) => data.text,
            pointColorMapper: (ChartSampleData data, _) => data.pointColor,
            dataLabelMapper: (ChartSampleData data, _) => data.x as String)
      ];
    }

    return SfCircularChart(
      key: GlobalKey(),
      title: ChartTitle(
          text: 'shot_put_distance'.tr(), textStyle: FxTextStyle.bodySmall()),
      series: getRadialBarDefaultSeries(),
      tooltipBehavior: controller.radialTooltipBehavior,
    );
  }

  SfPyramidChart _buildDefaultPyramidChart() {
    PyramidSeries<ChartSampleData, String> getPyramidSeries() {
      return PyramidSeries<ChartSampleData, String>(
          dataSource: controller.pyramidChartData,
          height: '90%',
          explode: false,
          gapRatio: 0,
          pyramidMode: PyramidMode.linear,
          xValueMapper: (ChartSampleData data, _) => data.x as String,
          yValueMapper: (ChartSampleData data, _) => data.y,
          dataLabelSettings: const DataLabelSettings(
            isVisible: true,
          ));
    }

    return SfPyramidChart(
      // smartLabelMode: SmartLabelMode.shift,
      title: ChartTitle(
          text: 'comparison_of_calories'.tr(),
          textStyle: FxTextStyle.bodySmall()),
      tooltipBehavior: TooltipBehavior(enable: true),
      series: getPyramidSeries(),
    );
  }
}
