import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/meals_provider.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier() : super(kInitialFilters);

  void setFilters(Map<Filter, bool> filters) {
    state = filters;
  }

  void setFilter(Filter filter, bool isActive) {
    state = {
      ...state,
      filter: isActive, // override the respective old key-value pair
    };
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
      (ref) => FiltersNotifier(),
    );

final filteredMealsProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final activeFilters = ref.watch(filtersProvider);
  return meals.where((meals) {
    if (activeFilters[Filter.glutenFree]! && !meals.isGlutenFree) {
      return false;
    }
    if (activeFilters[Filter.lactoseFree]! && !meals.isLactoseFree) {
      return false;
    }
    if (activeFilters[Filter.vegetarian]! && !meals.isVegetarian) {
      return false;
    }
    if (activeFilters[Filter.vegan]! && !meals.isVegan) {
      return false;
    }
    return true;
  }).toList();
});
