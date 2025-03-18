import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/category_grid.dart';

class CategoriesScreen extends StatelessWidget {
  final void Function(Meal meal) ontoggleFavorite;
  final List <Meal> availableMeals;
  const CategoriesScreen({super.key, required this.ontoggleFavorite, required this.availableMeals});

  void _selectCategory(BuildContext context, Category category) {
    final List<Meal> filteredMeals =
        availableMeals
            .where((meal) => meal.categories.contains(category.id))
            .toList();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (ctx) => MealsScreen(
              title: category.title,
              meals: filteredMeals,
              ontoggleFavorite: ontoggleFavorite,
            ),
      ),
    );
  }

  @override
  Widget build(context) {
    return GridView(
      padding: const EdgeInsets.all(15),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        crossAxisSpacing: 20,
        mainAxisSpacing: 10,
      ),
      children:
          availableCategories
              .map(
                (category) => CategoryGridItem(
                  category: category,
                  selectCategory: () {
                    _selectCategory(context, category);
                  },
                ),
              )
              .toList(),
    );
  }
}
