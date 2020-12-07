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
  // https://medium.com/flutter/keys-what-are-they-good-for-13cb51742e7d
  final GlobalKey<ScaffoldState> _scaffoldState =
      new GlobalKey<ScaffoldState>();

  void _showbar() {
    _scaffoldState.currentState
        .showSnackBar(new SnackBar(content: new Text('Hello world')));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldState,
      appBar: new AppBar(
        title: new Text('Hello world'),
      ),
      body: new Container(
          padding: new EdgeInsets.all(32.0),
          child: new Center(
            child: new Column(children: <Widget>[
              new Text('Add widgets here'),
              new RaisedButton(
                  onPressed: _showbar, child: new Text('Click me')),
            ]),
          )),
    );
  }
}
