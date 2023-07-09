import 'package:flutter/material.dart';
import 'package:forkify/models/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forkify/providers/favorites_provider.dart';

class MealDetails extends ConsumerWidget {
  const MealDetails({super.key, required this.meal});
  final Meal meal;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String bullet = "\u2022";
    var favMeals = ref.watch(favoriteMealsProvider);
    final isFav = favMeals.contains(meal);
    return Scaffold(
        appBar: AppBar(
          title: Text(meal.title),
          actions: [
            IconButton(
              onPressed: () {
                final wasAdded = ref
                    .read(favoriteMealsProvider.notifier)
                    .toggleMealFavStatus(meal);
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(wasAdded
                      ? "Added to Favorites"
                      : "Removed from Favorites"),
                  duration: const Duration(seconds: 5),
                ));
              },
              icon: AnimatedSwitcher(
                transitionBuilder: (child, animation) => FadeTransition(
                  opacity: Tween<double>(
                    begin: 0.5,
                    end: 1,
                  ).animate(animation),
                  child: child,
                ),
                duration: const Duration(milliseconds: 300),
                child: Icon(isFav ? Icons.star : Icons.star_border,
                    key: ValueKey(isFav)),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: meal.id,
                child: Image.network(
                  meal.imageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 14),
              Text(
                "Ingredients",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              for (final item in meal.ingredients)
                Text(
                  item,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
              const SizedBox(height: 20),
              Text(
                "Recipe",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold),
              ),
              // const SizedBox(height: 6),
              for (final item in meal.steps)
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Text(
                    bullet + "  " + item,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                  ),
                ),
            ],
          ),
        ));
  }
}
