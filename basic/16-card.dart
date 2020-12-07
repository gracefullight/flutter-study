import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello world'),
      ),
      body: Container(
          padding: EdgeInsets.all(32.0),
          child: Center(
            child: Column(children: <Widget>[
              Card(
                  child: Container(
                      padding: EdgeInsets.all(32.0),
                      child: Column(
                        children: <Widget>[
                          Text('Hello world'),
                          Text('How are you?')
                        ],
                      ))),
              Card(
                  child: Container(
                      padding: EdgeInsets.all(32.0),
                      child: Column(
                        children: <Widget>[
                          Text('Hello world'),
                          Text('How are you?')
                        ],
                      ))),
            ]),
          )),
    );
  }
}
