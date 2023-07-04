import 'package:flutter/material.dart';
import 'package:forkify/models/meal.dart';
import 'package:forkify/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({required this.title, required this.meals, super.key});
  final String title;
  final List<Meal> meals;
  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (ctx, index) => MealItem(meal: meals[index]),
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
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content,
    );
  }
}
