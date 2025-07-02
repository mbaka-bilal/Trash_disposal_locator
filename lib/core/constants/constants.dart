/*
Created by: Mbaka bilal <mbakabilal.t@gmail.com>
Created on: 24,June,2025
Updated by: Mbaka bilal <mbakabilal.t@gmail.com>
Updated on: 24,June,2025
*/

import 'package:flutter/material.dart';

import '../../core/extensions/double_extensions.dart';

class AppConstants {
  //Spacers
  static final smallYSpace = 8.0.h;
  static final smallXSpace = 8.0.w;
  static final mediumYSpace = 16.0.h;
  static final mediumXSpace = 16.0.w;
  static final largeYSpace = 24.0.h;
  static final largeXSpace = 24.0.w;
  static final extraLargeYSpace = 32.0.h;
  static final extraLargeXSpace = 32.0.w;

  //keys
  static final rootNavigatorKey = GlobalKey<NavigatorState>();
  static const restorationScopeId = 'router';

  static const devBaseUrl = "http://192.168.0.4:5000/api";
  static const stagingBaseUrl =
      "https://trash-disposal-locator-api-open-source.onrender.com/api";
  static const productionBaseUrl =
      "https://trash-disposal-locator-api-open-source.onrender.com/api";
  static const mapBoxDirectionBaseUrl =
      "https://api.mapbox.com/directions/v5/mapbox";

  static const trashDisposalLocationsCacheKey = 'trash_disposal_locations';
}
