import 'package:flutter/material.dart';
import '../../../data/mock_grocery_data.dart';
import '../../../models/grocery.dart';
import 'grocery_form.dart';

class GroceryScreen extends StatefulWidget {
  const GroceryScreen({super.key});

  @override
  State<GroceryScreen> createState() => _GroceryScreenState();
}

class _GroceryScreenState extends State<GroceryScreen> {
  final List<GroceryItem> _groceryItem = List.from(allGroceryItems);
  void onCreate() async {
    final newItem = await showModalBottomSheet<GroceryItem>(
      context: context,
      isScrollControlled: true,
      builder: (ctx) {
        return GroceryForm();
      },
    );

    if (newItem == null) {
      return;
    }

    setState(() {
      _groceryItem.add(newItem);
    });
    // ---------------------------------------------
    // Navigate to the form screen using showModalBottomSheet
    // ---------------------------------------------

    // https://api.flutter.dev/flutter/material/showModalBottomSheet.html
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text('No items added yet.'));

    if (allGroceryItems.isNotEmpty) {
      ListView.builder(
        itemCount: _groceryItem.length,
        itemBuilder: (ctx, index) {
          _groceryItem[index];
          return null;
        },
      );
      // ---------------------------------------------
      //  Loop on groceries with an ListView builder
      //  For each grocery items, create a GroceryTile (grocery_tile.dart)
      // ---------------------------------------------
      // https://api.flutter.dev/flutter/widgets/ListView-class.html
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [IconButton(onPressed: () => {}, icon: const Icon(Icons.add))],
      ),
      body: content,
    );
  }
}
