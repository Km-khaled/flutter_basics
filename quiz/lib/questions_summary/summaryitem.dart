import 'package:flutter/material.dart';
import 'package:quiz/questions_summary/questionidentifier.dart';

class SummaryItem extends StatelessWidget {
  final Map<String, Object> summaryData;
  const SummaryItem({super.key, required this.summaryData});
  @override
  Widget build(BuildContext context) {
    final isCorrect =
        summaryData['correct_option'] == summaryData['chosen_option'];
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          QuestionIdentifier(
              isCorrect: isCorrect,
              questionIndex: (summaryData['question_index'] as int)),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  summaryData['question'] as String,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  "Your Answer is: ${summaryData['chosen_option']}",
                  style: const TextStyle(
                      color: Color.fromARGB(255, 199, 153, 248),
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "The correct answer is: ${summaryData['correct_option']}",
                  style: const TextStyle(
                      color: Color.fromARGB(255, 163, 241, 237),
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),
              ],
            ),
          )
        ]);
  }
}
