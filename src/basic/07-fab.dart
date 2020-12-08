import 'package:flutter/material.dart';

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
  void _onClicked() => setState(() => _value = new DateTime.now().toString());

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Hello world'),
        ),
        floatingActionButton: new FloatingActionButton(
          onPressed: _onClicked,
          backgroundColor: Colors.red,
          mini: true,
          child: new Icon(Icons.timer),
        ),
        body: new Container(
            padding: new EdgeInsets.all(32.0),
            child: new Center(
              child: new Column(children: <Widget>[
                new Text(_value),
              ]),
            )));
  }
}
