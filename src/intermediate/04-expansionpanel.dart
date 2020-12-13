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

class MyItem {
  bool isExpanded;
  final String header;
  final Widget body;

  MyItem(this.isExpanded, this.header, this.body);
}

class _State extends State<MyApp> {
  List<MyItem> _items = List();

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 10; i = i + 1) {
      _items.add(MyItem(
          false,
          'Item $i',
          Container(
              padding: EdgeInsets.all(10.0), child: Text('Hello world'))));
    }
  }

  ExpansionPanel _createItem(MyItem item) {
    return ExpansionPanel(
        headerBuilder: (BuildContext context, bool isExpanded) {
          return Container(
              padding: EdgeInsets.all(5.0),
              child: Text('Header ${item.header}'));
        },
        body: item.body,
        isExpanded: item.isExpanded);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Hello world'),
        ),
        body: Container(
            padding: EdgeInsets.all(32.0),
            child: ListView(children: <Widget>[
              ExpansionPanelList(
                expansionCallback: (int index, bool isExpanded) {
                  setState(() {
                    _items[index].isExpanded = !_items[index].isExpanded;
                  });
                },
                children: _items.map(_createItem).toList(),
              )
            ])));
  }
}
