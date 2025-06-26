import 'package:riverpod/riverpod.dart';

import 'core/services/location_service.dart';
import 'features/location/viewmodels/location_viewmodel.dart';

final locationViewModel = NotifierProvider<LocationViewModel, LocationState>(
  () => LocationViewModel(locationService: LocationService()),
);
