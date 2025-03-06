import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  final void Function()? startQuiz;

  const StartScreen({super.key, required this.startQuiz});
  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          "assets/images/quiz-logo.png",
          width: 300,
          color: const Color.fromARGB(1500, 255, 255, 255),
        ),
        const SizedBox(height: 30),
        Text(
          "Lear flutter the fun way!",
          style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 237, 223, 252),
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 30),
        OutlinedButton.icon(
          onPressed: startQuiz ?? () {},
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 20),
          ),
          label: const Text("Start Quiz"),
          icon: const Icon(Icons.arrow_right_alt),
        ),
      ],
    );
  }
}
