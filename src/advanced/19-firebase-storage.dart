import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:path/path.dart';

import 'auth.dart' as auth;
import 'storage.dart' as fb_storage;

/** auth
final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();

Future<bool> signOut() async {
  await _auth.signOut();
  return true;
}

Future<Null> ensureLoggedIn() async {
  User user = _auth.currentUser;
  assert(user != null);
  assert(user.isAnonymous == false);
  print('We are logged into Firebase');
}

Future<bool> signInGoogle() async {
  GoogleSignInAccount googleUser = await _googleSignIn.signIn();
  GoogleSignInAuthentication googleAuth = await googleUser.authentication;

  final GoogleAuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  final UserCredential userCredential =
      await _auth.signInWithCredential(credential);

  final User user = userCredential.user;
  return (user != null && user.isAnonymous == false);
}
*/

/** fb_storage;
Future<String> upload(File file, String basename) async {
  await auth.ensureLoggedIn();
  Reference ref = FirebaseStorage.instance.ref().child('file/test/$basename');
  UploadTask uploadTask = ref.putFile(file);
  TaskSnapshot task = await uploadTask;
  String location = await task.ref.getDownloadURL();
  String name = ref.name;
  String bucket = ref.bucket;
  String path = ref.fullPath;

  print('Url: $location');
  print('Name: $name');
  print('Bucket: $bucket');
  print('path: $path');
  return location;
}

Future<String> download(Uri location) async {
  http.Response data = await http.get(location);
  return data.body;
}
*/

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  final FirebaseApp app = await Firebase.initializeApp(
      name: 'firebaseapp',
      options: FirebaseOptions(
          appId: '',
          messagingSenderId: '',
          apiKey: '',
          projectId: ''));

  final FirebaseStorage storage = FirebaseStorage.instanceFor(
      app: app, bucket: '');
  runApp(MaterialApp(
    home: MyApp(storage: storage),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({this.storage});
  final FirebaseStorage storage;

  @override
  _State createState() => _State(storage: storage);
}

class _State extends State<MyApp> {
  _State({this.storage});
  final FirebaseStorage storage;

  String _status;
  String _location;

  @override
  void initState() {
    super.initState();
    _status = 'Not Authenticated';
    _signIn();
  }

  void _signIn() async {
    if (await auth.signInGoogle() == true) {
      setState(() {
        _status = 'Signed in';
      });
    } else {
      setState(() {
        _status = 'Could not sing in';
      });
    }
  }

  void _signOut() async {
    if (await auth.signOut() == true) {
      setState(() {
        _status = 'Signed out';
      });
    } else {
      setState(() {
        _status = 'Signed in';
      });
    }
  }

  void _upload() async {
    Directory systemTempDir = Directory.systemTemp;
    File file = await File('${systemTempDir.path}/foo.txt').create();
    await file.writeAsString('Hello world');

    String location = await fb_storage.upload(file, basename(file.path));
    setState(() {
      _location = location;
      _status = 'Uploaded';
    });

    print('Uploaded to $_location');
  }

  void _download() async {
    if (_location.isEmpty) {
      setState(() {
        _status = 'Please upload first';
      });
      return;
    }

    Uri location = Uri.parse(_location);
    String data = await fb_storage.download(location);
    setState(() {
      _status = 'Downloaded: $data';
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(_status),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RaisedButton(
                          onPressed: _signOut, child: Text('Sign out')),
                      RaisedButton(
                          onPressed: _signIn, child: Text('Sign in Google')),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RaisedButton(onPressed: _upload, child: Text('Upload')),
                      RaisedButton(
                          onPressed: _download, child: Text('Download')),
                    ],
                  )
                ],
              ),
            )));
  }
}
