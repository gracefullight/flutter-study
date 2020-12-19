import 'package:flutter/material.dart';
import './screens/home.dart';
import './screens/second.dart';
import './screens/third.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Navigation',
        routes: <String, WidgetBuilder>{
          // Navigator.of(context).pushNamed('/home')
          '/home': (BuildContext context) => Home(),
          // Navigator.of(context).pushNamed('/second')
          '/second': (BuildContext context) => Second(),
          // Navigator.of(context).pushNamed('/thrid')
          '/third': (BuildContext context) => Third(),
        },
        home: Home());
  }
}
