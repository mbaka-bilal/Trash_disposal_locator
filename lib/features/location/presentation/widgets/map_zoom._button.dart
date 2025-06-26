/*
Created by: Mbaka bilal <mbakabilal.t@gmail.com>
Created on: 23,June,2025
Updated by: Mbaka bilal <mbakabilal.t@gmail.com>
Updated on: 26,June,2025
Description: Map screen
*/

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import '../../../../core/styling/colors.dart';

class MapZoomButton extends StatelessWidget {
  const MapZoomButton({super.key, required this.mapController});

  final MapController mapController;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        decoration: BoxDecoration(color: AppColors.white),
        padding: EdgeInsets.all(2),
        margin: EdgeInsets.only(right: 20, bottom: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () => zoomInOut(zoomIn: true),
              child: const Icon(Icons.add),
            ),
            Divider(),
            GestureDetector(
              onTap: () => zoomInOut(zoomIn: false),
              child: const Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }

  void zoomInOut({required bool zoomIn}) {
    final zoom = zoomIn
        ? mapController.camera.zoom + 1
        : mapController.camera.zoom - 1;

    final position = mapController.camera.focusedZoomCenter(Offset.zero, zoom);
    mapController.move(position, zoom);
  }
}
