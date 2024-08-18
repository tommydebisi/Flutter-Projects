import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/categories.dart';
import 'package:meal_app/screens/filters.dart';
import 'package:meal_app/screens/meals.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedTabIndex = 0; // start from 0 by default
  final List<Meal> _favoriteMeals = []; // holds the favorite meals

  void _selectedTab(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  void _showInfoMessage(String message) {
    // clear existing snackbars
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void _toggleMealFavorite(Meal meal) {
    // check if meal is present in favorite meal list
    bool isExisting = _favoriteMeals.contains(meal);

    setState(() {
      if (isExisting) {
        _favoriteMeals.remove(meal);
        _showInfoMessage('Meal Removed From Favorites');
      } else {
        _favoriteMeals.add(meal);
        _showInfoMessage('Meal Added to Favorites');
      }
    });
  }

  // function to interact with the drawer items and set the right screen
  void _setScreen(String identifier) {
    // if meals just close the drawer since we are there
    Navigator.of(context).pop();
    if (identifier.toLowerCase() == 'filters') {
      // push filterscreen to stack
      Navigator.of(context).push(
        MaterialPageRoute(builder: (ctx) => const FiltersScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(
      onToggleFavorite: _toggleMealFavorite,
    );
    String activeTabTitle = 'Categories';

    // use the selected tab index to change the page
    if (_selectedTabIndex == 1) {
      activePage = MealsScreen(
        meals: _favoriteMeals,
        onToggleFavorite: _toggleMealFavorite,
      );
      activeTabTitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          activeTabTitle,
        ),
      ),
      body: activePage,
      drawer: MainDrawer(
        onSelectedItem: _setScreen,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedTab,
        currentIndex: _selectedTabIndex, // tells flutter the active tab
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.set_meal,
              ),
              label: 'Categories'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.star,
              ),
              label: 'Favorites')
        ],
      ),
    );
  }
}
