/*
Created by: Mbaka bilal <mbakabilal.t@gmail.com>
Created on: 23,June,2025
Updated by: Mbaka bilal <mbakabilal.t@gmail.com>
Updated on: 01,July,2025
Description: Map screen
*/

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:myapp/core/extensions/integer_extensions.dart';

import '../../../../core/constants/strings.dart';
import '../../../../core/helpers/dialog_helpers.dart';
import '../../../../core/helpers/helpers.dart';
import '../../../../core/styling/colors.dart';
import '../../../../core/styling/images.dart';
import '../../../../core/styling/text_style.dart';
import '../../../../keys.dart';
import '../../../../view_models.dart';
import '../../../widgets/app_text_field.dart';
import '../../../widgets/media/image_view.dart';
import '../../data/models/directions_model.dart';
import '../../data/models/trash_disposal_locations_model.dart';
import '../../domain/entities/location.dart';
import '../widgets/disposal_info.dart';
import '../widgets/map_zoom._button.dart';

class MapScreen extends ConsumerStatefulWidget {
  static const routeName = '/map';
  static const path = routeName;

  const MapScreen({super.key});

  @override
  ConsumerState<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends ConsumerState<MapScreen> {
  final MapController _mapController = MapController();

  bool _moveCameraToLocation = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(locationViewModel.notifier).requestPermission();

      // ref.read(locationViewModel.notifier).getCurrentLocation((
      //   double latitude,
      //   double longitude,
      // ) {
      //   MapHelpers.moveCameraToLocation(_mapController, latitude, longitude);
      // });
    });
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(locationViewModel, (previous, next) {
      if (previous?.data?.latitude != next.data?.latitude &&
          previous?.data?.longitude != next.data?.longitude &&
          _moveCameraToLocation) {}
    });

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
                        color: AppColors.black,
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
    return Consumer(
      builder: (context, ref, child) {
        final location = ref.watch(locationViewModel).data;
        final trashLocationsState = ref.watch(trashDisposalLocationsViewModel);
        final directionsState = ref.watch(directionsViewModel);
        final trashLocations = trashLocationsState.data ?? <DisposalLocation>[];
        final polylines = List<List<LatLng>>.from(
          directionsState.data == null
              ? const []
              : directionsState.data!.routes.map((e) => e.polyline).toList(),
        );

        return Stack(
          children: [
            FlutterMap(
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
                MarkerLayer(
                  markers: [
                    if (location != null)
                      Marker(
                        point: LatLng(location.latitude, location.longitude),
                        child: ImageView(image: AppImages.circle),
                      ),

                    ...trashLocations.map(
                      (e) => Marker(
                        point: LatLng(e.location!.lat!, e.location!.lng!),
                        child: GestureDetector(
                          onTap: () => _onTapMarker(context, location, e),
                          child: ImageView(
                            image: AppImages.garbage,
                            width: 50,
                            height: 50,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                PolylineLayer(
                  polylines: polylines.map((e) => Polyline(points: e)).toList(),
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
            ),
            if (trashLocationsState.isLoading || directionsState.isLoading)
              Align(
                alignment: Alignment.bottomCenter,
                child: LinearProgressIndicator(
                  color: AppColors.ladingPageGradientBlue,
                ),
              ),
          ],
        );
      },
    );
  }

  void _onTapMarker(BuildContext context, Loc? location, DisposalLocation e) {
    if (location != null) {
      ref
          .read(directionsViewModel.notifier)
          .fetchAndAddDirection(
            originLng: location.longitude,
            originLat: location.latitude,
            destLng: e.location!.lng!,
            destLat: e.location!.lat!,
          );
    }

    DialogHelpers.showAppDialog(
      context: context,
      child: DisposalInfo(disposalLocation: e),
    );
  }
}
