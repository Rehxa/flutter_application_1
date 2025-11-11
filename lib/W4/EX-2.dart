import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Container(
        margin: EdgeInsets.all(50),
        padding: EdgeInsets.all(40),
        color: Color.fromRGBO(100, 181, 246, 1),
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(30, 136, 229, 1),
            borderRadius: BorderRadius.circular(25.5),
          ),
          child: Center(
            child: Text(
              "CADT STUDENTS",
              style: TextStyle(
                color: Colors.white,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
