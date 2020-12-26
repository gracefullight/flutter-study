import 'package:firebase_database/firebase_database.dart';

int counter;
DatabaseReference counterRef;
DatabaseError error;

void init(FirebaseDatabase database) async {
  counterRef = FirebaseDatabase.instance.reference().child('test/counter');
  counterRef.keepSynced(true);
  database.setPersistenceEnabled(true);
  database.setPersistenceCacheSizeBytes(10000000);
}

Future<int> getCounter() async {
  int value;
  DataSnapshot snapshot = await counterRef.once();
  print('Connected to the database and read ${snapshot.value}');
  value = snapshot.value;
  return value;
}

Future<Null> setCounter(int value) async {
  final TransactionResult transactionResult =
      await counterRef.runTransaction((MutableData mutableData) async {
    mutableData.value = value;
    return mutableData;
  });

  if (transactionResult.committed) {
    print('Saved value to the database');
  } else {
    print('Failed to save to the database');
    if (transactionResult.error != null) {
      print(transactionResult.error.message);
    }
  }
}

Future<Null> addData(String user) async {
  DatabaseReference messageRef;
  messageRef = FirebaseDatabase.instance.reference().child('messages/$user');

  for (int i = 0; i < 20; i++) {
    messageRef
        .update(<String, String>{'Key${i.toString()}': 'Body ${i.toString()}'});
  }
}

Future<Null> removeData(String user) async {
  DatabaseReference messageRef;
  messageRef = FirebaseDatabase.instance.reference().child('messages/$user');
  await messageRef.remove();
}

Future<Null> setData(String user, String key, String value) async {
  DatabaseReference messageRef;
  messageRef = FirebaseDatabase.instance.reference().child('messages/$user');
  messageRef.set(<String, String>{key: value});
}

Future<Null> updateData(String user, String key, String value) async {
  DatabaseReference messageRef;
  messageRef = FirebaseDatabase.instance.reference().child('messages/$user');
  messageRef.update(<String, String>{key: value});
}
