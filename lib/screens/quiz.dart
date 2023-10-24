import 'package:flutter/material.dart';
import 'package:quiz_app/screens/home_screen.dart';
import 'package:quiz_app/screens/question_screen.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/screens/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<Color> gradientColors = [
    const Color.fromARGB(255, 108, 75, 195),
    const Color.fromARGB(255, 122, 69, 211)
  ];

  List<String> choosedAnswers = [];
  String activeScreen = "home-screen";

  void switchScreen() {
    setState(() {
      activeScreen = "questions-screen";
    });
  }

  void onRestart()
  {
    choosedAnswers.clear();
    setState(() {
      activeScreen = "home-screen";
    });
  }

  void chooseAnswer(String answer) {
    choosedAnswers.add(answer);
    if (questions.length == choosedAnswers.length) {
      setState(() {
        activeScreen = "results-screen";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = HomeScreen(startQuiz: switchScreen);
    if (activeScreen == "questions-screen") {
      screenWidget = QuestionsScreen(selectAnswer: chooseAnswer);
    }
    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(choosedAnswers: choosedAnswers, onRestart: onRestart,);
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(40),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: gradientColors,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
