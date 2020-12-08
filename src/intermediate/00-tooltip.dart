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
  String _value = 'Nothing';

  void _onPressed() => setState(() => _value = DateTime.now().toString());
  @override
  Widget build(BuildContext context) {
    // _getData();

    return Scaffold(
      appBar: AppBar(
        title: Text('Hello world'),
      ),
      body: Container(
          padding: EdgeInsets.all(32.0),
          child: Center(
            child: Column(children: <Widget>[
              Text(_value),
              IconButton(
                icon: Icon(Icons.timer),
                onPressed: _onPressed,
                tooltip: 'Click me',
              )
            ]),
          )),
    );
  }
}
