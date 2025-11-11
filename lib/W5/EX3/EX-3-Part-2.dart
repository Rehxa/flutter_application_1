import 'package:flutter/material.dart';

enum Product {
  dart(
    title: "Dart",
    description: "The best object language",
    image: "assets/ex3/dart.png",
  ),
  flutter(
    title: "Flutter",
    description: "The best mobile widget library",
    image: "assets/ex3/flutter.png",
  ),
  fireBase(
    title: "Firebase",
    description: "The best cloud database",
    image: "assets/ex3/firebase.png",
  );

  final String title;
  final String description;
  final String image;

  const Product({
    required this.title,
    required this.description,
    required this.image,
  });
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: Padding(
          padding: EdgeInsets.all(40),
          child: Column(
            children: [
              Card(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.asset(
                        "assets/ex3/dart.png",
                        height: 80,
                        alignment: Alignment.topLeft,
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Title",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text("Description"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
