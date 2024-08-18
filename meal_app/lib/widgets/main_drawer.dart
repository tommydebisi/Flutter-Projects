import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer_item.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectedItem});

  final void Function(String identifier) onSelectedItem;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(0.8)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 46,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  'Cooking!',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme.of(context).colorScheme.primary),
                )
              ],
            ),
          ),
          MainDrawerItem(
            icon: Icons.restaurant,
            title: 'Meals',
            onSelectedItem: () {
              onSelectedItem('meals');
            },
          ),
          MainDrawerItem(
            icon: Icons.settings,
            title: 'Filters',
            onSelectedItem: () {
              onSelectedItem('filters');
            },
          ),
        ],
      ),
    );
  }
}
