import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
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
            Text('Welcome Home'),
            RaisedButton(
              onPressed: () {
                // callback 으로 appbar 의 back button 노출 제어
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/second', (Route<dynamic> route) => false);
              },
              child: Text('Next'),
            )
          ],
        )),
      ),
    );
  }
}
