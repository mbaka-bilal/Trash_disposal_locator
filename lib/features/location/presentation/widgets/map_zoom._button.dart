/*
Created by: Mbaka bilal <mbakabilal.t@gmail.com>
Created on: 23,June,2025
Updated by: Mbaka bilal <mbakabilal.t@gmail.com>
Updated on: 26,June,2025
Description: Map screen
*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/helpers/map_helpers.dart';
import '../../../../core/styling/colors.dart';
import '../../../../view_models.dart';

class MapZoomButton extends ConsumerWidget {
  const MapZoomButton({super.key, required this.mapController});

  final MapController mapController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IntrinsicWidth(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Consumer(
            builder: (context, state, child) {
              final isLoading = ref.watch(locationViewModel).isLoading;

              return GestureDetector(
                onTap: () {
                  if (isLoading) return;

                  ref.read(locationViewModel.notifier).getCurrentLocation((
                    double latitude,
                    double longitude,
                  ) {
                    MapHelpers.moveCameraToLocation(
                      mapController,
                      latitude,
                      longitude,
                    );
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(right: 15),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.all(8),
                  child: isLoading
                      ? const CupertinoActivityIndicator(color: AppColors.black)
                      : Icon(Icons.my_location, size: 15),
                ),
              );
            },
          ),
          AppConstants.smallYSpace,

          Container(
            decoration: BoxDecoration(color: AppColors.white),
            padding: EdgeInsets.all(2),
            margin: EdgeInsets.only(right: 15, bottom: 50),
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
        ],
      ),
    );
  }

  void zoomInOut({required bool zoomIn}) {
    final zoom = zoomIn
        ? mapController.camera.zoom + 1
        : mapController.camera.zoom - 1;

    final position = mapController.camera.focusedZoomCenter(Offset.zero, zoom);

    MapHelpers.moveCameraToLocation(
      mapController,
      position.latitude,
      position.longitude,
      zoom: zoom,
    );
  }
}
