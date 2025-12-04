import 'package:flutter/material.dart';
import '../widgets/questionCard.dart';
import '../widgets/app_button.dart';
import '../../model/quiz.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({
    super.key,
    required this.quiz,
    required this.answers,
    required this.lastButton,
    required this.onBack,
    required this.onAnswer,
    required this.questionIndex,
  });
  final Quiz quiz;
  final List<Answer> answers;
  final Widget lastButton;
  final VoidCallback onBack;
  final void Function(int, String) onAnswer;
  final int questionIndex;

  @override
  Widget build(BuildContext context) {
    Question currentQuestion = quiz.questions[questionIndex];
    String currentAnswer = answers[questionIndex].answerChoice;

    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.blue,
      child: Column(
        children: [
          Text(
            "Question Screen",
            style: TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20),

          QuestionCard(
            onChecked: (index, answer) => onAnswer(questionIndex, answer),
            answerChoice: currentAnswer,
            question: currentQuestion,
            questionIndex: questionIndex,
            isEnable: true,
          ),

          SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AppButton("back", onTap: onBack),
              lastButton,
            ],
          ),
        ],
      ),
    );
  }
}
