import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import '../../../../keys.dart';

class MapScreen extends StatefulWidget {
  static const routeName = '/map';
  static const path = routeName;

  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: MapController(),
      options: MapOptions(),
      children: [TileLayer(urlTemplate: mapBoxTileUrl)],
    );
  }
}
