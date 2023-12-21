import 'dart:convert';
import 'dart:developer';

import 'package:app_5/data/categories.dart';
import 'package:app_5/models/grocery_item.dart';
import 'package:app_5/widget/new_item.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  List<GroceryItem> _groceryItems = [];
  var _isLoading = true;
  late Future<List<GroceryItem>> _loadedItems;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadedItems = _loadItems();
  }

  Widget content = const Center(
    child: Text("No items add yet."),
  );

  Future<List<GroceryItem>> _loadItems() async {
    final url = Uri.https(
        'flutter-udemy-course-fe5fe-default-rtdb.europe-west1.firebasedatabase.app',
        'shopping-list.json');

    // try {
    final response = await http.get(url);

    if (response.statusCode >= 400) {
      throw Exception('Failed to fetch grocery items. Please try again later.');
      // setState(() {
      //   _error = 'Failed to fetch data, Please try again later';
      // });
    }

    if (response.body == 'null') {
      setState(() {
        _isLoading = false;
      });
      return [];
    }

    final Map<String, dynamic> listData = json.decode(response.body);
    final List<GroceryItem> loadedItems = [];

    for (final item in listData.entries) {
      final category = categories.entries
          .firstWhere(
              (catItem) => catItem.value.label == item.value['category'])
          .value;

      loadedItems.add(GroceryItem(
          id: item.key,
          name: item.value['name'],
          quantity: item.value['quantity'],
          category: category));
    }

    return loadedItems;

    // setState(() {
    //   _groceryItems = loadedItems;
    //   _isLoading = false;
    // });
    // }
    // catch (error) {
    //     setState(() {
    //     _error = "Something went wrong! please, try again later.";
    //   });
    // }
  }

  void _addItem() async {
    final newItem = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const NewItem(),
      ),
    );

    if (newItem == null) {
      return;
    }

    setState(
      () {
        _groceryItems.add(newItem);
      },
    );

    // _loadItems();

    // if (newItem == null) {
    //   return;
    // }

    // setState(() {
    //   _groceryItems.add(newItem);
    // });
  }

  void _removeItem(GroceryItem item) async {
    final index = _groceryItems.indexOf(item);

    setState(() {
      _groceryItems.remove(item);
    });

    final url = Uri.https(
        'flutter-udemy-course-fe5fe-default-rtdb.europe-west1.firebasedatabase.app',
        'shopping-list/${item.id}.json');

    log(url.toString());

    final response = await http.delete(url);

    if (response.statusCode >= 400) {
      setState(() {
        _groceryItems.insert(index, item);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content;

    // if (_error != null) {
    //   content = Center(child: Text(_error!));
    // }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [
          IconButton(onPressed: _addItem, icon: const Icon(Icons.add)),
        ],
      ),
      // body: content,
      // body: FutureBuilder(future: _loadItems(), builder: (context, snapchot) {
      // use _loadedItems to be sure
      body: FutureBuilder(
        future: _loadedItems,
        builder: (context, snapchot) {
          if (snapchot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapchot.hasError) {
            return Center(child: Text(snapchot.error.toString()));
          }

          if (snapchot.data!.isEmpty) {
            return const Center(child: Text("No items added yet."));
          }

          return ListView.builder(
            itemCount: snapchot.data!.length,
            itemBuilder: (context, index) => Dismissible(
              key: ValueKey(snapchot.data![index].id),
              onDismissed: (direction) {
                _removeItem(snapchot.data![index]);
              },
              child: ListTile(
                title: Text(snapchot.data![index].name),
                leading: Container(
                  width: 24,
                  height: 24,
                  color: snapchot.data![index].category.color,
                ),
                trailing: Text(snapchot.data![index].quantity.toString()),
              ),
            ),
          );
        },
      ),
    );
  }
}

// is broken because you have to use FutureBuilder only when data is loaded one time without update