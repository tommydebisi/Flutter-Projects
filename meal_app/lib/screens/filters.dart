import 'package:flutter/material.dart';
import 'package:meal_app/widgets/filter_item.dart';

enum Filters { glutenFree, vegan, vegetarian, lactose }

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({
    super.key,
    required this.currentFilters,
  });

  final Map<Filters, bool> currentFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _isGlutten = false; // inactive by default
  bool _isVegan = false;
  bool _isVegetarian = false;
  bool _isLactose = false;

  void _popHandler(bool popped) {
    // true if system is trying to pop the screen
    // handle the logic accordingly
    if (popped) {
      return;
    }
    // pop and return data when leaving the screen
    Navigator.of(context).pop({
      Filters.glutenFree: _isGlutten,
      Filters.vegan: _isVegan,
      Filters.vegetarian: _isVegetarian,
      Filters.lactose: _isLactose,
    });
  }

  @override
  void initState() {
    super.initState();
    // widget can only be accessed here and in the build
    _isGlutten = widget.currentFilters[Filters.glutenFree]!;
    _isVegan = widget.currentFilters[Filters.vegan]!;
    _isVegetarian = widget.currentFilters[Filters.vegetarian]!;
    _isLactose = widget.currentFilters[Filters.lactose]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: PopScope(
        // tells us when a user presses the back button
        canPop: false,
        onPopInvoked: _popHandler,
        child: Column(
          children: [
            FilterItem(
              title: 'Glutten-Free',
              subtitle: 'Only Glutten free meals',
              toggleActive: _isGlutten,
              onSwitchChange: (isActive) {
                setState(() {
                  _isGlutten = isActive;
                });
              },
            ),
            FilterItem(
              title: 'Vegan',
              subtitle: 'Only Vegan meals',
              toggleActive: _isVegan,
              onSwitchChange: (isActive) {
                setState(() {
                  _isVegan = isActive;
                });
              },
            ),
            FilterItem(
              title: 'Vegetarian',
              subtitle: 'Only Vegetarian meals',
              toggleActive: _isVegetarian,
              onSwitchChange: (isActive) {
                setState(() {
                  _isVegetarian = isActive;
                });
              },
            ),
            FilterItem(
              title: 'Lactose Free',
              subtitle: 'Only Lactose Free meals',
              toggleActive: _isLactose,
              onSwitchChange: (isActive) {
                setState(() {
                  _isLactose = isActive;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
