import 'package:flutter/material.dart';
import 'package:quiz/data/data.dart';
import 'package:quiz/button.dart';

class QuizScreen extends StatefulWidget {
  final void Function (String option) addOption;
  const QuizScreen({super.key, required this.addOption});
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int index = 0;

  void selectOption (String option){
    widget.addOption(option);
    setState(() {
      index++;
    });

  }

  
  @override
  Widget build(context) {
    final quiz = data[index];

    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            quiz.question,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20, width: double.infinity),
          ...quiz.getShuffledOptions().map((item) => Button(
              text: item,
              tap: () {
                selectOption(item);
              }))
        ],
      ),
    );
  }
}
