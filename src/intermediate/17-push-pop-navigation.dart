import 'package:flutter/material.dart';

class Third extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ThirdState();
  }
}

class _ThirdState extends State<Third> {
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
            Text('Third Page'),
            RaisedButton(
              onPressed: () {
                if (Navigator.of(context).canPop()) {
                  Navigator.of(context).pop();
                } else {
                  Navigator.of(context).pushNamed('/second');
                }
              },
              child: Text('Back'),
            )
          ],
        )),
      ),
    );
  }
}
