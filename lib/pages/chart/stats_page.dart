import 'package:ecociel/utils/text.dart';
import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class _MyHomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  _MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  List<_YourDailyContribution> data = [
    _YourDailyContribution('Jan', 35),
    _YourDailyContribution('Feb', 28),
    _YourDailyContribution('Mar', 34),
    _YourDailyContribution('Apr', 32),
    _YourDailyContribution('May', 40)
  ];

  @override
  void initState() {
    super.initState();
  }

  Widget _buildStackedAreaChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(text: 'Temp Area'),
      legend: Legend(isVisible: true),
      primaryXAxis: CategoryAxis(),
      primaryYAxis: NumericAxis(
        labelFormat: '{value}%',
        minimum: 0,
        maximum: 100,
        interval: 20,
      ),
      series: _getStackedAreaSeries(),
    );
  }

  List<StackedAreaSeries<_ChartData, String>> _getStackedAreaSeries() {
    final List<_ChartData> data = [
      _ChartData('8-9', 20, 30, 50),
      _ChartData('12-3', 40, 10, 50),
      _ChartData('3-6', 30, 40, 30),
      _ChartData('9-11', 10, 20, 70),
    ];

    return <StackedAreaSeries<_ChartData, String>>[
      StackedAreaSeries<_ChartData, String>(
        dataSource: data,
        xValueMapper: (_ChartData sales, _) => sales.category,
        yValueMapper: (_ChartData sales, _) => sales.value1,
        name: 'Cool',
      ),
      StackedAreaSeries<_ChartData, String>(
        dataSource: data,
        xValueMapper: (_ChartData sales, _) => sales.category,
        yValueMapper: (_ChartData sales, _) => sales.value2,
        name: 'Hot',
      ),
      StackedAreaSeries<_ChartData, String>(
        dataSource: data,
        xValueMapper: (_ChartData sales, _) => sales.category,
        yValueMapper: (_ChartData sales, _) => sales.value3,
        name: 'Very Hot',
      ),
    ];
  }

  Widget _buildAreaChart() {
    return SfCartesianChart(
      title: ChartTitle(text: 'UV Chart'),
      legend: Legend(isVisible: true),
      primaryXAxis: CategoryAxis(),
      primaryYAxis: NumericAxis(),
      series: _getAreaSeries(),
    );
  }

  List<AreaSeries<_ChartData1, String>> _getAreaSeries() {
    final List<_ChartData1> data = [
      _ChartData1('8-12', 23),
      _ChartData1('12-3', 34),
      _ChartData1('3-6', 26),
      _ChartData1('6-9', 12),
      _ChartData1('9-11', 2),
    ];

    return <AreaSeries<_ChartData1, String>>[
      AreaSeries<_ChartData1, String>(
        dataSource: data,
        xValueMapper: (_ChartData1 sales, _) => sales.category,
        yValueMapper: (_ChartData1 sales, _) => sales.value,
        name: 'Series 1',
      ),
    ];
  }

  Widget _buildStepAreaChart() {
    return SfCartesianChart(
      title: ChartTitle(text: 'Daily Contribution'),
      legend: Legend(isVisible: true),
      primaryXAxis: CategoryAxis(),
      primaryYAxis: NumericAxis(),
      series: _getStepAreaSeries(),
    );
  }

  List<StepAreaSeries<_ChartData1, String>> _getStepAreaSeries() {
    final List<_ChartData1> data = [
      _ChartData1('8-12', 30),
      _ChartData1('12-3', 42),
      _ChartData1('3-6', 30),
      _ChartData1('6-9', 42),
      _ChartData1('9-11', 08),
    ];

    return <StepAreaSeries<_ChartData1, String>>[
      StepAreaSeries<_ChartData1, String>(
        dataSource: data,
        xValueMapper: (_ChartData1 sales, _) => sales.category,
        yValueMapper: (_ChartData1 sales, _) => sales.value,
        name: 'Series 1',
      ),
    ];
  }

  Widget _buildRadialBarChart() {
    return SfCircularChart(
      annotations: <CircularChartAnnotation>[
        CircularChartAnnotation(
          widget: Container(
            child: Text('Goal'),
          ),
        ),
      ],
      series: _getRadialBarSeries(),
    );
  }

  List<RadialBarSeries<_ChartData1, String>> _getRadialBarSeries() {
    final List<_ChartData1> data = [
      _ChartData1('Category 1', 30),
      _ChartData1('Category 2', 40),
      _ChartData1('Category 3', 20),
      _ChartData1('Category 4', 50),
      _ChartData1('Category 5', 10),
    ];

    return <RadialBarSeries<_ChartData1, String>>[
      RadialBarSeries<_ChartData1, String>(
        dataSource: data,
        xValueMapper: (_ChartData1 sales, _) => sales.category,
        yValueMapper: (_ChartData1 sales, _) => sales.value,
        pointRadiusMapper: (_ChartData1 sales, _) => sales.value.toString(),
        dataLabelMapper: (_ChartData1 sales, _) => sales.category,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: txt("Stats", size: 20, weight: FontWeight.bold),
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            child: SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              legend: Legend(isVisible: true),
              // Enable tooltip
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <CartesianSeries<_YourDailyContribution, String>>[
                LineSeries<_YourDailyContribution, String>(
                    dataSource: data,
                    xValueMapper: (_YourDailyContribution sales, _) =>
                        sales.year,
                    yValueMapper: (_YourDailyContribution sales, _) =>
                        sales.sales,
                    name: 'Montly Contribution',
                    // Enable data label
                    dataLabelSettings: DataLabelSettings(isVisible: true))
              ],
            ),
          ),
          Container(
            height: 400,
            width: double.infinity,
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                crossAxisSpacing: 8.0, // Spacing between columns
                mainAxisSpacing: 8.0, // Spacing between rows
              ),
              itemCount: 4, // Number of items in the grid
              itemBuilder: (context, index) {
                if (index == 0) {
                  return _buildStackedAreaChart();
                }
                if (index == 1) {
                  return _buildAreaChart();
                }
                if (index == 2) {
                  return _buildRadialBarChart();
                }
                if (index == 3) {
                  return _buildStepAreaChart();
                }
                return _buildStackedAreaChart();
              },
            ),
          )
        ],
      ),
    );
  }
}

class _YourDailyContribution {
  _YourDailyContribution(this.year, this.sales);

  final String year;
  final double sales;
}

class StatsPage extends StatelessWidget {
  const StatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return _MyHomePage();
  }
}

class _ChartData {
  _ChartData(this.category, this.value1, this.value2, this.value3);

  final String category;
  final double value1;
  final double value2;
  final double value3;
}

class _ChartData1 {
  _ChartData1(this.category, this.value);

  final String category;
  final double value;
}
