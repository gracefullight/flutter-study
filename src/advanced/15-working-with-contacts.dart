import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:contacts_service/contacts_service.dart';

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
  // main 에서 비동기 실행시 필수
  WidgetsFlutterBinding.ensureInitialized();
  print(Permission.values);
  await permissionFromString('Permission.contacts').request();
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  void _create() async {
    Contact contact = Contact(
        familyName: 'Carins',
        givenName: 'Bryan',
        emails: [Item(label: 'work', value: 'bryan@gmail.com')]);

    await ContactsService.addContact(contact);
    showInSnackbar('Create contact');
  }

  void _find() async {
    Iterable<Contact> people =
        await ContactsService.getContacts(query: 'Bryan');
    showInSnackbar('There are ${people.length} people named Bryan');
  }

  void _read() async {
    Iterable<Contact> people =
        await ContactsService.getContacts(query: 'Bryan');
    Contact contact = people.first;
    showInSnackbar('Bryan email is ${contact.emails.first.value}');
  }

  void _delete() async {
    Iterable<Contact> people =
        await ContactsService.getContacts(query: 'Bryan');
    Contact contact = people.first;
    await ContactsService.deleteContact(contact);
  }

  void showInSnackbar(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(message),
    ));
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
                  Text('Contacts'),
                  RaisedButton(onPressed: _create, child: Text('Create')),
                  RaisedButton(onPressed: _find, child: Text('Find')),
                  RaisedButton(onPressed: _read, child: Text('Read')),
                  RaisedButton(onPressed: _delete, child: Text('Delete')),
                  RaisedButton(
                      onPressed: openAppSettings, child: Text('Permissions')),
                ],
              ),
            )));
  }
}
