import '../../../../core/enums/state_enum.dart';
import '../../../../core/services/api_service.dart';
import '../../../../data_source/entities/response_model.dart';
import '../../viewmodels/trash_locations_viewmodel.dart';
import '../models/trash_disposal_locations_model.dart';

class DisposalLocationRemoteDataSource {
  DisposalLocationRemoteDataSource();

  final ApiService _apiService = ApiService();

  Future<TrashDisposalLocationsState> fetchTrashDisposalLocations() async {
    try {
      final response = await _apiService.get('/trash-disposal-locations');

      final responseModel = ResponseModel.fromJson(response.data);

      return TrashDisposalLocationsState(
        status: Status.success,
        data: List<DisposalLocation>.from(
          responseModel.data.map((e) => DisposalLocation.fromJson(e)),
        ),
      );
    } catch (e) {
      rethrow;
    }
  }
}
