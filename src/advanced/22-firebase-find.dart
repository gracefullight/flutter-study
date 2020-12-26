Future<String> findData(String user, String key) async {
  DatabaseReference messageRef;
  messageRef = FirebaseDatabase.instance.reference().child('messages/$user');
  String value;
  Query query = messageRef.equalTo(value, key: key);
  DataSnapshot snapshot = await query.once();
  value = snapshot.value.toString();

  return value;
}

Future<String> findRange(String user, String key) async {
  DatabaseReference messageRef;
  messageRef = FirebaseDatabase.instance.reference().child('messages/$user');
  String value;
  Query query = messageRef.endAt(value, key: key);
  DataSnapshot snapshot = await query.once();
  value = snapshot.value.toString();

  return value;
}
