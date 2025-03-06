import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final void Function() tap;
  const Button({super.key, required this.text, required this.tap});

  @override
  Widget build(context) {
    return ElevatedButton(
      onPressed: tap,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 2, 72, 147),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        textStyle: const TextStyle(color: Colors.white, fontSize: 18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
      ),
    );
  }
}
