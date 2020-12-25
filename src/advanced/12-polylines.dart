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
  List<LatLng> points;
  MapController mapController;
  List<Marker> markers;

  @override
  void initState() {
    super.initState();
    mapController = MapController();
    points = List<LatLng>();
    points.add(LatLng(41.8781, -87.6298));
    points.add(LatLng(42.3314, -83.0458));
    points.add(LatLng(42.7325, -84.5555));

    markers = List<Marker>();
    for (int i = 0; i < points.length; i++) {
      markers.add(Marker(
          width: 80.0,
          height: 80.0,
          point: points[i],
          builder: (ctx) => Icon(Icons.pin_drop, color: Colors.red)));
    }
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
                        MarkerLayerOptions(markers: markers),
                        PolylineLayerOptions(polylines: [
                          Polyline(
                              points: points,
                              strokeWidth: 4.0,
                              color: Colors.purple)
                        ])
                      ],
                    ),
                  )
                ],
              ),
            )));
  }
}
