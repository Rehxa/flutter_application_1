import 'package:flutter/material.dart';
import '../../model/quiz.dart';
import '../widgets/questionCard.dart';
import '../widgets/app_button.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.quiz,
    required this.onRestart,
    required this.onSwitch,
  });
  final Quiz quiz;
  final VoidCallback onRestart;
  final VoidCallback onSwitch;
  //todo maybe a score at the top
  // maybe button functional

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.blue,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "Result Screen",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),

            Text(
              " ${quiz.getScore()}/${quiz.questions.length}",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text("Your Score", style: TextStyle(color: Colors.white)),
            SizedBox(height: 10),

            Container(
              height: 550,
              width: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              clipBehavior: Clip.hardEdge,

              child: ListView.separated(
                itemCount: quiz.questions.length,
                itemBuilder: (BuildContext context, int index) {
                  Question currentQuestion = quiz.questions[index];
                  String currentAnswer = quiz.answers[index].answerChoice;
                  return SizedBox(
                    height: 500,
                    width: 500,
                    child: QuestionCard(
                      onChecked: (_, _) {},
                      answerChoice: currentAnswer,
                      question: currentQuestion,
                      questionIndex: index,
                      isEnable: false,
                    ),
                  );
                },
                separatorBuilder: (context, index) =>
                    const Divider(color: Color(0x00000000), height: 20),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AppButton("Restart", onTap: onRestart),
                  AppButton("Back to Start", onTap: onSwitch),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
