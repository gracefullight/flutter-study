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
  List<BottomNavigationBarItem> _items;
  String _value = '';
  int _index = 0;

  @override
  void initState() {
    super.initState();
    _items = new List();
    _items.add(new BottomNavigationBarItem(
        icon: new Icon(Icons.people), label: 'People'));
    _items.add(new BottomNavigationBarItem(
        icon: new Icon(Icons.weekend), label: 'Weekend'));
    _items.add(new BottomNavigationBarItem(
        icon: new Icon(Icons.message), label: 'Message'));
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
            child: new Column(children: <Widget>[new Text(_value)]),
          )),
      bottomNavigationBar: new BottomNavigationBar(
          items: _items,
          fixedColor: Colors.blue,
          currentIndex: _index,
          onTap: (int item) {
            setState(() {
              _index = item;
              _value = 'Current value is ${_index.toString()}';
            });
          }),
    );
  }
}
