import 'package:flutter/material.dart';
import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;

void main(List<String> args) {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class Sales {
  String year;
  int sales;
  Sales(this.year, this.sales);
}

class _State extends State<MyApp> {
  List<Sales> _laptops;
  List<Sales> _desktops;
  List<charts.Series<Sales, String>> _chartData;

  void _makeData() {
    _laptops = List<Sales>();
    _desktops = List<Sales>();
    _chartData = List<charts.Series<Sales, String>>();

    final randomGenerator = Random();
    for (int i = 2017; i < 2020; i++) {
      _laptops.add(Sales(i.toString(), randomGenerator.nextInt(1000)));
      _desktops.add(Sales(i.toString(), randomGenerator.nextInt(1000)));
    }

    _chartData.add(charts.Series(
        id: 'Sales',
        data: _laptops,
        domainFn: (Sales sales, _) => sales.year,
        measureFn: (Sales sales, _) => sales.sales,
        displayName: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault));

    _chartData.add(charts.Series(
        id: 'Sales',
        data: _desktops,
        domainFn: (Sales sales, _) => sales.year,
        measureFn: (Sales sales, _) => sales.sales,
        displayName: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault));
  }

  @override
  void initState() {
    super.initState();
    _makeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Hello world'),
        ),
        body: Container(
            padding: EdgeInsets.all(32.0),
            child: Center(
              child: Column(
                children: <Widget>[
                  Text('Sales Data'),
                  Expanded(
                      child: charts.BarChart(
                    _chartData,
                    vertical: false,
                  ))
                ],
              ),
            )));
  }
}
