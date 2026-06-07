import 'package:flutter/material.dart';

void main() {
  runApp(const MyButtonApp());
}

class MyButtonApp extends StatelessWidget {
  const MyButtonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ButtonScreen(),
    );
  }
}

class ButtonScreen extends StatelessWidget {
  const ButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SelectableButton(),
      ),
    );
  }
}

class SelectableButton extends StatefulWidget {
  const SelectableButton({super.key});

  @override
  State<SelectableButton> createState() {
    return _SelectableButtonState();
  }
}

class _SelectableButtonState extends State<SelectableButton> {
  bool selected = false;

  String get buttonText {
    if (selected) {
      return "Selected";
    } else {
      return "Not selected";
    }
  }

  Color get buttonColor {
    if (selected) {
      return Colors.blue;
    } else {
      return Colors.blue.shade50;
    }
  }

  Color get textColor {
    if (selected) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 100,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            selected = !selected;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          foregroundColor: textColor,
        ),
        child: Text(
          buttonText,
          style: const TextStyle(fontSize: 28),
        ),
      ),
    );
  }
}