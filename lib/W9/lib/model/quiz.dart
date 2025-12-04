class Quiz {
  List<Question> questions;
  List<Answer> answers;

  Quiz({required this.questions, List<Answer>? answered})
    : answers = questions.map((q) => Answer(question: q)).toList();
  //  answers = answered ?? [];

  int getScore() {
    int score = 0;
    for (var answer in answers) {
      if (answer.correctAnswer()) {
        score++;
      }
    }
    return score;
  }
}

class Question {
  final String question;
  final List<String> optionAnswers;
  final String correctAnswer;

  Question({
    required this.question,
    required this.optionAnswers,
    required this.correctAnswer,
  });
}

class Answer {
  Question question;
  String answerChoice;

  Answer({required this.question, String? choice})
    : answerChoice = choice ?? "unanswer";

  bool correctAnswer() => answerChoice == question.correctAnswer;
}

class Submission {
  Quiz quiz;
  DateTime submittedTime;
  Submission({required this.quiz, DateTime? time})
    : submittedTime = time ?? DateTime.now();
}
