// ---------------------------------------------
// Create a new stateless widget : GroceryTile
// ---------------------------------------------
import 'package:flutter/material.dart';
import 'package:week_07/ex2/models/grocery.dart';

class GroceryTile extends StatelessWidget {
  const GroceryTile({super.key, required this.grocery});

  final GroceryItem grocery;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      
      leading: Container(
        // decoration: BoxDecoration(color: Colors.blueGrey),
        width: 30,
        height: 30,
        color: grocery.category.color,
      ),
      title: Text(grocery.name),
      trailing: Text(grocery.quantity.toString()),
    );
  }
}

// The widget shall take as required parameter a Grocery  

// 	Use a ListTile widget to layout the elements


// https://api.flutter.dev/flutter/material/ListTile-class.html

