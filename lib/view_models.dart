import 'package:myapp/features/location/domain/usecases/trash_locations_usecase.dart'
    show TrashLocationsUsecase;
import 'package:riverpod/riverpod.dart';

import 'core/services/location_service.dart';
import 'features/location/domain/repositories/trash_disposal_repository_impl.dart';
import 'features/location/viewmodels/location_viewmodel.dart';
import 'features/location/viewmodels/trash_locations_viewmodel.dart';

final locationViewModel = NotifierProvider<LocationViewModel, LocationState>(
  () => LocationViewModel(locationService: LocationService()),
);
final trashDisposalLocationsViewModel =
    NotifierProvider<
      TrashDisposalLocationsViewmodel,
      TrashDisposalLocationsState
    >(
      () => TrashDisposalLocationsViewmodel(
        trashLocationsUsecase: TrashLocationsUsecase(
          trashDisposalRepository: TrashDisposalRepositoryImpl(),
        ),
      ),
    );
