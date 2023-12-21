import 'package:flutter/material.dart';

import 'package:app_5/data/dummy_items.dart';

class GroceryScreen extends StatelessWidget {
  const GroceryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
        ),
        child: Column(
          children: groceryItems
              .map(
                (groceryItem) => Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 8,
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 18,
                        width: 18,
                        color: groceryItem.category.color,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(groceryItem.name),
                      Expanded(
                        child: Text(
                          groceryItem.quantity.toString(),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
