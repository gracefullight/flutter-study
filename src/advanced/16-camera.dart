import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
// minSdkVersion 21
import 'package:camera/camera.dart';
import 'dart:io';
import 'dart:async';

List<CameraDescription> cameras;
Permission permissionFromString(String value) {
  Permission permission;
  for (Permission item in Permission.values) {
    if (item.toString() == value) {
      permission = item;
      break;
    }
  }

  return permission;
}

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras();
  await permissionFromString('Permission.storage').request();
  await permissionFromString('Permission.camera').request();
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  CameraController controller;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  Permission _permissionCamera;
  Permission _permissionStorage;

  @override
  void initState() {
    super.initState();
    controller = CameraController(cameras[0], ResolutionPreset.medium);
    controller.initialize().then((_) {
      if (!mounted) return;
      setState(() {
        // TODO: Anything we want
      });
    });

    _permissionCamera = permissionFromString('Permission.camera');
    _permissionStorage = permissionFromString('Permission.storage');
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  Future<XFile> saveImage() async {
    if (controller.value.isTakingPicture) {
      return null;
    }

    try {
      XFile file = await controller.takePicture();
      // 왜인지 모르겠는데 무한정 기다림
      return file;
    } on CameraException catch (e) {
      showInSnakBar(e.toString());
      return null;
    }
  }

  void takePicture() async {
    bool hasCamera = await Permission.camera.isGranted;
    bool hasStorage = await Permission.storage.isGranted;

    if (hasCamera == false || hasStorage == false) {
      showInSnakBar('Lacking permissions to take a picture');
      return;
    }

    XFile file = await saveImage();
    if (mounted && file != null) {
      showInSnakBar('Picture saved to ${file.path}');
    }
  }

  void showInSnakBar(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
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
                  Row(
                    children: [
                      RaisedButton(
                        onPressed: takePicture,
                        child: Text('Take Picture'),
                      ),
                      RaisedButton(
                        onPressed: openAppSettings,
                        child: Text('Settings'),
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                  ),
                  AspectRatio(
                    aspectRatio: 1.0,
                    child: CameraPreview(controller),
                  )
                ],
              ),
            )));
  }
}
