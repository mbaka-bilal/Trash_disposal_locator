import '../../../../core/basestate.dart';
import '../../viewmodels/trash_locations_viewmodel.dart';
import '../../data/models/directions_model.dart';

abstract class TrashDisposalRepository {
  Future<TrashDisposalLocationsState> fetchTrashDisposalLocations();

  Future<TrashDisposalLocationsState> fetchCachedTrashDisposalLocations();

  Future<BaseState<DirectionsModel>> fetchDirections({
    required double originLng,
    required double originLat,
    required double destLng,
    required double destLat,
  });
}
