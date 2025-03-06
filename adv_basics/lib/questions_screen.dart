import 'package:flutter/material.dart';
import 'package:adv_basics/button.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  final void Function(String answer) onSelectedAnswer;

  const QuestionsScreen({super.key, required this.onSelectedAnswer});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int indexquestion = 0;

  void answerQuestion(String selectedAnswer) {
//onSelectedAnswer(selectedAnswer); is the line where the child widget (QuestionScreen) notifies the parent widget (QuizScreen) about the selected answer.
//This allows the parent widget to update its state or perform other actions based on the user's selectio

    widget.onSelectedAnswer(selectedAnswer);
    setState(() {
      indexquestion++;
    });
  }

  @override
  Widget build(context) {
    final qst = questions[indexquestion];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              qst.question,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 201, 153, 251),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...qst.getShuffledList().map((item) {
              return Button(
                  answerText: item,
                  tap: () {
                    answerQuestion(item);
                  });
            }),
          ],
        ),
      ),
    );
  }
}
