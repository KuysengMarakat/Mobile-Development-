
import 'package:flutter/material.dart';

class ButtonStatus {
  final String title;
  final bool selected;

  ButtonStatus({required this.title, required this.selected});
  
}

class MyButton extends StatefulWidget {
  const MyButton({super.key});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: , 
              child: child)
          ],
        ),
      ),
    );
  }
}