import 'dart:math';
import 'package:flutter/material.dart';

final randomizer = Random();

class RollDice extends StatefulWidget {
  const RollDice({super.key});

  @override
  State<RollDice> createState() {
    return _RollDiceState();
  }
}

class _RollDiceState extends State<RollDice> {
  var activeDiceImage = 1;

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset('assets/images/dice-images/dice-$activeDiceImage.png',
            width: 200),
        const SizedBox(height: 20),
        TextButton(
          onPressed: () => {
            setState(
              () {
                activeDiceImage = randomizer.nextInt(6) + 1;
              },
            ),
          },
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 28),
          ),
          child: const Text("roll dice"),
        ),
      ],
    );
  }
}
