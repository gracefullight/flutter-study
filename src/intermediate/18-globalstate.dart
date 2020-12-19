import 'package:flutter/material.dart';

class Second extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SecondState();
  }
}

class _SecondState extends State<Second> {
  GlobalState _store = GlobalState.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello World'),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
            child: Column(
          children: [
            Text('Hello ${_store.get('name')}'),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Back'),
            ),
          ],
        )),
      ),
    );
  }
}

class GlobalState {
  final Map<dynamic, dynamic> _data = {};

  static GlobalState instance = GlobalState._();
  GlobalState._();

  set(dynamic key, dynamic value) => _data[key] = value;
  get(dynamic key) => _data[key];
}
