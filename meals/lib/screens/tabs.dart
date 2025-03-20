import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/filters_provider.dart';
import 'package:meals/providers/meals_provider.dart';
import 'package:meals/providers/favorites_provider.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/main_drawer.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreemState();
}

class _TabsScreemState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.pop(context);

    if (identifier == "filters") {
      await Navigator.push<Map<Filter, bool>>(
        context,
        MaterialPageRoute(builder: (ctx) => const FiltersScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsProvider);
    final activeFilter = ref.watch(filtersProvider);
    final availableMeals =
        meals.where((meals) {
          if (activeFilter[Filter.glutenFree]! && !meals.isGlutenFree) {
            return false;
          }
          if (activeFilter[Filter.lactoseFree]! && !meals.isLactoseFree) {
            return false;
          }
          if (activeFilter[Filter.vegetarian]! && !meals.isVegetarian) {
            return false;
          }
          if (activeFilter[Filter.vegan]! && !meals.isVegan) {
            return false;
          }
          return true;
        }).toList();

    final favoriteMeals = ref.watch(favoritesMealsProvider);

    Widget activePage =
        _selectedPageIndex == 0
            ? CategoriesScreen(availableMeals: availableMeals)
            : MealsScreen(meals: favoriteMeals);

    var activePageTitle =
        _selectedPageIndex == 0 ? "Categories" : "Your Favorites";

    return Scaffold(
      appBar: AppBar(title: Text(activePageTitle)),
      drawer: MainDrawer(onSelectScreen: _setScreen),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: "Categories",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorites"),
        ],
      ),
    );
  }
}
