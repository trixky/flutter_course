import 'package:app_2/question_screen.dart';
import 'package:flutter/material.dart';
import 'package:app_2/start_screen.dart';
import 'package:app_2/data/question.dart';
import 'package:app_2/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  // Widget? activeScreen;
  List<String> selectedAnswers = [];
  var activeScreen = 1;

  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }

  void switchScreen() {
    setState(() {
      // activeScreen = const QuestionScreen();
      activeScreen = 2;
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length >= questions.length) {
      setState(() {
        // activeScreen = const QuestionScreen();
        activeScreen = 3;
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget? screen;

    if (activeScreen == 1) {
      screen = StartScreen(switchScreen);
    } else if (activeScreen == 3) {
      screen = ResultScreen(
        chosenAnswers: selectedAnswers,
        restartQuiz: restartQuiz,
      );
    } else {
      screen = QuestionScreen(chooseAnswer);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Colors.red,
                Colors.yellow,
              ],
            ),
          ),
          // child: activeScreen == 1 ? StartScreen(switchScreen) : const QuestionScreen(),
          child: screen,
        ),
      ),
    );
  }
}
