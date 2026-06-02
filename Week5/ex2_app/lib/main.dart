import 'package:flutter/material.dart';

enum ButtonType { primary, secondary, disabled}
enum IconPosition {
  left,
  right,
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.label,
    required this.icon,
    this.iconPosition = IconPosition.left,
    this.buttonType = ButtonType.primary,
  });
  final String label;
  final IconData icon;
  final IconPosition iconPosition;
  final ButtonType buttonType;

    Color get buttonColor {
    switch (buttonType) {
      case ButtonType.primary:
        return Colors.blue;
      case ButtonType.secondary:
        return Colors.green;
      case ButtonType.disabled:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final iconWidget = Icon(
      icon,
      color: Colors.grey,
    );

    final labelWidget = Text(
      label,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 16,
      ),
    );

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: iconPosition == IconPosition.left
            ? [
                iconWidget,
                const SizedBox(width: 8),
                labelWidget,
              ]
            : [
                labelWidget,
                const SizedBox(width: 8),
                iconWidget,
              ],
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Custom buttons')),
        body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            CustomButton(
              label: 'Submit',
              icon: Icons.check,
              buttonType: ButtonType.primary,
              iconPosition: IconPosition.left,
            ),
            CustomButton(
              label: 'Time',
              icon: Icons.access_time,
              buttonType: ButtonType.secondary,
              iconPosition: IconPosition.right,
            ),
            CustomButton(
              label: 'Account',
              icon: Icons.account_tree,
              buttonType: ButtonType.disabled,
            ),
          ],
        ),
      ),
      ),
    ),
  );
}
