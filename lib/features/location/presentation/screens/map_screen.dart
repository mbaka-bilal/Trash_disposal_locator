/*
Created by: Mbaka bilal <mbakabilal.t@gmail.com>
Created on: 23,June,2025
Updated by: Mbaka bilal <mbakabilal.t@gmail.com>
Updated on: 26,June,2025
Description: Map screen
*/

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:latlong2/latlong.dart';
import 'package:myapp/core/extensions/integer_extensions.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/constants/strings.dart';
import '../../../../core/helpers/helpers.dart';
import '../../../../core/styling/colors.dart';
import '../../../../core/styling/text_style.dart';
import '../../../../keys.dart';
import '../../../widgets/app_text_field.dart';
import '../widgets/map_zoom._button.dart';

class MapScreen extends StatefulWidget {
  static const routeName = '/map';
  static const path = routeName;

  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapController _mapController = MapController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _map(),
          if (AppHelpers.isWeb(context))
            GestureDetector(
              onTap: () {
                //TODO open app stores
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                margin: EdgeInsets.only(left: 10, top: 20),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.phone_android),
                    5.w,
                    AppTextField(
                      text: "Get the app",
                      textStyle: AppTextStyle(
                        context: context,
                        fontSize: 12,
                      ).fw700(),
                    ),
                  ],
                ),
              ),
            ),
          Align(
            alignment: Alignment.bottomRight,
            child: MapZoomButton(mapController: _mapController),
          ),
        ],
      ),
    );
  }

  Widget _map() {
    return FlutterMap(
      mapController: _mapController,
      options: MapOptions(
        initialCenter: const LatLng(6.6018, 3.3515),
        initialZoom: 13.0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      children: [
        TileLayer(
          urlTemplate: mapBoxTileUrl,
          tileProvider: CancellableNetworkTileProvider(),
        ),
        RichAttributionWidget(
          attributions: [
            TextSourceAttribution(
              AppStrings.mapbox,
              onTap: () => {
                //TODO open map box website
              },
            ),
          ],
        ),
      ],
    );
  }
}
