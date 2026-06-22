import 'package:flutter/material.dart';

import '../../../data/mock_grocery_data.dart';
import '../../../models/grocery.dart';
import 'grocery_form.dart';
import 'grocery_tile.dart';

class GroceryScreen extends StatefulWidget {
  const GroceryScreen({super.key});

  @override
  State<GroceryScreen> createState() => _GroceryScreenState();
}

class _GroceryScreenState extends State<GroceryScreen> {
  final List<GroceryItem> _groceryItems = List.of(allGroceryItems);

  void onCreate() async {
    final newItem = await showModalBottomSheet<GroceryItem>(
      context: context,
      isScrollControlled: true,
      builder: (ctx) {
        return const GroceryForm();
      },
    );
    if (newItem == null) {
      return;
    }
    final nextId = String.fromCharCode(97 + _groceryItems.length);

    final itemWithId = GroceryItem(
      id: nextId,
      name: newItem.name,
      quantity: newItem.quantity,
      category: newItem.category,
    );

    setState(() {
      _groceryItems.add(itemWithId);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text('No items added yet.'));

    if (_groceryItems.isNotEmpty) {
      content = ListView.builder(
        itemCount: _groceryItems.length,
        itemBuilder: (ctx, index) {
          final grocery = _groceryItems[index];

          return GroceryTile(grocery: grocery);
        },
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [IconButton(onPressed: onCreate, icon: const Icon(Icons.add))],
      ),
      body: content,
    );
  }
}
