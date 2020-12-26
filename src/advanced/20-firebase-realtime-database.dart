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

/** main
void _initDatabase() async {
    await fb_database.init(database);
    _counterSubscription = fb_database.counterRef.onValue.listen((Event event) {
      setState(() {
        fb_database.error = null;
        fb_database.counter = event.snapshot.value ?? 0;
      });
    }, onError: (Object o) {
      final DatabaseError error = o;
      setState(() {
        fb_database.error = error;
      });
    });
  }
*/
