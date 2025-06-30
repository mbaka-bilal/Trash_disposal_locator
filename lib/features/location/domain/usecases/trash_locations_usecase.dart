import '../../viewmodels/trash_locations_viewmodel.dart';
import '../repositories/trash_disposal_repository_impl.dart';

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
      final cachedData = await trashDisposalRepository.fetchCachedTrashDisposalLocations();

      return cachedData;
    } catch (e) {
      rethrow;
    }
  }
}
