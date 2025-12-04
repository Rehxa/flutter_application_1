import 'package:flutter/material.dart';
import './widgets/app_button.dart';
import './screens/welcome_screen.dart';
import './screens/question_screen.dart';
import './screens/result_screen.dart';
import '../data/repositories/quiz_mock_repository.dart';
import '../model/quiz.dart';

enum ScreenType { start, question, result }

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  ScreenType screen = ScreenType.start;

  void switchScreen(ScreenType type) {
    setState(() {
      screen = type;
    });
  }

  Widget getScreen() {
    if (screen == ScreenType.question) {
      return QuestionScreen(
        quiz: testQuiz,
        answers: answers,
        lastButton: lastButton,
        onBack: onBack,
        onAnswer: onAnswer,
        questionIndex: index,
      );
    } else if (screen == ScreenType.result) {
      return ResultScreen(
        quiz: testQuiz,
        onRestart: onRestart,
        onSwitch: onToStart,
      );
    }
    return WelcomeScreen(switchScreen: () => switchScreen(ScreenType.question));
  }

  int index = 0;
  List<Answer> answers = testQuiz.questions
      .map((q) => Answer(question: q))
      .toList();

  Widget get lastButton => index == testQuiz.questions.length - 1
      ? AppButton("submit", onTap: onSubmit)
      : AppButton("next", onTap: onNext);

  void onNext() {
    setState(() {
      if (index == testQuiz.questions.length - 1) {
        index = testQuiz.questions.length - 1;
      } else {
        index++;
      }
    });
  }

  void onBack() {
    setState(() {
      if (index == 0) {
        index = 0;
      } else {
        index--;
      }
    });
  }

  void onSubmit() {
    testQuiz.answers = answers;
    submit.quiz = testQuiz;
    setState(() {
      screen = ScreenType.result;
    });
  }

  void onRestart() {
    setState(() {
      answers = testQuiz.questions.map((q) => Answer(question: q)).toList();
      screen = ScreenType.question;
      index = 0;
    });
  }

  void onToStart() {
    setState(() {
      answers = testQuiz.questions.map((q) => Answer(question: q)).toList();
      screen = ScreenType.start;
      index = 0;
    });
  }

  void onAnswer(int questionIndex, String seletedAnswer) {
    setState(() {
      if (answers[questionIndex].answerChoice != seletedAnswer) {
        answers[questionIndex].answerChoice = seletedAnswer;
      } else {
        answers[questionIndex].answerChoice = "unanswer";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        appBar: AppBar(
          title: Text("Quiz App", style: TextStyle(color: Colors.blueGrey)),
          actions: [
            AppButton("welcome", onTap: () => switchScreen(ScreenType.start)),
            AppButton(
              "question",
              onTap: () => switchScreen(ScreenType.question),
            ),
            AppButton("result", onTap: () => switchScreen(ScreenType.result)),
          ],
        ),
        body: Center(child: getScreen()),
      ),
    );
  }
}
