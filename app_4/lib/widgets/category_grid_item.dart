import 'package:flutter/material.dart';
import 'package:app_4/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem(
      {super.key, required this.category, required this.onSelectCategory});

  final Category category;

  final void Function() onSelectCategory;

  @override
  // Widget build(BuildContext ctx) => GestureDetector( // no feeback with GestureDetector
  Widget build(BuildContext ctx) => InkWell(
        onTap: onSelectCategory,
        splashColor: Theme.of(ctx).primaryColor,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [
                category.color.withOpacity(0.55),
                category.color.withOpacity(0.9),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Text(
            category.title,
            style: Theme.of(ctx).textTheme.titleLarge!.copyWith(
                  color: Theme.of(ctx).colorScheme.onBackground,
                ),
          ),
        ),
      );
}
