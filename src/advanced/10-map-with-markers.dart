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
  @override
  Widget build(BuildContext context) {
    var markers = <Marker>[
      Marker(
          width: 80.0,
          height: 80.0,
          point: LatLng(37.265310, 127.023168),
          builder: (context) => Icon(
                Icons.pin_drop,
                color: Colors.red,
              )),
      Marker(
          width: 80.0,
          height: 80.0,
          point: LatLng(37.245310, 127.003168),
          builder: (context) => Icon(
                Icons.pin_drop,
                color: Colors.red,
              )),
      Marker(
          width: 80.0,
          height: 80.0,
          point: LatLng(37.225310, 127.043168),
          builder: (context) => Icon(
                Icons.pin_drop,
                color: Colors.red,
              ))
    ];
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
