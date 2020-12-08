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
  int _counter = 0;
  List<Widget> _list = List();

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 5; i = i + 1) {
      Widget child = _newItem(i);
      _list.add(child);
    }
  }

  void _onclicked() {
    Widget child = _newItem(_counter);
    setState(() => _list.add(child));
  }

  Widget _newItem(int i) {
    Key key = Key('item_$i');
    Container child = Container(
        key: key,
        padding: EdgeInsets.all(10.0),
        child: Chip(
          label: Text('$i name here'),
          deleteIconColor: Colors.red,
          deleteButtonTooltipMessage: 'Delete',
          onDeleted: () => _removeItem(key),
          avatar: CircleAvatar(
            backgroundColor: Colors.grey.shade800,
            child: Text(i.toString()),
          ),
        ));
    _counter++;
    return child;
  }

  void _removeItem(Key key) {
    for (int i = 0; i < _list.length; i = i + 1) {
      Widget child = _list.elementAt(i);
      if (child.key == key) {
        setState(() => _list.removeAt(i));
        print('Removing ${key.toString()}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello world'),
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: _onclicked, child: Icon(Icons.add)),
      body: Container(
          padding: EdgeInsets.all(32.0),
          child: Center(child: Column(children: _list))),
    );
  }
}
