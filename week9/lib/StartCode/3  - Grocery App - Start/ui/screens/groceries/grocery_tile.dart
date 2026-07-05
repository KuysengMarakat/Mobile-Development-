// ---------------------------------------------
// Create a new stateless widget : GroceryTile
// ---------------------------------------------

import 'package:flutter/material.dart';

import '../../../models/grocery.dart';

class GroceryTile extends StatelessWidget {
  const GroceryTile({super.key, required this.grocery});

  final GroceryItem grocery;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListTile(
            leading: Text("Gro"),
            title: Text("How?"),
            
          ),
        ],
      ),
    );
  }
}

// The widget shall take as required parameter a Grocery  

// 	Use a ListTile widget to layout the elements


// https://api.flutter.dev/flutter/material/ListTile-class.html