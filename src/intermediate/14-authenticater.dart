import 'package:flutter/material.dart';

class Authenticator extends StatefulWidget {
  final ValueChanged<bool> onAuthenticated;

  Authenticator({Key key, this.onAuthenticated});

  @override
  _AuthenticatorState createState() =>
      new _AuthenticatorState(onAuthenticated: onAuthenticated);
}

class _AuthenticatorState extends State<Authenticator> {
  TextEditingController _user;
  TextEditingController _pass;
  final ValueChanged<bool> onAuthenticated;

  _AuthenticatorState({Key key, this.onAuthenticated});

  void _onPressed() {
    if (_user.text != 'user' || _pass.text != '1234') {
      onAuthenticated(false);
    } else {
      onAuthenticated(true);
    }
  }

  @override
  void initState() {
    super.initState();
    _user = TextEditingController();
    _pass = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              children: [
                TextField(
                  controller: _user,
                  decoration: InputDecoration(labelText: 'Username'),
                ),
                TextField(
                  controller: _pass,
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child:
                      RaisedButton(onPressed: _onPressed, child: Text('Login')),
                )
              ],
            )));
  }
}
