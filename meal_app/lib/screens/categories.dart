import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/models/category.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/meals.dart';
import 'package:meal_app/widgets/category_item.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({
    super.key,
    required this.onToggleFavorite,
    required this.meals,
  });

  final void Function(Meal meal) onToggleFavorite;
  final List<Meal> meals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animeController;

  @override
  void initState() {
    super.initState();

    _animeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );

    _animeController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _animeController.dispose();
  }

  // function to navigate to the list of meals in selected category
  void _selectedCategory(BuildContext context, Category category) {
    // get the meals for a particular category id
    final filteredMeals = widget.meals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filteredMeals,
          onToggleFavorite: widget.onToggleFavorite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animeController,
      child: GridView(
        padding: const EdgeInsets.all(15),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          mainAxisSpacing: 15, // horizontal
          crossAxisSpacing: 15, // vertical
        ),
        children: [
          for (final category in availableCategories)
            CategoryItem(
              category: category,
              onSelectCategory: () => _selectedCategory(context, category),
            )
        ],
      ),
      builder: (context, child) =>
          // child is the girdview
          SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.3),
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: _animeController,
          curve: Curves.easeInOut,
        )),
        child: child,
      ),
      //     Padding(
      //   padding: EdgeInsets.only(top: 100 - _animeController.value * 100),
      //   child: child,
      // ),
    );
  }
}
