import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String answerText;
  final void Function() tap;
  const Button({super.key, required this.answerText, required this.tap});

  @override
  Widget build(context) {
    return ElevatedButton(
      onPressed: tap,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 33, 1, 95),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        textStyle: const TextStyle(color: Colors.white, fontSize: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(
        answerText,
        textAlign: TextAlign.center,
      ),
    );
  }
}
