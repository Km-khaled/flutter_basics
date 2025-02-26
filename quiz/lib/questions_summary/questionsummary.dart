import 'package:flutter/material.dart';
import 'package:quiz/data/data.dart';
import 'package:quiz/questions_summary/resultsummary.dart';

class QuestionSummary extends StatelessWidget {
  final List<String> chosenoptions;
  final void Function() restartQuiz;

  const QuestionSummary(
      {super.key, required this.chosenoptions, required this.restartQuiz});

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (int i = 0; i < chosenoptions.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': data[i].question,
          'correct_option': data[i].options[0],
          'chosen_option': chosenoptions[i],
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final all = data.length;
    final correctanswers = getSummaryData()
        .where((data) => data['chosen_option'] == data['correct_option'])
        .length;
    return Container(
      margin: const EdgeInsets.only(top: 150),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('Question Summary',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center),
          const SizedBox(height: 20, width: double.infinity),
          Text('You answered $correctanswers of $all Questions Correctly !',
              style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center),
          const SizedBox(height: 20, width: double.infinity),
          ResultSummary(summaryData: getSummaryData()),
          const SizedBox(height: 10, width: double.infinity),
          TextButton.icon(
            onPressed: restartQuiz,
            style: TextButton.styleFrom(
              padding: const EdgeInsets.all(20),
            ),
            icon: const Icon(Icons.refresh, color: Colors.white),
            label: const Text(
              "Restart Quiz",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
