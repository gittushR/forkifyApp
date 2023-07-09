import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onToggleScreen});
  final void Function(String identifier) onToggleScreen;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Theme.of(context).colorScheme.primaryContainer,
                Theme.of(context).colorScheme.primaryContainer.withOpacity(0.7),
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: Row(
              children: [
                Icon(Icons.fastfood,
                    size: 50, color: Theme.of(context).colorScheme.primary),
                const SizedBox(width: 18),
                Text(
                  "forkify",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme.of(context).colorScheme.primary),
                )
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.restaurant,
                size: 26, color: Theme.of(context).colorScheme.onBackground),
            title: Text(
              'Meals',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 24),
            ),
            onTap: () {
              onToggleScreen("Meals");
            },
          ),
          ListTile(
            leading: Icon(Icons.filter_alt,
                size: 26, color: Theme.of(context).colorScheme.onBackground),
            title: Text(
              'Filters',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 24),
            ),
            onTap: () {
              onToggleScreen("Filters");
            },
          ),
        ],
      ),
    );
  }
}
