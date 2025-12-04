import '../../model/quiz.dart';

List<Question> sampleQuestions = [
  Question(
    question: "What is the capital of France?",
    optionAnswers: ["Paris", "London", "Berlin", "Madrid"],
    correctAnswer: "Paris",
  ),
  Question(
    question: "Which planet is known as the Red Planet?",
    optionAnswers: ["Earth", "Mars", "Venus", "Jupiter"],
    correctAnswer: "Mars",
  ),
  Question(
    question: "What is 2 + 2?",
    optionAnswers: ["3", "4", "5", "6"],
    correctAnswer: "4",
  ),
  Question(
    question: "Which animal is known as the King of the Jungle?",
    optionAnswers: ["Tiger", "Lion", "Elephant", "Cheetah"],
    correctAnswer: "Lion",
  ),
  Question(
    question: "What gas do plants produce during photosynthesis?",
    optionAnswers: ["Oxygen", "Carbon Dioxide", "Nitrogen", "Hydrogen"],
    correctAnswer: "Oxygen",
  ),
];

List<Answer> sampleAnswers = [
  Answer(question: sampleQuestions[0], choice: "Paris"), // correct
  Answer(question: sampleQuestions[1], choice: "Earth"), // wrong
  Answer(question: sampleQuestions[2], choice: "4"), // correct
  Answer(question: sampleQuestions[3], choice: "Lion"), // correct
  Answer(question: sampleQuestions[4], choice: "Nitrogen"), // wrong
];

Quiz testQuiz = Quiz(questions: sampleQuestions);

Submission submit = Submission(quiz: Quiz(questions: []));
