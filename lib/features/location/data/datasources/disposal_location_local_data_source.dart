import 'dart:convert';

import '../../../../core/constants/constants.dart';
import '../../../../core/services/shared_prefs_service.dart';
import '../models/trash_disposal_locations_model.dart';

class DisposalLocationLocalDataSource {
  DisposalLocationLocalDataSource();

  final SharedPrefsService _sharedPreferences = SharedPrefsService();

  Future<void> cacheTrashDisposalLocations(
    List<DisposalLocation> locations,
  ) async {
    try {
      final cachedData = await getCachedTrashDisposalLocations();

      final deDuplicatedLocations = locations
          .where((element) => !cachedData.contains(element))
          .toList();

      final newLocations = [...cachedData, ...deDuplicatedLocations];

      await _sharedPreferences.setValue(
        AppConstants.trashDisposalLocationsCacheKey,
        newLocations.map((e) => jsonEncode(e.toJson())).toList(),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<List<DisposalLocation>> getCachedTrashDisposalLocations() async {
    try {
      final jsonString = await _sharedPreferences.fetchValue<List<String>>(
        AppConstants.trashDisposalLocationsCacheKey,
      );

      if (jsonString == null) {
        return [];
      }
      return List<DisposalLocation>.from(
        jsonString.map((e) => DisposalLocation.fromJson(jsonDecode(e))),
      );
    } catch (e) {
      rethrow;
    }
  }
}
