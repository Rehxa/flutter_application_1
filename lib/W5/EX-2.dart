import 'package:flutter/material.dart';

enum ButtonType { primary, secondary, disabled }

enum IconPosition { left, right }

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(40),
          child: Column(
            children: [
              CustomButton(label: "Submit", iconData: Icons.check),
              CustomButton(
                label: "Time",
                iconData: Icons.access_time,
                buttonType: ButtonType.secondary,
                iconPosition: IconPosition.right,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class CustomButton extends StatelessWidget {
  final String label;
  final IconData iconData;
  final ButtonType buttonType;
  final IconPosition iconPosition;

  const CustomButton({
    super.key,
    required this.label,
    required this.iconData,
    this.buttonType = ButtonType.primary,
    this.iconPosition = IconPosition.left,
  });

  @override
  Widget build(BuildContext context) {
    Color? color;
    bool isRight = false;

    if (iconPosition == IconPosition.right) {
      isRight = true;
    } else {
      isRight = false;
    }

    if (buttonType == ButtonType.disabled) {
      color = Colors.grey[600];
    } else if (buttonType == ButtonType.secondary) {
      color = Colors.green[600];
    } else if (buttonType == ButtonType.primary) {
      color = Colors.blue[600];
    }

    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: isRight
              ? [
                  Text(label),
                  Padding(padding: EdgeInsets.all(10), child: Icon(iconData)),
                ]
              : [
                  Padding(padding: EdgeInsets.all(10), child: Icon(iconData)),
                  Text(label),
                ],
        ),
      ),
    );
  }
}
