import 'package:forkify/data/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:forkify/widgets/category_grid_item.dart';
import 'package:forkify/screens/meals_screen.dart';
import 'package:forkify/models/category.dart';
import 'package:forkify/models/meal.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.availableMeals});
  final List<Meal> availableMeals;
  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealsScreen(
              title: category.title,
              meals: filteredMeals,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onSelectCategory: () {
              _selectCategory(context, category);
            },
          )
      ],
    );
  }
}
