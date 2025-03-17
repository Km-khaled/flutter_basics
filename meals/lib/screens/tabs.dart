import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreemState();
}

class _TabsScreemState extends State<TabsScreen> {
  int _selectedPageIndex = 0;

  final List<Meal> _favoriteMeals = [];

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  void _toggleMealFavoriteStatus(Meal meal) {
    final isExisting = _favoriteMeals.contains(meal);
    if (isExisting) {
      setState(() {
        _favoriteMeals.remove(meal);
        _showInfoMessage("Removed from Favorites!");
      });
    } else {
      setState(() {
        _favoriteMeals.add(meal);
        _showInfoMessage("Added to Favorites!");
      });
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.pop(context);

    if (identifier == "filters") {
      final result = await Navigator.push<Map<Filter, bool>>(
        context,
        MaterialPageRoute(builder: (ctx) => FiltersScreen()),
      );

      print(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage =
        _selectedPageIndex == 0
            ? CategoriesScreen(ontoggleFavorite: _toggleMealFavoriteStatus)
            : MealsScreen(
              ontoggleFavorite: _toggleMealFavoriteStatus,
              meals: _favoriteMeals,
            );

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
