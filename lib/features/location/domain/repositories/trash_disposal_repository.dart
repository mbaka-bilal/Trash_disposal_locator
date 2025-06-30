import '../../viewmodels/trash_locations_viewmodel.dart';

abstract class TrashDisposalRepository {
  Future<TrashDisposalLocationsState> fetchTrashDisposalLocations();

  Future<TrashDisposalLocationsState> fetchCachedTrashDisposalLocations();
}