import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meal_details.dart';
import 'package:meals/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  final List<Meal> meals;
  final String? title;
  final void Function(Meal meal) ontoggleFavorite;

  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
    required this.ontoggleFavorite,
  });

  void selectMeal(BuildContext context, Meal meal) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (ctx) => MealDetailsScreen(
              meal: meal,
              ontoggleFavorite: ontoggleFavorite,
            ),
      ),
    );
  }

  @override
  Widget build(context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Uh oh ...nothing here!",
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            " Try selecting  a different Category!",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder:
            (context, index) => MealItem(
              meal: meals[index],
              selectMeal: (meal) {
                selectMeal(context, meals[index]);
              },
            ),
      );
    }

    if (title == null) return content;

    return Scaffold(appBar: AppBar(title: Text(title!)), body: content);
  }
}
