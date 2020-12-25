import 'package:flutter/material.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';

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
  void _showUrl() {
    _lanuch('https://www.google.com');
  }

  void _showEmail() {
    _lanuch('mailto:gracefullight.dev@gmail.com');
  }

  void _showSms() {
    _lanuch('sms:999-999-9999');
  }

  void _showTelephone() {
    _lanuch('tel:999-999-9999');
  }

  void _lanuch(String urlString) async {
    if (await canLaunch(urlString)) {
      await launch(urlString);
    } else {
      throw 'Could not lanuch Url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Hello world'),
        ),
        body: Container(
            padding: EdgeInsets.all(32.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RaisedButton(
                    onPressed: _showUrl,
                    child: Text('URL'),
                  ),
                  RaisedButton(
                    onPressed: _showEmail,
                    child: Text('Email'),
                  ),
                  RaisedButton(
                    onPressed: _showSms,
                    child: Text('SMS'),
                  ),
                  RaisedButton(
                    onPressed: _showTelephone,
                    child: Text('Telephone'),
                  )
                ],
              ),
            )));
  }
}
