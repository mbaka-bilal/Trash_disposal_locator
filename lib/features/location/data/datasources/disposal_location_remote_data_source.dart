import '../../../../core/basestate.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/enums/state_enum.dart';
import '../../../../core/services/api_service.dart';
import '../../../../data_source/entities/response_model.dart';
import '../../../../keys.dart';
import '../../viewmodels/trash_locations_viewmodel.dart';
import '../models/trash_disposal_locations_model.dart';
import '../models/directions_model.dart';

class DisposalLocationRemoteDataSource {
  DisposalLocationRemoteDataSource();

  final ApiService _apiService = ApiService();

  Future<TrashDisposalLocationsState> fetchTrashDisposalLocations() async {
    try {
      final response = await _apiService.get('/disposal-locations');

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

  Future<BaseState<DirectionsModel>> fetchDirections({
    required double originLng,
    required double originLat,
    required double destLng,
    required double destLat,
  }) async {
    try {
      final url =
          '${AppConstants.mapBoxDirectionBaseUrl}/driving/$originLng,$originLat;$destLng,$destLat?access_token=$mapBoxPublicKey';

      final response = await _apiService.get(url);

      return BaseState(
        status: Status.success,
        data: DirectionsModel.fromJson(response.data),
        message: "Directions fetched successfully",
      );
    } catch (e) {
      rethrow;
    }
  }
}
