import 'package:flutter/material.dart';
import 'package:quiz/questions_summary/questionsummary.dart';
import 'package:quiz/quizscreen.dart';
import 'package:quiz/startscreen.dart';
import 'package:quiz/data/data.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  Widget? activeScreen;
  List<String> chosenoptions = [];

  void addOption(String option) {
    chosenoptions.add(option);
    if (chosenoptions.length == data.length) {
      setState(() {
        activeScreen = QuestionSummary(chosenoptions: chosenoptions, restartQuiz: restartQuiz);
      });
    }
  }

  void restartQuiz(){
    chosenoptions.clear();
    setState(() {
      activeScreen = QuizScreen(addOption: addOption);
    });
  }

  @override
  void initState() {
    super.initState();
    activeScreen = StartScreen(switchTo: switchScreen);
  }

  switchScreen() {
    setState(() {
      activeScreen = QuizScreen(addOption: addOption);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: activeScreen);
  }
}
