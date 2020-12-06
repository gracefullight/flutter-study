import 'package:flutter/material.dart';
import 'dart:async';

void main(List<String> args) {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<MyApp> {
  String _value = '';

  Future _selectDate() async {
    // userchoice 를 기다려야하므로 async 여야함
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        // 안 넣어주면 달력 띄우다가 죽을 수도 있음
        firstDate: new DateTime(2017),
        lastDate: new DateTime(2021));
    if (picked != null) {
      setState(() => _value = picked.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('DateTimePicker'),
        ),
        body: new Container(
            padding: new EdgeInsets.all(32.0),
            child: new Center(
              child: new Column(children: <Widget>[
                new Text(_value),
                new RaisedButton(
                    onPressed: _selectDate, child: new Text('Click me'))
              ]),
            )));
  }
}
