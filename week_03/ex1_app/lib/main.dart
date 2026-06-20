import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp( 
      home: Scaffold(
        body: Center(
          child: Text(
            'Welcome to Marakat Website!',
            textDirection: TextDirection.ltr,
            style: TextStyle(color: Colors.orange, fontSize: 50),
          ),
        ),
      ),


    ),
  );
}