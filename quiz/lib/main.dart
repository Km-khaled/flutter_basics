import 'package:flutter/material.dart';
import 'package:quiz/quizapp.dart';

main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        backgroundColor:  Color.fromARGB(255, 43, 3, 71),
        body: QuizApp(),
      ),
    ),
  );
}
