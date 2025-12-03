import 'package:flutter/material.dart';
import '../widgets/app_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key, required this.switchScreen});

  final VoidCallback switchScreen;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.blue,
      child: Center(
        child: Column(
          children: [
            Text(
              "Welcome Screen",
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Image.asset("assets/w9/quiz-logo.png", width: 450),
            SizedBox(height: 50),
            AppButton("Start Quiz", onTap: switchScreen),
          ],
        ),
      ),
    );
  }
}
