import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/basestate.dart';
import '../../../core/errors/exception_handler.dart';
import '../data/models/trash_disposal_locations_model.dart';
import '../domain/usecases/trash_locations_usecase.dart';

typedef TrashDisposalLocationsState = BaseState<List<DisposalLocation>>;

class TrashDisposalLocationsViewmodel
    extends Notifier<TrashDisposalLocationsState> {
  TrashDisposalLocationsViewmodel({required this.trashLocationsUsecase});

  TrashLocationsUsecase trashLocationsUsecase;

  @override
  build() {
    trashLocationsUsecase.fetchCachedLocations().then((locations) {
      state = locations;
    });

    return TrashDisposalLocationsState.initial();
  }

  Future<void> fetchLocations() async {
    try {
      state = TrashDisposalLocationsState.loading();
      final locations = await trashLocationsUsecase.fetchLocations();
      state = locations;
    } catch (e) {
      final message = AppExceptionHandler.handleException(e);
      state = TrashDisposalLocationsState.error(message);
      await Future.delayed(const Duration(seconds: 10));
      await fetchLocations();
    }
  }
}
