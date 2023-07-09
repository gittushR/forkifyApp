import 'package:flutter/material.dart';
// import 'package:forkify/data/dummy_data.dart';
// import 'package:forkify/models/meal.dart';
import 'package:forkify/screens/filter_screen.dart';
import 'package:forkify/screens/meals_screen.dart';
import 'package:forkify/screens/categories_screen.dart';
import 'package:forkify/widgets/main_drawer.dart';
import 'package:forkify/providers/meals_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forkify/providers/favorites_provider.dart';
import 'package:forkify/providers/filters_provider.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});
  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreen();
  }
}

class _TabsScreen extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String screen) async {
    Navigator.pop(context);
    if (screen == "Filters") {
      await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => const FilterScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsProvider);
    var _selectedFilters = ref.watch(filtersProvider);
    var availableMeals = ref.watch(filteredMealsProvider);
    Widget activePage = CategoriesScreen(
      availableMeals: availableMeals,
    );
    var activePagetitle = "Categories";
    if (_selectedPageIndex == 1) {
      final favoriteMeals = ref.watch(favoriteMealsProvider);
      activePage = MealsScreen(
        meals: favoriteMeals,
      );
      activePagetitle = "Your Favorites";
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePagetitle),
      ),
      drawer: MainDrawer(onToggleScreen: _setScreen),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
        items: const [
          BottomNavigationBarItem(
              icon: Icon((Icons.category_rounded)), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorites"),
        ],
      ),
    );
  }
}
