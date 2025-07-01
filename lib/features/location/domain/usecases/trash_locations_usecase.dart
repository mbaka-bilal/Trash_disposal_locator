import '../../../../core/basestate.dart';
import '../../viewmodels/trash_locations_viewmodel.dart';
import '../repositories/trash_disposal_repository_impl.dart';
import '../../data/models/directions_model.dart';

class TrashLocationsUsecase {
  TrashLocationsUsecase({required this.trashDisposalRepository});

  final TrashDisposalRepositoryImpl trashDisposalRepository;

  Future<TrashDisposalLocationsState> fetchLocations() async {
    try {
      final remoteData = await trashDisposalRepository
          .fetchTrashDisposalLocations();

      return remoteData;
    } catch (e) {
      rethrow;
    }
  }

  Future<TrashDisposalLocationsState> fetchCachedLocations() async {
    try {
      final cachedData = await trashDisposalRepository
          .fetchCachedTrashDisposalLocations();

      return cachedData;
    } catch (e) {
      rethrow;
    }
  }

  Future<BaseState<DirectionsModel>> fetchDirections({
    required double originLng,
    required double originLat,
    required double destLng,
    required double destLat,
  }) async {
    try {
      return await trashDisposalRepository.fetchDirections(
        originLng: originLng,
        originLat: originLat,
        destLng: destLng,
        destLat: destLat,
      );
    } catch (e) {
      rethrow;
    }
  }
}
