import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

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
  MapController mapController;
  Map<String, LatLng> coords;
  List<Marker> markers;

  @override
  void initState() {
    super.initState();
    mapController = MapController();

    coords = Map();
    coords.putIfAbsent("Chicago", () => LatLng(41.8781, -87.6298));
    coords.putIfAbsent("Detroit", () => LatLng(42.3314, -83.0458));
    coords.putIfAbsent("Lansing", () => LatLng(42.7325, -84.5555));

    markers = List<Marker>();
    for (int i = 0; i < coords.length; i++) {
      markers.add(Marker(
          width: 80.0,
          height: 80.0,
          point: coords.values.elementAt(i),
          builder: (ctx) => Icon(Icons.pin_drop, color: Colors.red)));
    }
  }

  void _showCoord(int index) {
    mapController.move(coords.values.elementAt(index), 10);
  }

  List<Widget> _makeButtons() {
    List<Widget> list = List();

    for (int i = 0; i < coords.length; i++) {
      list.add(RaisedButton(
        onPressed: () => _showCoord(i),
        child: Text(coords.keys.elementAt(i)),
      ));
    }

    return list;
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
                  Row(children: _makeButtons()),
                  Flexible(
                    child: FlutterMap(
                      mapController: mapController,
                      options: MapOptions(
                          center: LatLng(37.265310, 127.023168), zoom: 5.0),
                      layers: [
                        TileLayerOptions(
                            urlTemplate:
                                'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                            subdomains: ['a', 'b', 'c']),
                        MarkerLayerOptions(markers: markers)
                      ],
                    ),
                  )
                ],
              ),
            )));
  }
}
