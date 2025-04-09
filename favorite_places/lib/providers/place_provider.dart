import 'package:favorite_places/models/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesNotifier extends StateNotifier<List<Place>> {
  PlacesNotifier() : super(const []);
  void toggleplaces(place) {
    final isExisting = state.contains(place);
    if (isExisting) {
      state = state.where((p) => p.title != place.title).toList();
    } else {
      state = [...state, place];
    }
  }
}

final placesProvider = StateNotifierProvider<PlacesNotifier, List<Place>>(
  (ref) => PlacesNotifier(),
);
