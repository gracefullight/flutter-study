import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

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
  String status;
  Permission permission;

  @override
  void initState() {
    super.initState();
    status = 'Select an item';
    print(Permission.values);
  }

  requestPermission() async {
    final _result = await permission.request();
    print('Permission result is ${_result.toString()}');

    setState(() {
      status = '${permission.toString()} = ${_result.toString()}';
    });
  }

  checkPermission() async {
    final _result = await permission.status;
    print('Permission result is ${_result.toString()}');

    setState(() {
      status = '${permission.toString()} = ${_result.toString()}';
    });
  }

  getPermissionStatus() async {
    final _result = await permission.status;
    print('Permission result is ${_result.toString()}');

    setState(() {
      status = '${permission.toString()} = ${_result.toString()}';
    });
  }

  onDropDownChanged(Permission permission) {
    setState(() {
      this.permission = permission;
      status = 'Click a button below';
    });
    print(permission);
  }

  List<DropdownMenuItem<Permission>> _getDropDownItems() {
    List<DropdownMenuItem<Permission>> items = List();
    Permission.values.forEach((permission) {
      var item = DropdownMenuItem(
        child: Text(permission.toString()),
        value: permission,
      );

      items.add(item);
    });

    return items;
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
                  Text(status),
                  DropdownButton(
                      items: _getDropDownItems(),
                      value: permission,
                      onChanged: onDropDownChanged),
                  RaisedButton(
                    onPressed: checkPermission,
                    child: Text('Check Permission'),
                  ),
                  RaisedButton(
                    onPressed: requestPermission,
                    child: Text('Request Permission'),
                  ),
                  RaisedButton(
                    onPressed: getPermissionStatus,
                    child: Text('Get Status'),
                  ),
                  RaisedButton(
                    onPressed: openAppSettings,
                    child: Text('Open Settings'),
                  )
                ],
              ),
            )));
  }
}
