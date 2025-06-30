import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapHelpers {
  static void moveCameraToLocation(
    MapController mapController,
    double latitude,
    double longitude, {
    double? zoom,
  }) {
    final zoomValue = zoom ?? mapController.camera.zoom;
    final position = LatLng(latitude, longitude);

    mapController.move(position, zoomValue);
  }
}
