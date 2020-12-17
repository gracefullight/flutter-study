import 'package:flutter/material.dart';
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
  int year;
  int sales;
  charts.Color color;

  Sales(this.year, this.sales, this.color);
}

class _State extends State<MyApp> {
  List<Sales> _data;
  List<charts.Series<Sales, int>> _chartData;

  void _makeData() {
    _chartData = List<charts.Series<Sales, int>>();
    _data = <Sales>[
      Sales(0, 100, charts.MaterialPalette.red.shadeDefault),
      Sales(1, 75, charts.MaterialPalette.blue.shadeDefault),
      Sales(2, 25, charts.MaterialPalette.green.shadeDefault),
      Sales(3, 5, charts.MaterialPalette.yellow.shadeDefault),
    ];

    _chartData.add(charts.Series(
        id: 'Sales',
        data: _data,
        colorFn: (Sales sales, _) => sales.color,
        domainFn: (Sales sales, _) => sales.year,
        measureFn: (Sales sales, _) => sales.sales));
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
                      child: charts.PieChart(
                    _chartData,
                    animate: true,
                    animationDuration: Duration(seconds: 1),
                  ))
                ],
              ),
            )));
  }
}
