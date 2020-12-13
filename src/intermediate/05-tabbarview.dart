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

class Choice {
  final String title;
  final IconData icon;

  // 같은 값에 대해 메모리에서 레퍼런스 공유
  const Choice({this.title, this.icon});
}

class _State extends State<MyApp> with SingleTickerProviderStateMixin {
  TabController _controller;
  List<Choice> _items = const [
    const Choice(title: 'CAR', icon: Icons.directions_car),
    const Choice(title: 'BICYCLE', icon: Icons.directions_bike),
    const Choice(title: 'BOAT', icon: Icons.directions_boat),
    const Choice(title: 'BUS', icon: Icons.directions_bus),
    const Choice(title: 'TRAIN', icon: Icons.directions_railway),
    const Choice(title: 'WALK', icon: Icons.directions_walk),
  ];

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: _items.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Hello world'),
            bottom: new PreferredSize(
                child: Theme(
                    child: Container(
                        height: 48.0,
                        alignment: Alignment.center,
                        child: TabPageSelector(
                          controller: _controller,
                        )),
                    data:
                        Theme.of(context).copyWith(accentColor: Colors.white)),
                preferredSize: const Size.fromHeight(48.0))),
        body: TabBarView(
          controller: _controller,
          children: _items.map((Choice item) {
            return Container(
              padding: EdgeInsets.all(25.0),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Text(item.title),
                    Icon(item.icon, size: 120.0)
                  ],
                ),
              ),
            );
          }).toList(),
        ));
  }
}
