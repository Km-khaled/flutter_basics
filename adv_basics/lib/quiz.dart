import 'package:adv_basics/results_screen.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_screen.dart';
import 'package:adv_basics/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;
  List selectedOptions = [];
  // this function is executed by flutter when stateful widget's state object is initialized
  @override
  void initState() {
    super.initState();
    activeScreen = StartScreen(startQuiz: switchScreen);
  }

// passing the switchScreen function to StartScreen with fuunction creation simutaneously
  void switchScreen() {
    setState(() {
      activeScreen = QuestionsScreen(onSelectedAnswer: chooseAnswer);
    });
  }

  

  void chooseAnswer(String option) {
    selectedOptions.add(option);
    if (selectedOptions.length == questions.length) {
      setState(() {
        activeScreen = ResultsScreen(selectedOptions: selectedOptions,restartQuiz:restartQuiz);
        selectedOptions = [];
      });
    }
  }


    void restartQuiz() {
    setState(() {
      selectedOptions = [];
      activeScreen = QuestionsScreen(onSelectedAnswer: chooseAnswer);
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 105, 46, 160),
              Color.fromARGB(255, 152, 61, 231),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
          child: Center(
            child: activeScreen,
            // activeScreen2 == 'StartScreen'
            //     ? StartScreen(switchScreen)
            //     : const Questions(),
          ),
        ),
      ),
    );
  }
}
