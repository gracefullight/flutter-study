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
  double _value = 0.0;

  void _onChanged(double value) => setState(() => _value = value);

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
            Slider(
              value: _value,
              onChanged: _onChanged,
            ),
            Container(
                padding: EdgeInsets.all(32.0),
                child: LinearProgressIndicator(
                    value: _value,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.green))),
            Container(
                padding: EdgeInsets.all(32.0),
                child: CircularProgressIndicator(
                  value: _value,
                ))
          ]))),
    );
  }
}
