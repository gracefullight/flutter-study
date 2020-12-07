import 'package:flutter/material.dart';
// flutter_svg: ^0.19.1
import 'package:flutter_svg/flutter_svg.dart';

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
              Text('Image Demo'),
              Expanded(child: SvgPicture.asset('images/flutter.svg')),
              Expanded(child: Image.network('https://i.imgur.com/4fWZN.jpeg'))
            ]),
          )),
    );
  }
}
