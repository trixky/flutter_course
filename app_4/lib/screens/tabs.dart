import 'dart:developer';

import 'package:app_4/models/meal.dart';
import 'package:app_4/providers/favorites_provider.dart';
import 'package:app_4/providers/filters_provider.dart';
import 'package:app_4/screens/categories.dart';
import 'package:app_4/screens/filters.dart';
import 'package:app_4/screens/meals.dart';
import 'package:app_4/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_4/providers/meals_provider.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

// state full widget = ConsumerStatefulWidget
// state less widget = ConsumerWidget

class TabScreen extends ConsumerStatefulWidget {
// class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  // State<TabScreen> createState() {
  ConsumerState<TabScreen> createState() {
    return _TabScreenState();
  }
}

// class _TabScreenState extends State<TabScreen> {
class _TabScreenState extends ConsumerState<TabScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      Navigator.of(context).push<Map<Filter, bool>>(
        // Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (ctx) => const FiltersScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final filteredMeals = ref.watch(filteredMealProvider);
    // final activeFilters = ref.watch(filterProvider);
    // final availableMeals = meals.where((meal) {
    //   if (activeFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
    //     return false;
    //   }
    //   if (activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
    //     return false;
    //   }
    //   if (activeFilters[Filter.vegetarian]! && !meal.isVegetarian) {
    //     return false;
    //   }
    //   if (activeFilters[Filter.vegan]! && !meal.isVegan) {
    //     return false;
    //   }
    //   return true;
    // }).toList();

    Widget activePage;
    String activePageTitle;

    if (_selectedPageIndex == 0) {
      activePage = CategoriesScreen(
        availableMeals: filteredMeals,
      );
      activePageTitle = "Categories";
    } else {
      final favoriteMeals = ref.watch(favoriteMealsProvider);

      activePage = MealsScreen(
        meals: ref.watch(favoriteMealsProvider),
      );
      activePageTitle = "Favorites";
    }

    return Scaffold(
        appBar: AppBar(title: Text(activePageTitle)),
        drawer: MainDrawer(onSelectScreen: _setScreen),
        body: activePage,
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          currentIndex: _selectedPageIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.set_meal), label: 'Categories'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
          ],
        ));
  }
}
