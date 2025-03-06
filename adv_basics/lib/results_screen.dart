import 'package:flutter/material.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/question_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  final List selectedOptions;
   final void Function() restartQuiz;


   const ResultsScreen(
      {super.key, required this.selectedOptions, required this.restartQuiz});

  List<Map<String, Object>> getData() {
    List<Map<String, Object>> data = [];
    for (int i = 0; i < selectedOptions.length; i++) {
      data.add(
        {
          'question_index': i,
          'question': questions[i].question,
          "correct_answer": questions[i].options[0],
          'user_answer': selectedOptions[i],
        },
      );
    }
    return data;
  }

  @override
  Widget build(BuildContext context) {
    List correctAnswers = getData()
        .where((option) => option['user_answer'] == option['correct_answer'])
        .toList();

    final numtoTotalQuestions = questions.length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "You answered ${correctAnswers.length} out of $numtoTotalQuestions questions correctly!",
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 201, 153, 251),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            QuestionSummary(summaryData: getData()),
            const SizedBox(height: 30),
            // button to restart the quiz
            TextButton.icon(
              onPressed: () => restartQuiz,
              icon: const Icon(Icons.refresh),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontSize: 20),
              ),
              label: const Text("Restart Quiz!"),
            ),
          ],
        ),
      ),
    );
  }
}
