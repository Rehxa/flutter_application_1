import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Container(
        padding: EdgeInsets.all(50),
        margin: EdgeInsets.all(50),
        child: Column(
          children: [
            CustomCard(color: Colors.blue[100], text: " OOP"),
            CustomCard(text: "DART", color: Colors.blue[300]),
            CustomCard(
              text: "FLUTTER",
              gradient: LinearGradient(
                colors: [Colors.blue[300]!, Colors.blue[900]!],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class CustomCard extends StatelessWidget {
  final Color? color;
  final String text;
  final Gradient? gradient;
  const CustomCard({super.key, this.color, this.gradient, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(50),
        gradient: gradient,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }
}
