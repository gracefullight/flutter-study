import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
// final GoogleSignIn _googleSignIn = GoogleSignIn();

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  String _status;

  @override
  void initState() {
    super.initState();
    _status = 'Not Authenticated';
  }

  void _signInAnonymous() async {
    UserCredential userCredential = await _auth.signInAnonymously();
    User user = userCredential.user;
    if (user != null && user.isAnonymous == true) {
      setState(() {
        _status = 'Signed in Anonymously';
      });
    } else {
      setState(() {
        _status = 'Sign in failed';
      });
    }
  }

  void _signOut() async {
    await _auth.signOut();
    setState(() {
      _status = 'Signed out';
    });
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
                children: [
                  Text(_status),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RaisedButton(
                          onPressed: _signOut, child: Text('Sign out')),
                      RaisedButton(
                          onPressed: _signInAnonymous,
                          child: Text('Sign in Anonymously')),
                    ],
                  )
                ],
              ),
            )));
  }
}
