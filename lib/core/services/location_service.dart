/*
Created by: Mbaka bilal <mbakabilal.t@gmail.com>
Created on: 26,June,2025
Updated by: Mbaka bilal <mbakabilal.t@gmail.com>
Updated on: 26,June,2025
Description: Service handling location related actions
*/

import 'dart:async';

import 'package:geolocator/geolocator.dart';

import '../constants/strings.dart';
import '../errors/exceptions.dart';
import '../helpers/helpers.dart';

class LocationService {
  Future<Position?> getLastKnownLocation() async {
    try {
      final location = await Geolocator.getLastKnownPosition();
      return location;
    } catch (e) {
      const message = AppStrings.lastKnownLocationError;
      AppHelpers.printToLog(message: "$message $e");
      throw LocationException(e, message: message);
    }
  }

  Future<Position?> getCurrentLocation() async {
    try {
      final location = await Geolocator.getCurrentPosition(
        locationSettings: LocationSettings(accuracy: LocationAccuracy.medium),
      );
      return location;
    } catch (e) {
      const message = AppStrings.currentLocationError;
      AppHelpers.printToLog(message: "$message $e");
      throw LocationException(e, message: message);
    }
  }

  Future<bool> isPermissionGranted() async {
    try {
      final status = await Geolocator.checkPermission();

      return status == LocationPermission.always ||
          status == LocationPermission.whileInUse;
    } catch (e) {
      return false;
    }
  }

  Future<bool> checkAndGrantPermission() async {
    try {
      final status = await Geolocator.checkPermission();

      if (status == LocationPermission.denied) {
        final status = await Geolocator.requestPermission();
        if (status == LocationPermission.always ||
            status == LocationPermission.whileInUse) {
          return true;
        } else {
          return false;
        }
      } else if (status == LocationPermission.deniedForever) {
        bool status = false;
        status = await Geolocator.openAppSettings();
        if (!status) {
          status = await Geolocator.openLocationSettings();
        }
        return status;
      } else {
        //granted
        return true;
      }
    } catch (e) {
      final message = AppStrings.locationPermissionError;

      AppHelpers.printToLog(message: "$message $e");

      throw LocationException(e, message: message);
    }
  }

  static double distanceInKm({
    required double sourceLatitude,
    required double sourceLongitude,
    required double destinationLatitude,
    required double destinationLongitude,
  }) {
    final distance = Geolocator.distanceBetween(
      sourceLatitude,
      sourceLongitude,
      destinationLatitude,
      destinationLongitude,
    );

    return distance / 1000;
  }
}
