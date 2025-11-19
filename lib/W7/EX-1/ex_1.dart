import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text("Custom buttons")),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SelectedButton(),
            SelectedButton(),
            SelectedButton(),
            SelectedButton(),
          ],
        ),
      ),
    ),
  ),
);

class SelectedButton extends StatefulWidget {
  const SelectedButton({super.key});

  @override
  State<SelectedButton> createState() => _SelectedButtonState();
}

class _SelectedButtonState extends State<SelectedButton> {
  bool isSelected = false;

  String get textLabel => isSelected ? "Selected" : "Not selected";

  Color get textColor => isSelected ? Colors.white : Colors.black;

  Color? get backgroundColor =>
      isSelected ? Colors.blue[500] : Colors.blue[200];

  void onSelect() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 100,
      child: ElevatedButton(
        onPressed: onSelect,
        style: ElevatedButton.styleFrom(backgroundColor: backgroundColor),
        child: Center(
          child: Text(textLabel, style: TextStyle(color: textColor)),
        ),
      ),
    );
  }
}
