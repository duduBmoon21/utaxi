import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('OSM Flutter Example'),
        ),
        body: OSMFlutter(
          controller: MapController(
    
            initPosition: GeoPoint(
              latitude: 37.7749,
              longitude: -122.4194,
            ),
          ),
          trackMyPosition: false,
          initZoom: 10.0,
          minZoomLevel: 2,
          maxZoomLevel: 18, osmOption: null,
        ),
      ),
    );
  }
}
