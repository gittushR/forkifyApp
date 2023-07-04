import 'package:flutter/material.dart';
import 'package:forkify/models/meal.dart';
import 'package:forkify/widgets/mealItem/meal_item.dart';
import 'package:forkify/screens/meal_details_screen.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(
      {this.title,
      required this.meals,
      super.key,
      required this.onToggleFavorite});
  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) onToggleFavorite;
  void onSelectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetails(
          meal: meal,
          onToggleFavorite: onToggleFavorite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (ctx, index) => MealItem(
          meal: meals[index],
          onSelectMeal: (meal) {
            onSelectMeal(context, meal);
          }),
    );
    if (meals.isEmpty) {
      content = Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "Uh oh....No meals found!!",
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          const SizedBox(height: 20),
          Text(
            "Try Selecting a different category!",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
        ]),
      );
    }
    if (title == null) {
      return content;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
