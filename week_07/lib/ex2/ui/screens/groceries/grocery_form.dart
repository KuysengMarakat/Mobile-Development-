
// ---------------------------------------------
// Create a new statefull widget : GroceryForm
// ---------------------------------------------

import 'package:flutter/material.dart';

import '../../../models/grocery.dart';

class GroceryForm extends StatefulWidget {
  const GroceryForm({super.key});

  @override
  State<GroceryForm> createState() {
    return _GroceryFormState();
  }
}

class _GroceryFormState extends State<GroceryForm> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _quantityController = TextEditingController(text: '0');

  @override
  void dispose() {
    _nameController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  void _resetForm() {
    _nameController.clear();
    _quantityController.text = '0';
  }

  void _addItem() {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    }

    final newItem = GroceryItem(
      id: '',
      name: _nameController.text,
      quantity: int.parse(_quantityController.text),

      // Your enum does not have GroceryCategory.food,
      // so we use "other" as the default category.
      category: GroceryCategory.other,
    );

    Navigator.pop(context, newItem);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                const SizedBox(width: 8),
                const Text(
                  'Add a new item',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            TextFormField(
              controller: _nameController,
              maxLength: 50,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),

            TextFormField(
              controller: _quantityController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Quantity',
              ),
            ),

            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: _resetForm,
                  child: const Text('Reset'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _addItem,
                  child: const Text('Add Item'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// The form shall be composed of 2 text fields:
// -	Name of the grocery item
 //-	Quantity (number only)

// ⚠️  For now we don’t select the grocery type, we assume it’s always food

// The form shall be composed of 2 buttons:
//-	Cancel button
// -	Add item button
