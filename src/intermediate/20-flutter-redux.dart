import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
// redux: ^4.0.0+3
// flutter_redux: ^0.7.0

enum Actions { Increment, Decrement }

int reducer(int state, dynamic action) {
  if (action == Actions.Increment) state++;
  if (action == Actions.Decrement) state--;
  return state;
}

void main() {
  final store = Store<int>(reducer, initialState: 0);
  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  MyApp({Key key, this.store});
  final Store<int> store;

  @override
  Widget build(BuildContext context) {
    return StoreProvider<int>(
        store: store,
        child: MaterialApp(
            title: 'Flutter redux',
            home: Scaffold(
              appBar: AppBar(title: Text('Flutter Redux')),
              body: Container(
                  child: Center(
                child: Column(
                  children: [
                    StoreConnector<int, String>(
                        builder: (context, count) {
                          return Text(count, style: TextStyle(fontSize: 24.0));
                        },
                        converter: (store) => store.state.toString()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () => store.dispatch(Actions.Increment)),
                        IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () => store.dispatch(Actions.Decrement)),
                      ],
                    )
                  ],
                ),
              )),
            )));
  }
}
