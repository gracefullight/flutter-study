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
  List<Sales> _data;
  List<charts.Series<Sales, String>> _chartData;

  void _makeData() {
    _data = List<Sales>();
    _chartData = List<charts.Series<Sales, String>>();

    final randomGenerator = Random();
    for (int i = 2010; i < 2019; i++) {
      _data.add(Sales(i.toString(), randomGenerator.nextInt(1000)));
    }

    _chartData.add(charts.Series(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        data: _data,
        domainFn: (Sales sales, _) => sales.year,
        measureFn: (Sales sales, _) => sales.sales,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        displayName: 'sales'));
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
                  Expanded(child: charts.BarChart(_chartData))
                ],
              ),
            )));
  }
}
