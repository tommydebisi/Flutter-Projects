import 'package:flutter/material.dart';

class MainDrawerItem extends StatelessWidget {
  const MainDrawerItem(
      {super.key,
      required this.title,
      required this.icon,
      required this.onSelectedItem});

  final String title;
  final IconData icon;
  final void Function() onSelectedItem;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onSelectedItem,
      leading: Icon(
        icon,
        size: 22,
        color: Theme.of(context).colorScheme.primary,
      ),
      // display primary content of the list tile
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 20,
            ),
      ),
    );
  }
}
