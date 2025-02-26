import 'package:flutter/material.dart';

class QuestionIdentifier extends StatelessWidget {
  final bool isCorrect;
  final int questionIndex;

  const QuestionIdentifier(
      {super.key, required this.isCorrect, required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    final questionnumber = questionIndex + 1;
    return Container(
      margin: const EdgeInsets.only(left: 10),
      height: 30,
      width: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isCorrect
            ? const Color.fromARGB(255, 150, 198, 241)
            : const Color.fromARGB(255, 249, 133, 241),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        questionnumber.toString(),
        style: const TextStyle(
          color: Color.fromARGB(255, 22, 2, 56),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
