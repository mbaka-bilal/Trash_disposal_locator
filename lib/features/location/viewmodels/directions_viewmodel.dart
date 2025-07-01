import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/basestate.dart';
import '../data/models/directions_model.dart';
import '../domain/usecases/trash_locations_usecase.dart';

// State type for directions
typedef DirectionsState = BaseState<DirectionsModel>;

class DirectionsViewmodel extends Notifier<DirectionsState> {
  DirectionsViewmodel({required this.trashLocationsUsecase});

  final TrashLocationsUsecase trashLocationsUsecase;
  // final List<DirectionsModel> _directions = [];

  @override
  DirectionsState build() {
    return DirectionsState.initial();
  }

  Future<void> fetchAndAddDirection({
    required double originLng,
    required double originLat,
    required double destLng,
    required double destLat,
  }) async {
    try {
      state = DirectionsState.loading(data: state.data);

      final direction = await trashLocationsUsecase.fetchDirections(
        originLng: originLng,
        originLat: originLat,
        destLng: destLng,
        destLat: destLat,
      );

      // _directions.add(direction.data!);
      // state = DirectionsState.success(List<DirectionsModel>.from(_directions));
      // _removeFirstIfLimitReached();

      state = DirectionsState.success(direction.data!);
    } catch (e) {
      state = DirectionsState.error(e.toString(), data: state.data);
    }
  }

  // void _removeFirstIfLimitReached() {
  //   if (_directions.length == 5) {
  //     _directions.removeAt(0);
  //     state = DirectionsState.success(List<DirectionsModel>.from(_directions));
  //   }
  // }

  // Optionally expose the current list
  // List<DirectionsModel> get directions => List.unmodifiable(_directions);
}
