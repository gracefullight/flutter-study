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
  Future<void> _showAlert(BuildContext context, String message) async {
    return showDialog(
        context: context,
        child: new AlertDialog(title: new Text(message), actions: <Widget>[
          new FlatButton(
              onPressed: () => Navigator.pop(context), child: new Text('Ok'))
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Hello world'),
      ),
      body: new Container(
          padding: new EdgeInsets.all(32.0),
          child: new Center(
            child: new Column(children: <Widget>[
              new Text('Add widgets here'),
              new RaisedButton(
                  onPressed: () => _showAlert(context, 'Do alert'),
                  child: new Text('click me')),
            ]),
          )),
    );
  }
}
