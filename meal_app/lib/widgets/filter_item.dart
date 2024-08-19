import 'package:flutter/material.dart';

class FilterItem extends StatelessWidget {
  const FilterItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.toggleActive,
    required this.onSwitchChange,
  });

  final String title;
  final String subtitle;
  final bool toggleActive;
  final void Function(bool) onSwitchChange;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: toggleActive,
      onChanged: onSwitchChange,
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(
        left: 25,
        right: 25,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
      ),
    );
  }
}
