import '../../data/datasources/disposal_location_local_data_source.dart';
import '../../data/datasources/disposal_location_remote_data_source.dart';
import '../../data/models/trash_disposal_locations_model.dart';
import '../../viewmodels/trash_locations_viewmodel.dart';
import 'trash_disposal_repository.dart';

class TrashDisposalRepositoryImpl implements TrashDisposalRepository {
  TrashDisposalRepositoryImpl();

  final DisposalLocationLocalDataSource _disposalLocationLocalDataSource =
      DisposalLocationLocalDataSource();
  final DisposalLocationRemoteDataSource _disposalLocationRemoteDataSource =
      DisposalLocationRemoteDataSource();

  @override
  Future<TrashDisposalLocationsState> fetchTrashDisposalLocations() async {
    try {
      final remoteData = await _disposalLocationRemoteDataSource
          .fetchTrashDisposalLocations();

      await _cacheTrashDisposalLocations(remoteData.data!);

      return remoteData;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<TrashDisposalLocationsState>
  fetchCachedTrashDisposalLocations() async {
    final localData = await _disposalLocationLocalDataSource
        .getCachedTrashDisposalLocations();

    return TrashDisposalLocationsState.success(localData);
  }

  Future<void> _cacheTrashDisposalLocations(
    List<DisposalLocation> locations,
  ) async {
    await _disposalLocationLocalDataSource.cacheTrashDisposalLocations(
      locations,
    );
  }
}
