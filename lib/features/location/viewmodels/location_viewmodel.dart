/*
Created by: Mbaka bilal <mbakabilal.t@gmail.com>
Created on: 26,June,2025
Updated by: Mbaka bilal <mbakabilal.t@gmail.com>
Updated on: 26,June,2025
Description: This viewmodel handles location related action, such as 
getting user location, permission e.t.c
The location defaults to ikeja, lagos state, nigeria
*/

import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/basestate.dart';
import '../../../core/constants/strings.dart';
import '../../../core/errors/exception_handler.dart';
import '../../../core/errors/exceptions.dart';
import '../../../core/services/location_service.dart';
import '../domain/entities/location.dart';

typedef LocationState = BaseState<Loc>;

class LocationViewModel extends Notifier<LocationState> {
  LocationViewModel({required this.locationService});

  final LocationService locationService;

  @override
  LocationState build() {
    return LocationState.initial(data: const Loc());
  }

  Future<void> requestPermission() async {
    try {
      state = LocationState.loading(data: state.data);

      final status = await locationService.checkAndGrantPermission();

      if (status) {
        state = LocationState.success(state.data!);
      } else {
        throw LocationException(AppStrings.locationPermissionError);
      }
    } catch (e) {
      state = LocationState.error(
        AppExceptionHandler.handleException(e),
        data: state.data,
      );
    }
  }

  Future<bool> isPermissionGranted() async {
    final status = await locationService.isPermissionGranted();
    return status;
  }

  Future<void> getCurrentLocation(
    Function(double latitude, double longitude) onSuccess,
  ) async {
    try {
      state = LocationState.loading(data: state.data);

      final location = await locationService.getCurrentLocation();
      if (location != null) {
        state = LocationState.success(
          Loc(latitude: location.latitude, longitude: location.longitude),
        );

        onSuccess(location.latitude, location.longitude);
      }
    } catch (e) {
      //Do nothing
    }
  }
}
