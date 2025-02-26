import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  final void Function()? switchTo;
  const StartScreen({super.key, required this.switchTo});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset('assets/images/quiz-logo.png',
            height: 200, width: 200, color: Colors.white),
        const SizedBox(height: 20, width: double.infinity),
        const Text(
          'Welcome to the Quiz App',
          style: TextStyle(
              fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20, width: double.infinity),
        ElevatedButton(
          onPressed: switchTo ?? () {},
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(20),
              backgroundColor: Colors.green,
              textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          child: const Text(
            'Start Quiz',
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}
