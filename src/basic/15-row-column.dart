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
  TextEditingController _user = TextEditingController();
  TextEditingController _pass = TextEditingController();

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
              Text('Please Login'),
              Row(
                children: [
                  Text('Username: '),
                  Expanded(
                      child: TextField(
                    controller: _user,
                  ))
                ],
              ),
              Row(
                children: [
                  Text('Password: '),
                  Expanded(
                      child: TextField(
                    controller: _pass,
                    obscureText: true,
                  ))
                ],
              ),
              Padding(
                  padding: EdgeInsets.all(12.0),
                  child: RaisedButton(
                      onPressed: () => print('login ${_user.text}'),
                      child: Text('Click me')))
            ]),
          )),
    );
  }
}
