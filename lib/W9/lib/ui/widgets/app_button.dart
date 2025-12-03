import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton(this.label, {super.key, required this.onTap});

  final String label;
  final void Function() onTap;
  //void Function() and VoidCallBack are the same type

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
      ),
      child: Text(label),
    );
  }
}
