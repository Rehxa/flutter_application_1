import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(40),
          child: Column(
            children: [
              HobbyCard(
                title: "Tavelling",
                iconData: Icons.travel_explore,
                color: Color(0xff4CAF50),
              ),
              HobbyCard(
                title: "skating",
                iconData: Icons.skateboarding,
                color: Color(0xff607D8B),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class HobbyCard extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Color? color;
  const HobbyCard({
    super.key,
    required this.title,
    required this.iconData,
    this.color = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
      ),
      child: Center(
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(30, 20, 20, 20),
              child: Icon(iconData),
            ),
            Text(title),
          ],
        ),
      ),
    );
  }
}
