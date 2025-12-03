import 'package:flutter/material.dart';
import '../../model/quiz.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    super.key,
    required this.question,
    required this.answerChoice,
    required this.questionIndex,
    required this.isEnable,
    required this.onChecked,
  });

  final Question question;
  final String answerChoice;
  final int questionIndex;
  final bool isEnable;
  final void Function(int, String) onChecked;

  Color get colorAnswer =>
      answerChoice == question.correctAnswer ? Colors.blue : Colors.red;

  Widget get showAnswer => isEnable
      ? Text("")
      : Text(
          "Answer is ${question.correctAnswer}",
          style: TextStyle(
            color: colorAnswer,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: 500,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blue[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        spacing: 10,
        children: [
          Column(
            spacing: 10,
            children: [
              Text(
                "Question ${questionIndex + 1}",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                question.question,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              SizedBox(child: showAnswer),
            ],
          ),

          SizedBox(
            height: 300,
            child: ListView.separated(
              itemCount: question.optionAnswers.length,
              itemBuilder: (BuildContext context, int index) {
                final option = question.optionAnswers[index];
                return OptionAnswer(
                  isEnable: isEnable,
                  checked: (optIndex, optionValue) =>
                      onChecked(questionIndex, optionValue),
                  isChecked: option == answerChoice,
                  currentIndex: index,
                  answer: option,
                  isCorrect: question.correctAnswer == option,
                );
              },
              separatorBuilder: (context, index) =>
                  const Divider(color: Color(0x00000000), height: 20),
            ),
          ),
        ],
      ),
    );
  }
}

class OptionAnswer extends StatelessWidget {
  const OptionAnswer({
    super.key,
    required this.checked,
    required this.isChecked,
    required this.currentIndex,
    required this.answer,
    required this.isEnable,
    required this.isCorrect,
  });
  final void Function(int, String) checked;
  final bool isChecked;
  final int currentIndex;
  final String answer;
  final bool isEnable;
  final bool isCorrect;

  Color get textColor => isCorrect ? Colors.blue : Colors.red;

  Color get colorText => isEnable ? Colors.blueGrey : textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: CheckboxListTile(
        enabled: isEnable,
        checkboxShape: CircleBorder(),
        activeColor: Colors.blue,
        checkColor: Colors.white,
        hoverColor: Colors.blue[100],
        title: Text(answer, style: TextStyle(color: colorText)),
        value: isChecked,
        onChanged: (_) => checked(currentIndex, answer),
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }
}
