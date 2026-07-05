// ---------------------------------------------
// Create a new statefull widget : GroceryForm
// ---------------------------------------------

import 'package:flutter/material.dart';
import '../../../models/grocery.dart';

class GroceryForm extends StatefulWidget {
  const GroceryForm({super.key});

  @override
  State<GroceryForm> createState() => _GroceryFormState();
}

class _GroceryFormState extends State<GroceryForm> {
  final _nameController = TextEditingController();
  final _quantityController = TextEditingController();

  String? _amountError;
  String? _textError;

  void onAdd() {
    String name = _nameController.text;
    String quantity = _quantityController.text;

    double? amount = double.tryParse(quantity);
    double? text = double.tryParse(name);

    if (amount == null || amount < 0 || amount > 100) {
      setState(() {
        _amountError = 'Please enter a number between 0 to 100';
      });
      return;
    }

    if (text == null) {
      setState(() {
        _textError = 'Please enter your name!';
      });
    }

    GroceryItem newData = GroceryItem(
      name: name,
      quantity: int.parse(quantity),
      id: '',
      category: GroceryCategory.other,
    );

    Navigator.pop<GroceryItem>(context, newData);
  }

  void onCancelled() {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              maxLength: 50,
              decoration: InputDecoration(label: Text("Name"), errorText: _textError, errorStyle: TextStyle(color: Colors.red)),
              onChanged: (value) => {},
            ),

            const SizedBox(height: 20),

            TextField(
              controller: _quantityController,
              maxLength: 100,
              decoration: InputDecoration(
                label: Text("Quantity"),
                errorText: _amountError,
                errorStyle: TextStyle(color: Colors.red),
              ),
              onChanged: (value) => {},
            ),

            const Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: onCancelled,
                  child: Text("Cancel"),
                ),
                const SizedBox(width: 20,),

                ElevatedButton(
                  onPressed: onAdd,
                  child: Text("Add items"),
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
